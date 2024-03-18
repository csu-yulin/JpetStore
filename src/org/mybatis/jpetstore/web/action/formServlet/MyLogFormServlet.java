package org.mybatis.jpetstore.web.action.formServlet;


import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.domain.MyLog;
import org.mybatis.jpetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "myLogFormServlet", urlPatterns = {"/myLogForm"})

public class MyLogFormServlet extends HttpServlet {
    private static final String MYLOG_FORM="/WEB-INF/jsp/account/mylog.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        HttpSession session=req.getSession();
        AccountService accountService=new AccountService();
        Account loginAccount=new Account();
        loginAccount=(Account) session.getAttribute("loginAccount");
        List<MyLog> myLogList= new ArrayList<>() ;
        myLogList=accountService.getMyLogList(loginAccount.getUsername());
        session.setAttribute("myLogList",myLogList);
        req.getRequestDispatcher(MYLOG_FORM).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
