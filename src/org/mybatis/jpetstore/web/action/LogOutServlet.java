package org.mybatis.jpetstore.web.action;

import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.domain.Cart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.PasswordAuthentication;
import java.sql.DriverManager;

public class LogOutServlet  extends HttpServlet {
    private static final String MAIN_FORM = "/WEB-INF/jsp/main.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        Cart cart=(Cart) session.getAttribute("cart") ;
        Account loginAccount = null;
        if (cart!=null&&cart.getNumberOfItems()>0){
            cart.removeAll();
        }
        session.setAttribute("loginAccount",loginAccount);
        session.setAttribute("cart",cart);
        req.getRequestDispatcher(MAIN_FORM).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
