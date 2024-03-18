package org.mybatis.jpetstore.web.action;

import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.persistence.Util.EmailUtil;
import org.mybatis.jpetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

@WebServlet(name = "EmailServlet", urlPatterns = {"/EmailServlet"})
public class EmailServlet extends HttpServlet {

    private String email;  // 获取的收件人邮箱
    private String vCode;  // 后台产生的验证码
    private String password;  // 后台产生的验证码
    private String username;  // 后台产生的验证码
    private String repeatPassword;  // 后台产生的验证码
    private String vCodeReceive;  // 接收到前端输入的验证码
    private String method;  // 要接收的方法
    private PrintWriter out;  // 输出流
    private EmailUtil emailUtil = new EmailUtil();
    private static final String LOGIN_FORM = "loginForm";
    private static final String REGISTER_FORM = "registerForm";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        resp.setContentType("text/html");
//        req.setCharacterEncoding("utf-8");
//        resp.setCharacterEncoding("utf-8");
//
////        out = resp.getWriter();
//        // 获取来自前端的参数
        String isRegister=(String)session.getAttribute("isRegister");
        if(isRegister==null){//登录界面请求验证码
            email = req.getParameter("email");
            password = req.getParameter("password");
//            if(!isEmail(email)) {  // 邮箱不正确
//                String loginMsg="您当前的邮箱地址是无效的";
//                Account loginAccount=null;
//                session.setAttribute("loginAccount",loginAccount);
//                session.setAttribute("loginMsg",loginMsg);
////            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
//                resp.sendRedirect(LOGIN_FORM);
//            }else{
                mGetVCode();//发送验证码
                Account loginAccount=new Account();
                loginAccount.setEmail(email);
                loginAccount.setPassword(password);
                String loginMsg=null;
                session.setAttribute("loginAccount",loginAccount);
                session.setAttribute("loginMsg",loginMsg);
                session.setAttribute("vCode",vCode);
                resp.sendRedirect(LOGIN_FORM);
//            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);

//            }
        }else{

            email = req.getParameter("email");
            password = req.getParameter("password");
//            repeatPassword = req.getParameter("repeatPassword");
            username = req.getParameter("username");

//            if(!password.equals(repeatPassword)) {  // 您输入的两次密码不相同请重新输入
//                String registerMsg="您输入的两次密码不相同请重新输入";
//                Account loginAccount=new Account();
//                loginAccount.setUsername(username);
//                loginAccount.setEmail(email);
//                session.setAttribute("loginAccount",loginAccount);
//                session.setAttribute("registerMsg",registerMsg);
////            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
//                resp.sendRedirect(REGISTER_FORM);
//            }else if(!isEmail(email)) {  // 邮箱不正确
//                String registerMsg="您当前的邮箱地址是无效的";
//                session.setAttribute("registerMsg",registerMsg);
//                System.out.println(registerMsg);
//                Account loginAccount=new Account();
//                loginAccount.setUsername(username);
//                loginAccount.setPassword(password);
//                session.setAttribute("loginAccount",loginAccount);
////            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
//                resp.sendRedirect(REGISTER_FORM);
//            } else{
                mGetVCode();//发送验证码
                Account loginAccount=new Account();
                loginAccount.setEmail(email);
                loginAccount.setUsername(username);
                loginAccount.setPassword(password);
                String registerMsg=null;
                session.setAttribute("loginAccount",loginAccount);
                session.setAttribute("registerMsg",registerMsg);
                session.setAttribute("vCode",vCode);
                resp.sendRedirect(REGISTER_FORM);
//            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);

//            }
        }

//        method = req.getParameter("method");
//
//        if(method.equals("getVCode")){
//            mGetVCode();//获取验证码
//        }else{
//            mVerify();//验证
//        }
//
//        out.flush();
//        out.close();
    }

    /*
     * 产生验证码，并发送邮件
     */
    private void mGetVCode() {
        try {
            emailUtil.sendEmail(email);//把正确的邮箱地址送过去给用户发送验证码
        } catch (Exception e) {
            e.printStackTrace();
        }
        vCode = emailUtil.getVCode();//获取刚才发送的验证码
        System.out.println("验证码为：" + vCode);//在本地控制输出验证码
    }
//
//    /*
//     * 邮箱正确性检测
//     * @param 邮箱字符串
//     * @return true/false
//     */
    private boolean isEmail(String email) {
        if(email.length() == 0 || email == null) {

            return false;
        }
        // 正则表达式验证邮箱
        Pattern pattern = Pattern.compile("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$");
        return pattern.matcher(email).matches();
    }
//
    /*
     * 验证码验证
     */
    private void mVerify() {
//        if(vCode.equals(vCodeReceive)) {
//            out.print(1);
//        }
//        else {
//            out.print(-1);
//        }
    }
//    @Override
//    public void destroy() {
//        super.destroy();
//    }
//
//    @Override
//    public void init() throws ServletException {
//        super.init();
//    }
}
