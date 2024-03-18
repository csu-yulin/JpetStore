package org.mybatis.jpetstore.persistence.impl;

import org.mybatis.jpetstore.domain.Product;
import org.mybatis.jpetstore.persistence.Util.DBUtil;
import org.mybatis.jpetstore.persistence.Dao.ProductDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDao {
    private static final String  GET_PRODUCT=
            "SELECT PRODUCTID , NAME , DESCN AS description , CATEGORY as categoryId FROM PRODUCT WHERE PRODUCTID =?";
    private static final String  getProductListByCategoryString=
            "SELECT PRODUCTID , NAME , DESCN AS description , CATEGORY as categoryId FROM PRODUCT WHERE CATEGORY =?";
    private static final String searchProductListString=
            "SELECT PRODUCTID , lower(name) , DESCN AS description , CATEGORY as categoryId FROM PRODUCT";
    @Override
    public List<Product> getProductListByCategory(String categoryId) {
        List<Product> products = new ArrayList<Product>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection
                    .prepareStatement(getProductListByCategoryString);
            pStatement.setString(1, categoryId);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductId(resultSet.getString(1));
                product.setName(resultSet.getString(2));
                product.setDescription(resultSet.getString(3));
                product.setCategoryId(resultSet.getString(4));
                products.add(product);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public Product getProduct(String productId) {
        Product product=null;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_PRODUCT);
            preparedStatement.setString(1,productId);
            ResultSet resultSet=preparedStatement.executeQuery();
            if (resultSet.next()){
                product=new Product();
                product.setProductId(resultSet.getString(1));
                product.setName(resultSet.getString(2));
                product.setDescription(resultSet.getString(3));
                product.setCategoryId(resultSet.getString(4));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return product;
    }

//    @Override
//    public List<Product> searchProductList(String keywords) {
//        List<Product> productList = new ArrayList<Product>();
//
//        try {
//            Connection connection = DBUtil.getConnection();
//            PreparedStatement pStatement = connection
//                    .prepareStatement(searchProductListString);
//            pStatement.setString(1, keywords);
//            ResultSet resultSet = pStatement.executeQuery();
//            while (resultSet.next()) {
//                Product product = new Product();
//                product.setProductId(resultSet.getString(1));
//                product.setName(resultSet.getString(2));
//                product.setDescription(resultSet.getString(3));
//                product.setCategoryId(resultSet.getString(4));
//                productList.add(product);
//            }
//            DBUtil.closeResultSet(resultSet);
//            DBUtil.closePreparedStatement(pStatement);
//            DBUtil.closeConnection(connection);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return productList;
//    }
@Override
public List<Product> searchProductList(String keywords) {
    List<Product> productList = new ArrayList<Product>();

    try {
        Connection connection = DBUtil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(searchProductListString);
        while (resultSet.next()) {
            if(resultSet.getString(2).contains(keywords)){
                Product product = new Product();
                product.setProductId(resultSet.getString(1));
                product.setName(resultSet.getString(2));
                product.setDescription(resultSet.getString(3));
                product.setCategoryId(resultSet.getString(4));
                productList.add(product);
            }
        }
        DBUtil.closeResultSet(resultSet);
        DBUtil.closeStatement(statement);
        DBUtil.closeConnection(connection);
    } catch (Exception e) {
        e.printStackTrace();
    }

   return productList;
}

    public static void main(String[] args) {
        ProductDao productDao=new ProductDaoImpl();
        List<Product> productList=productDao.searchProductList("%o%");
        System.out.println(productList.size());

    }
}
