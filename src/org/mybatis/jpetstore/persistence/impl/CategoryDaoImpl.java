package org.mybatis.jpetstore.persistence.impl;

import org.mybatis.jpetstore.domain.Category;
import org.mybatis.jpetstore.persistence.Util.DBUtil;
import org.mybatis.jpetstore.persistence.Dao.CategoryDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao {
    private static final String  GET_CATEGORY=
            "SELECT CATID AS categoryId, NAME , DESCN AS description FROM CATEGORY WHERE CATID =?";
    private static  final String GET_CATEGORY_LIST=
            "SELECT CATID AS categoryId, NAME , DESCN AS description FROM CATEGORY";

    @Override
    public List<Category> getCategoryList() {
       List<Category> categoryList= new ArrayList<>();
       try {
           Connection connection = DBUtil.getConnection();
           Statement statement=connection.createStatement();
           ResultSet resultSet=statement.executeQuery(GET_CATEGORY_LIST);
           while (resultSet.next()){
               Category category=new Category();
               category.setCategoryId(resultSet.getString("categoryId"));
               category.setName(resultSet.getString("NAME"));
               category.setDescription(resultSet.getString("description"));
               categoryList.add(category);
           }
           DBUtil.closeResultSet(resultSet);
           DBUtil.closeStatement(statement);
           DBUtil.closeConnection(connection);
       }catch (Exception e){
           e.printStackTrace();
       }
       return categoryList;
    }

    @Override
    public Category getCategory(String categoryId) {
        Category category=null;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_CATEGORY);
            preparedStatement.setString(1,categoryId);
            ResultSet resultSet=preparedStatement.executeQuery();
            if (resultSet.next()){
                category=new Category();
                category.setCategoryId(resultSet.getString("categoryId"));
                category.setName(resultSet.getString("NAME"));
                category.setDescription(resultSet.getString("description"));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return category;
    }

    public static void main(String[] args) {
        CategoryDao categoryDao=new CategoryDaoImpl();
        categoryDao.getCategory("1");

    }
}
