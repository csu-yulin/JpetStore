package org.mybatis.jpetstore.web.action;

import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.domain.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "MyAccountToCompleteServlet", urlPatterns = {"/MyAccountToCompleteServlet"})
public class MyAccountToCompleteServlet extends HttpServlet {
    private static final String COMPLETE_FORM = "/completeForm";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account loginAccount = (Account) session.getAttribute("loginAccount");
        String oldUsername;
        if (loginAccount != null) {
            oldUsername = loginAccount.getUsername();
        } else {
            oldUsername = null;
        }
        session.setAttribute("oldUsername", oldUsername);
        resp.sendRedirect(req.getContextPath() + COMPLETE_FORM);
//        req.getRequestDispatcher(COMPLETE_FORM).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
