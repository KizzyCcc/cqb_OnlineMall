package pers.cqb.mall.utils.Impl;

import pers.cqb.mall.entity.ForderEntity;
import pers.cqb.mall.entity.UserEntity;
import pers.cqb.mall.utils.MailUtil;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class MailUtilImpl implements MailUtil {
    public static String myEmailAccount = "13806807346@163.com";
    public static String myEmailPassword = "cqb1995";
    public static String myEmailSMTPHost = "smtp.163.com";
    @Override
    public void send_mail(UserEntity user, ForderEntity forder) throws Exception {
        String receiveMailAccount = user.getEmail();
        String date = new Date().toString();

        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", myEmailSMTPHost);
        props.setProperty("mail.smtp.auth", "true");

        Session session = Session.getInstance(props);
        session.setDebug(true);
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(myEmailAccount, "Ego Shopping", "UTF-8"));
        message.setRecipient(MimeMessage.RecipientType.TO,
                new InternetAddress(receiveMailAccount, user.getName(), "UTF-8"));
        message.setRecipient(MimeMessage.RecipientType.CC,
                new InternetAddress(myEmailAccount, "CC_sender", "UTF-8"));
        message.setSubject("消费提醒", "UTF-8");
        message.setContent("您好，您于" + date + "在Ego商城进行消费，"
                + "您的消费总额为" + forder.getTotal() + "，已支付成功，"
                + "您的订单号为" + forder.getId() + "，请等待商品到达，"
                + "欢迎下次光临！",
                "text/html;charset=UTF-8");
        message.setSentDate(new Date());
        message.saveChanges();
        Transport transport = session.getTransport();
        transport.connect(myEmailAccount, myEmailPassword);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }
}
