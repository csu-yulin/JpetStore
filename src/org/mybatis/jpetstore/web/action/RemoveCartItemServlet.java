package org.mybatis.jpetstore.web.action;

import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.domain.Cart;
import org.mybatis.jpetstore.domain.Item;
import org.mybatis.jpetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RemoveCartItemServlet extends HttpServlet {
    private static final String CART_FORM="/WEB-INF/jsp/cart/cart.jsp";
    private static final String ERROR_FORM="/WEB-INF/jsp/common/error.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        Cart cart= (Cart) session.getAttribute("cart");
        Account loginAccount=(Account) session.getAttribute("loginAccount");
        AccountService accountService=new AccountService();
        String workingItemId =req.getParameter("workingItemId");
        if (loginAccount!=null){
            accountService.deleteGoods(loginAccount.getUsername(),workingItemId);
            System.out.println("删除");
        }
        Item item=cart.removeItemById(workingItemId);
        if(item==null){
            session.setAttribute("errorMsg","删除空了");
            req.getRequestDispatcher(ERROR_FORM).forward(req,resp);
        }
        else {
            req.getRequestDispatcher(CART_FORM).forward(req,resp);
            System.out.println("删除成功");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
