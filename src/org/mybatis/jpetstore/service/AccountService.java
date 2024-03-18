package org.mybatis.jpetstore.service;


import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.domain.MyLog;
import org.mybatis.jpetstore.persistence.Dao.AccountDao;
import org.mybatis.jpetstore.persistence.impl.AccountDaoImpl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

public class AccountService {
    private static AccountDao accountDao;


    public Account getAccount(String username,String password){
        accountDao=new AccountDaoImpl();
        Account account=new Account();
        account.setUsername(username);
        account.setPassword(password);
        return accountDao.getAccountByUsernameAndPassword(account);
    }

    public void insertAccount(Account account) {
        accountDao=new AccountDaoImpl();
        accountDao.insertAccount(account);
        accountDao.insertProfile(account);
        accountDao.insertSignon(account);
    }

    public boolean isAccount(String username){
        accountDao=new AccountDaoImpl();
        return accountDao.isAccount(username);
    }
    public void deleteAccount(String username){
        accountDao=new AccountDaoImpl();
        accountDao.deleteAccount(username);
    }
    public String getUsername(String email){
        accountDao=new AccountDaoImpl();
       return accountDao.getUsernameByEmail(email);
    }

    public static String getCurrentTime(){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String currentTime=df.format(new Date());// new Date()为获取当前系统时间
        return currentTime;
    }
    //三个方法,这里只要他传进来一个id,在调用相应的方法,就能直接存入数据库
    public void browseGoods(String username,String product){//浏览商品
        MyLog mylog=new MyLog();
        mylog.setUsername(username);
        mylog.setBehavior("浏览了<a href=\"itemForm?itemId="+product+"\">"+product+"</a>");
        mylog.setTime(getCurrentTime());
        accountDao=new AccountDaoImpl();
        accountDao.insertUserBehavior(mylog);
    }
    public void addGoods(String username,String product){//加入商品
        MyLog mylog=new MyLog();
        mylog.setUsername(username);
        mylog.setBehavior("将<a href=\"itemForm?itemId="+product+"\">"+product+"</a>加入了购物车");
        mylog.setTime(getCurrentTime());
        accountDao=new AccountDaoImpl();
        accountDao.insertUserBehavior(mylog);
    }
    public void buyGoods(String username,String product){//购买商品
        MyLog mylog=new MyLog();
        mylog.setUsername(username);
        mylog.setBehavior("购买了<a href=\"itemForm?itemId="+product+"\">"+product+"</a>");
        mylog.setTime(getCurrentTime());
        accountDao=new AccountDaoImpl();
        accountDao.insertUserBehavior(mylog);
    }

    public void deleteGoods(String username,String product){
        MyLog mylog=new MyLog();
        mylog.setUsername(username);
        mylog.setBehavior("将<a href=\"itemForm?itemId="+product+"\">"+product+"</a>从购物车中移除了");
        mylog.setTime(getCurrentTime());
        accountDao=new AccountDaoImpl();
        accountDao.insertUserBehavior(mylog);
    }

    public List<MyLog> getMyLogList(String username){
        accountDao=new AccountDaoImpl();
        List<MyLog> myLogList= new ArrayList<>() ;
        myLogList=  accountDao.findAllLog(username);
        return myLogList;
    }

//    public static void main(String[] args) {
//        AccountService a=new AccountService();
//        a.browseGoods("songtie","homework");
//        a.addGoods("songtie","homework");
//        a.buyGoods("songtie","homework");
//    }
}
