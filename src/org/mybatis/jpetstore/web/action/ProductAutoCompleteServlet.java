package org.mybatis.jpetstore.web.action;

import org.mybatis.jpetstore.domain.Product;
import org.mybatis.jpetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class ProductAutoCompleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword =req.getParameter("keyword");
        CatalogService catalogService =new CatalogService();
        List<Product> productList=catalogService.searchProductList(keyword);

        String result=JSON.toJSONString(productList);
        System.out.println(result);
        resp.setContentType("text/json");
        PrintWriter printWriter=resp.getWriter();
        printWriter.println(result);
    }
}
