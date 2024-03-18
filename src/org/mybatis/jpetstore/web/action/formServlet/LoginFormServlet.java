package org.mybatis.jpetstore.web.action.formServlet;

import com.sun.net.httpserver.HttpServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "loginFormServlet", urlPatterns ={"/loginForm"})
public class LoginFormServlet extends HttpServlet {
    private static final String LOGIN_FORM = "/WEB-INF/jsp/account/login.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String isRegister=null;
        session.setAttribute("isRegister",isRegister);
        req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
