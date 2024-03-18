package org.mybatis.jpetstore.web.action;

import org.mybatis.jpetstore.domain.Cart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddQuantityServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        Cart cart= (Cart) session.getAttribute("cart");
        String workingItemId=req.getParameter("workingItemId");
        cart.incrementQuantityByItemId(workingItemId);

        String result="[{\"categoryId\":\"FISH\",\"description\":\"<image src=\\\"images/fish1.gif\\\">Salt Water fish from Australia\",\"name\":\"angelfish\",\"productId\":\"FI-SW-01\"},{\"categoryId\":\"CATS\",\"description\":\"<image src=\\\"images/cat1.gif\\\">Friendly house cat, doubles as a princess\",\"name\":\"persian\",\"productId\":\"FL-DLH-02\"},{\"categoryId\":\"CATS\",\"description\":\"<image src=\\\"images/cat2.gif\\\">Great for reducing mouse populations\",\"name\":\"manx\",\"productId\":\"FL-DSH-01\"},{\"categoryId\":\"REPTILES\",\"description\":\"<image src=\\\"images/lizard1.gif\\\">Friendly green friend\",\"name\":\"iguana\",\"productId\":\"RP-LI-02\"}]";
    }
}
