package org.mybatis.jpetstore.persistence.Util;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

public class EmailUtil {
    private static String fromEmail = "2973288539@qq.com";  // 发件人账号
    private static String fromEmailPw = "ubuwxjakcqtdddhi";  // 发件人密码
    private static String myEmailSMTPHost = "smtp.qq.com";  // 发件邮箱服务器
    private static Properties props;  // 用于参数配置
    private static Session session;  // 用于创建会话对象
    private String vCode;
    public String getVCode() {
        return vCode;
    }
    public EmailUtil() {
        props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");  // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", myEmailSMTPHost);  // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");  // 需要请求认证
        session = Session.getInstance(props);
    }
    public MimeMessage createMailContent(String toEmail) throws Exception, MessagingException {
        MimeMessage message = new MimeMessage(session);
        // 发件人
        message.setFrom(new InternetAddress(fromEmail, "验证码发送系统", "UTF-8"));
        // 收件人
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(toEmail));
        // 邮件主题
        message.setSubject("验证码", "UTF-8");
        // 邮件正文
        vCode = verifyCode(6);
        message.setContent("您好，您的验证码是："+vCode+"。", "text/html;charset=UTF-8");
        // 设置发件时间
        message.setSentDate(new Date());
        // 保存设置
        message.saveChanges();
        return message;
    }
    public void sendEmail(String toEmail) throws Exception {
        Transport transport = session.getTransport();
        transport.connect(fromEmail, fromEmailPw);
        MimeMessage message = createMailContent(toEmail);  // 邮件内容
        transport.sendMessage(message, message.getAllRecipients());
        System.out.println("验证码发送成功！");
        // 关闭连接
        transport.close();
    }
    public static String verifyCode(int n) {
        StringBuilder strB = new StringBuilder();
        Random rand = new Random();
        for(int i = 0; i < n; i++) {
            int r1 = rand.nextInt(3);
            int r2 = 0;
            switch (r1) {  // r2为ascii码值
                case 0: // 数字
                    r2 = rand.nextInt(10) + 48;  // 数字：48-57的随机数
                    break;
                case 1:
                    r2 = rand.nextInt(26) + 65;  // 大写字母
                    break;
                case 2:
                    r2 = rand.nextInt(26) + 97;  // 小写字母
                    break;
                default:
                    break;
            }
            strB.append((char)r2);
        }
        return strB.toString();
    }
}
