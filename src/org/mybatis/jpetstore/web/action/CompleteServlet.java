package org.mybatis.jpetstore.web.action;

import org.mybatis.jpetstore.domain.Account;
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

@WebServlet(name = "completeServlet", urlPatterns = {"/completeServlet"})
public class CompleteServlet extends HttpServlet {
    public static String completeMsg;
    public static Account account;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getFormData(req);
        HttpSession session=req.getSession();
        AccountService accountService=new AccountService();
        session.setAttribute("loginAccount",account);
        if(account.isListOption()){
            CatalogService catalogService = new CatalogService();
            List<Product> myList = catalogService.getProductListByCategory(account.getFavouriteCategoryId());
            session.setAttribute("myList", myList);
        }
        String isRegister=(String)session.getAttribute("isRegister");
        if(isRegister==null){//是已经登陆
            session.setAttribute("isRegister",isRegister);
            String oldUsername=(String)session.getAttribute("oldUsername");
            accountService.deleteAccount(oldUsername);
            accountService.insertAccount(account);
            Account account1=accountService.getAccount(account.getUsername(),account.getPassword());
            session.setAttribute("loginAccount",account1);

            System.out.println("修改成功!!将转到主界面");
        }else{//通过注册界面转来的
            isRegister=null;
            session.setAttribute("isRegister",isRegister);
            accountService.insertAccount(account);
            System.out.println("注册成功!!将转到主界面");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    public static void getFormData(HttpServletRequest req){
        account=new Account();
        HttpSession session=req.getSession();

        String isRegister=(String)session.getAttribute("isRegister");
        if(isRegister==null){//是已经登陆
            account.setUsername(req.getParameter("username"));
            account.setPassword(req.getParameter("password"));
            account.setEmail(req.getParameter("email"));

        }else{//通过注册界面转来的
            Account loginAccount=(Account)session.getAttribute("loginAccount");
            account.setUsername(loginAccount.getUsername());
            account.setPassword(loginAccount.getPassword());
            account.setEmail(loginAccount.getEmail());
        }

        account.setAddress1(req.getParameter("address1"));
        account.setAddress2(req.getParameter("address2"));
        account.setCity(req.getParameter("city"));
        account.setCountry(req.getParameter("country"));
        account.setPhone(req.getParameter("phone"));
        account.setState("CA");
        account.setZip(req.getParameter("zip"));
        account.setListOption(((req.getParameter("listOption")).equals("false")?false:true));
        account.setBannerOption(((req.getParameter("bannerOption")).equals("false")?false:true));
        account.setFirstName(req.getParameter("firstName"));
        account.setLastName(req.getParameter("lastName"));

        account.setLanguagePreference(req.getParameter("languagePreference"));
        account.setFavouriteCategoryId(req.getParameter("favouriteCategoryId"));
        account.setStatus("OK");//这是干嘛用的
    }
}
