package org.mybatis.jpetstore.web.action.formServlet;

import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.domain.Order;
import org.mybatis.jpetstore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ListOrderFormServlet extends HttpServlet {
    private static final String ORDERLIST_FORM = "/WEB-INF/jsp/order/ListOrders.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderService orderService=new OrderService();
        HttpSession session=req.getSession();

        Account loginAccount=(Account) session.getAttribute("loginAccount");
        List<Order> orderList=orderService.getOrdersByUsername(loginAccount.getUsername());

        session.setAttribute("orderList",orderList);
        req.getRequestDispatcher(ORDERLIST_FORM).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
