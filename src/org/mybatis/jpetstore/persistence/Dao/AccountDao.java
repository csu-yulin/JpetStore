package org.mybatis.jpetstore.persistence.Dao;

import org.mybatis.jpetstore.domain.Account;
import org.mybatis.jpetstore.domain.MyLog;

import java.util.List;

public interface AccountDao {
     Account getAccountByUsernameAndPassword(Account account);

     Account getAccountByUsername(String username);

     void insertAccount(Account account);

     void insertProfile(Account account);

     void insertSignon(Account account);

     boolean isAccount(String username);

     void deleteAccount(String username);

     String getUsernameByEmail(String email);

     void insertUserBehavior(MyLog myLog);

     List<MyLog> findAllLog(String username);



     void updateAccount(Account account);

     void updateProfile(Account account);

     void updateSignon(Account account);
}