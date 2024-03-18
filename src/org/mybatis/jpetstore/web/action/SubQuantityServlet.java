package org.mybatis.jpetstore.web.action;

import org.mybatis.jpetstore.domain.Cart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SubQuantityServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        Cart cart= (Cart) session.getAttribute("cart");
        String workingItemId=req.getParameter("workingItemId");
        cart.subQuantityByItemId(workingItemId);


    }
}
