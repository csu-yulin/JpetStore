package org.mybatis.jpetstore.web.action.formServlet;

import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.domain.Cart;
import org.mybatis.jpetstore.domain.CartItem;
import org.mybatis.jpetstore.domain.Order;
import org.mybatis.jpetstore.service.AccountService;
import org.mybatis.jpetstore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class ViewOrderFormServlet extends HttpServlet {
    private static final String VIEWORDER_FORM="/WEB-INF/jsp/order/ViewOrder.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        OrderService orderService=new OrderService();
        AccountService accountService=new AccountService();
        boolean confirmed=req.getParameter("confirmed").equals("true");
        Account loginAccount=(Account) session.getAttribute("loginAccount");

        Cart cart=(Cart) session.getAttribute("cart");
        if (confirmed){
            Order order=(Order) session.getAttribute("order");



            orderService.insertOrder(order);
            if(cart!=null){
                List<CartItem> cartItems=cart.getCartItemList();
                for(CartItem item:cartItems){
                    accountService.buyGoods(loginAccount.getUsername(),item.getItem().getItemId());
                }
                cart.removeAll();
                session.setAttribute("cart",cart);
            }
            req.getRequestDispatcher(VIEWORDER_FORM).forward(req,resp);
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
