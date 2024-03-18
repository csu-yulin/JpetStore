package org.mybatis.jpetstore.web.action.formServlet;

import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.domain.Cart;
import org.mybatis.jpetstore.domain.Order;
import org.mybatis.jpetstore.domain.Product;
import org.mybatis.jpetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class NewOrderFormServlet extends HttpServlet {
    private static final String NEWORDER_FORM="/WEB-INF/jsp/order/newOrderForm.jsp";
    private static final String LOGIN_FORM="/WEB-INF/jsp/account/login.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        HttpSession session=req.getSession();
        Cart cart= (Cart) session.getAttribute("cart");
        Account loginAccount =(Account) session.getAttribute("loginAccount");
        if(loginAccount==null){
//            session.setAttribute("loginMsg","您还未登录");
//            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);

            resp.setContentType("text/plain");
            PrintWriter out= resp.getWriter();
            out.print("0");//未登录
        }else {
//            req.getRequestDispatcher(NEWORDER_FORM).forward(req,resp);

            resp.setContentType("text/plain");
            PrintWriter out= resp.getWriter();
            out.print("1");//已登录
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
