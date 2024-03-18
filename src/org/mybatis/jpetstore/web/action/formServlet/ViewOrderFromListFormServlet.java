package org.mybatis.jpetstore.web.action.formServlet;

import org.mybatis.jpetstore.domain.Order;
import org.mybatis.jpetstore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ViewOrderFromListFormServlet extends HttpServlet {
    private static final String VIEWORDER_FORM="/WEB-INF/jsp/order/ViewOrder.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        OrderService orderService=new OrderService();
        if (req.getParameter("orderId")!=null){
            int orderId=Integer.valueOf (req.getParameter("orderId")).intValue();
            Order order=orderService.getOrder(orderId);
            session.setAttribute("order",order);
        }
        req.getRequestDispatcher(VIEWORDER_FORM).forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
