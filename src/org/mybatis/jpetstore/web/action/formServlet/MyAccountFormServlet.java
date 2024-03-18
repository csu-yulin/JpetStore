package org.mybatis.jpetstore.web.action.formServlet;

import org.mybatis.jpetstore.domain.Item;
import org.mybatis.jpetstore.domain.Product;
import org.mybatis.jpetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "myAccountFormServlet", urlPatterns = {"/myAccountForm"})
public class MyAccountFormServlet extends HttpServlet {
    private static final String MYACCOUNT_FORM="/WEB-INF/jsp/account/myaccount.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        HttpSession session=req.getSession();
//        session.setAttribute("itemList",itemList);

//        resp.sendRedirect(req.getContextPath()+MYACCOUNT_FORM);
        req.getRequestDispatcher(MYACCOUNT_FORM).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }

}
