package pers.cqb.test;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class MailTest {
    public static String myEmailAccount = "13806807346@163.com";
    public static String myEmailPassword = "cqb19951230";
    public static String myEmailSMTPHost = "smtp.163.com";
    public static String receiveMailAccount = "925647454@qq.com";


    public static void main(String args[]) throws Exception {
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", myEmailSMTPHost);
        props.setProperty("mail.smtp.auth", "true");

        Session session = Session.getInstance(props);
        session.setDebug(true);
        MimeMessage message = createMimeMessage(session, myEmailAccount, receiveMailAccount);
        Transport transport = session.getTransport();
        transport.connect(myEmailAccount, myEmailPassword);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();


    }

    public static MimeMessage createMimeMessage(Session session, String myEmailAccount, String receiveMailAccount) throws Exception {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(myEmailAccount, "sender", "UTF-8"));
        message.setRecipient(MimeMessage.RecipientType.TO,
                new InternetAddress(receiveMailAccount, "receiver", "UTF-8"));
        message.setRecipient(MimeMessage.RecipientType.CC,
                new InternetAddress(myEmailAccount, "CC_sender", "UTF-8"));
        message.setSubject("消费提醒", "UTF-8");
        message.setContent("你好，我是陈庆斌，交个朋友吧！", "text/html;charset=UTF-8");
        message.setSentDate(new Date());
        message.saveChanges();
        return message;
    }
}
