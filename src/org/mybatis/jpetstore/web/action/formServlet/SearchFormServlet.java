package org.mybatis.jpetstore.web.action.formServlet;

import org.mybatis.jpetstore.domain.Category;
import org.mybatis.jpetstore.domain.Item;
import org.mybatis.jpetstore.domain.Product;
import org.mybatis.jpetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class SearchFormServlet extends HttpServlet {
    private static final String SEARCH_FORM="/WEB-INF/jsp/catalog/search.jsp";
    private static final String MAIN_FORM="/WEB-INF/jsp/main.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchString=req.getParameter("keyword");
        if(searchString==null||searchString.equals("")){
            String searchErrorMsg="搜索不能为空";
            req.setAttribute("searchErrorMsg",searchErrorMsg);
            req.getRequestDispatcher(MAIN_FORM).forward(req,resp);
        }else{
            CatalogService catalogService= new CatalogService();
            List<Product> productList=catalogService.searchProductList(searchString);
            HttpSession session=req.getSession();
            session.setAttribute("productList",productList);

            req.getRequestDispatcher(SEARCH_FORM).forward(req,resp);
        }

    }
}
