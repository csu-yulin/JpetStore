package org.mybatis.jpetstore.web.action;

import org.mybatis.jpetstore.domain.Cart;
import org.mybatis.jpetstore.domain.CartItem;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;

public class UpdateCartServlet extends HttpServlet {
    private static final String CART_FORM="/WEB-INF/jsp/cart/cart.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session=req.getSession();
        Cart cart= (Cart) session.getAttribute("cart");
        Iterator<CartItem> cartItems=cart.getAllCartItems();
        while (cartItems.hasNext())
        {
            CartItem cartItem=cartItems.next();
            try {
                String quantityString=req.getParameter(cartItem.getItem().getItemId());
                int quantity=Integer.parseInt(quantityString);

                cartItem.setQuantity(quantity);
                if (quantity<1){
                    cartItems.remove();
                }
            }catch (Exception e){

            }
        }
        req.getRequestDispatcher(CART_FORM).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
