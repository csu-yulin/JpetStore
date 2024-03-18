package org.mybatis.jpetstore.web.action.formServlet;

import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.domain.Item;
import org.mybatis.jpetstore.domain.Product;
import org.mybatis.jpetstore.service.AccountService;
import org.mybatis.jpetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ItemFormServlet extends HttpServlet {
    private static final String ITEM_FORM="/WEB-INF/jsp/catalog/item.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AccountService accountService=new AccountService();
        String itemId=req.getParameter("itemId");
        CatalogService catalogService= new CatalogService();
        Item item=catalogService.getItem(itemId);
        Product product=item.getProduct();

        HttpSession session=req.getSession();
        session.setAttribute("product",product);
        session.setAttribute("item",item);
        Account loginAccount=(Account) session.getAttribute("loginAccount");
        if (loginAccount!=null){
            accountService.browseGoods(loginAccount.getUsername(),itemId);
        }

        req.getRequestDispatcher(ITEM_FORM).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
