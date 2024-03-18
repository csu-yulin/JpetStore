package org.mybatis.jpetstore.web.action.formServlet;

import org.mybatis.jpetstore.domain.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "registerFormServlet", urlPatterns = {"/registerForm"})
public class RegisterFormServlet extends HttpServlet {
    private static final String REGISTER_FORM = "/WEB-INF/jsp/account/register.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String isRegister=(String)session.getAttribute("isRegister");

        if(isRegister==null){
            Account loginAccount = null;
            session.setAttribute("loginAccount",loginAccount);
        }
        isRegister="Yes";
        session.setAttribute("isRegister", isRegister);

        req.getRequestDispatcher(REGISTER_FORM).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
