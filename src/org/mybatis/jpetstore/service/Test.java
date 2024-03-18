package org.mybatis.jpetstore.service;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
    public static void main(String[] args) {
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
        String str=dateFormat.format(date);
        System.out.println(dateFormat.format(date));
    }
}
