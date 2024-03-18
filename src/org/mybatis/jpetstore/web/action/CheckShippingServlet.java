package org.mybatis.jpetstore.web.action;

import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.domain.Cart;
import org.mybatis.jpetstore.domain.Order;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class CheckShippingServlet extends HttpServlet {
    private static final String CONFIRM_FORM="/WEB-INF/jsp/order/confirmOrder.jsp";
    private static final String SHIPPING_FORM="/WEB-INF/jsp/order/ShippingForm.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        Account loginAccount=(Account) session.getAttribute("loginAccount") ;
        Cart cart=(Cart) session.getAttribute("cart") ;
        Order order=new Order();
        order.initOrder(loginAccount,cart);
        order.setCardType(req.getParameter("order.cardType"));
        order.setCreditCard(req.getParameter("order.creditCard"));
        order.setExpiryDate(req.getParameter("order.expiryDate"));
        order.setBillToFirstName(req.getParameter("order.billToFirstName"));
        order.setBillToLastName(req.getParameter("order.billToLastName"));
        order.setBillAddress1(req.getParameter("order.billAddress1"));
        order.setBillAddress2(req.getParameter("order.billAddress2"));
        order.setBillCity(req.getParameter("order.billCity"));
        order.setBillState(req.getParameter("order.billState"));
        order.setBillZip(req.getParameter("order.billZip"));
        order.setBillCountry(req.getParameter("order.billCountry"));
        session.setAttribute("order",order);
        boolean shippingSelected=req.getParameter("shippingAddressRequired")!=null;//选了为true
        session.setAttribute("shippingSelected",shippingSelected);

        if (shippingSelected){
            resp.setContentType("text/plain");
            PrintWriter out= resp.getWriter();
            out.print("0");
//            req.getRequestDispatcher(SHIPPING_FORM).forward(req,resp);
        }
        else{
            resp.setContentType("text/plain");
            PrintWriter out= resp.getWriter();
            out.print("1");
//            req.getRequestDispatcher(CONFIRM_FORM).forward(req,resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
