package org.mybatis.jpetstore.web.action.formServlet;

import org.mybatis.jpetstore.domain.Cart;
import org.mybatis.jpetstore.domain.Order;
import org.mybatis.jpetstore.domain.Product;
import org.mybatis.jpetstore.service.CatalogService;
import org.mybatis.jpetstore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class ConfirmOrderFormServlet extends HttpServlet {
    private static final String CONFIRM_FORM="/WEB-INF/jsp/order/confirmOrder.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        Order order=(Order) session.getAttribute("order");

        boolean shippingSelected=(boolean) session.getAttribute("shippingSelected");
        if(shippingSelected){

            order.setShipToFirstName(req.getParameter("order.shipToFirstName"));
            order.setShipToLastName(req.getParameter("order.shipToLastName"));
            order.setShipAddress1(req.getParameter("order.shipAddress1"));
            order.setShipAddress2(req.getParameter("order.shipAddress2"));
            order.setShipCity(req.getParameter("order.shipCity"));
            order.setShipState(req.getParameter("order.shipState"));
            order.setShipZip(req.getParameter("order.shipZip"));
            order.setShipCountry(req.getParameter("order.shipCountry"));
        }
        session.setAttribute("order",order);

        resp.setContentType("text/plain");
        PrintWriter out= resp.getWriter();
        out.print("1");
//        req.getRequestDispatcher(CONFIRM_FORM).forward(req,resp);
    }
}
