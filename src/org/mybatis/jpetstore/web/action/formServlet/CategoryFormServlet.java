package org.mybatis.jpetstore.web.action.formServlet;

import org.mybatis.jpetstore.domain.Category;
import org.mybatis.jpetstore.domain.Product;
import org.mybatis.jpetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class CategoryFormServlet extends HttpServlet {
    private static final String CATEGORY_FORM="/WEB-INF/jsp/catalog/category.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId=req.getParameter("categoryId");
        CatalogService catalogService= new CatalogService();
        Category category=catalogService.getCategory(categoryId);
        List<Product> productList=catalogService.getProductListByCategory(categoryId);
        HttpSession session=req.getSession();
        session.setAttribute("category",category);
        session.setAttribute("productList",productList);

        req.getRequestDispatcher(CATEGORY_FORM).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
