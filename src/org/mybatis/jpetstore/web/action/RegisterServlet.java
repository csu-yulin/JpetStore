package org.mybatis.jpetstore.web.action;

import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
public class RegisterServlet extends HttpServlet {

    public static String registerMsg;
    private static String username;
    private static String password;
    private static String repeatPassword;
    private static String email;
    private static String vCodeReceive;
    private static String vCode;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("调用了RegisterServlet");
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        HttpSession session=req.getSession();
        username=req.getParameter("username");
        password=req.getParameter("password");
        repeatPassword=req.getParameter("repeatPassword");
        email=req.getParameter("email");
        vCodeReceive=req.getParameter("vcode");
        vCode=(String)session.getAttribute("vCode");

        String isRegister="Yes";
        session.setAttribute("isRegister",isRegister);

        if(!vCodeReceive.equals(vCode)){//用户登录信息有误!!
            Account loginAccount=new Account();
            loginAccount.setUsername(username);
            loginAccount.setPassword(password);
            loginAccount.setEmail(email);
            session.setAttribute("loginAccount",loginAccount);
            resp.setContentType("text/plain");
            PrintWriter out= resp.getWriter();
            registerMsg="验证码错误!";
            out.println(registerMsg);

        }
        else {
            AccountService accountService= new AccountService();
            boolean isAccount=accountService.isAccount(username);
            if(isAccount){//该用户注册过,无法再次注册
                registerMsg="用户名已存在";
                resp.setContentType("text/plain");
                PrintWriter out= resp.getWriter();
                out.println(registerMsg);
            }else{
                //这里需要确定登录界面
                Account loginAccount=new Account();
                loginAccount.setUsername(username);
                loginAccount.setPassword(password);
                loginAccount.setEmail(email);
                session.setAttribute("loginAccount",loginAccount);
                isRegister="Yes";
                session.setAttribute("isRegister",isRegister);
                System.out.println("注册成功一半!将转到完善信息界面");

                resp.setContentType("text/plain");
                PrintWriter out= resp.getWriter();
                registerMsg="0";
                out.print(registerMsg);
                out.close();//输入流提前关闭
            }

        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}