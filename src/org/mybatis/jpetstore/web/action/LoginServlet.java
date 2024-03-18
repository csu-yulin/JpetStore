package org.mybatis.jpetstore.web.action;


import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.domain.MyLog;
import org.mybatis.jpetstore.domain.Product;
import org.mybatis.jpetstore.service.AccountService;
import org.mybatis.jpetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})

public class LoginServlet extends HttpServlet {

    public static String loginMsg="";
    private static String email;
    private static String password;
    private static String vCodeReceive;
    private static String vCode;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("调用了LoginServlet");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        HttpSession session=req.getSession();
        email=req.getParameter("email");
        password=req.getParameter("password");
        vCodeReceive=req.getParameter("vcode");
        vCode=(String)session.getAttribute("vCode");

        String isRegister=null;
        session.setAttribute("isRegister",isRegister);

        if(!vCodeReceive.equals(vCode)){//用户登录信息有误!!
            Account loginAccount=new Account();
            loginAccount.setEmail(email);
            loginAccount.setPassword(password);
            session.setAttribute("loginAccount",loginAccount);
            resp.setContentType("text/plain");
            PrintWriter out= resp.getWriter();
            loginMsg="验证码错误!";
            out.print(loginMsg);
        }
        else {
            AccountService accountService= new AccountService();
            String username=accountService.getUsername(email);
            Account loginAccount=accountService.getAccount(username,password);
            if(loginAccount==null){
                loginMsg="用户名或密码错误";
                session.setAttribute("loginAccount",loginAccount);
                resp.setContentType("text/plain");
                PrintWriter out= resp.getWriter();
                out.print(loginMsg);
            }
            else {
                loginAccount.setEmail(email);
                session.setAttribute("loginAccount",loginAccount);

                if(loginAccount.isListOption()){
                    CatalogService catalogService = new CatalogService();
                    List<Product> myList = catalogService.getProductListByCategory(loginAccount.getFavouriteCategoryId());
                    session.setAttribute("myList", myList);
                }
                isRegister=null;//没有通过注册进入主界面
                session.setAttribute("isRegister",isRegister);
                System.out.println("登录成功!将转到主界面");

                resp.setContentType("text/plain");
                PrintWriter out= resp.getWriter();
                loginMsg="0";
                out.print(loginMsg);
                out.close();//输入流提前关闭
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
