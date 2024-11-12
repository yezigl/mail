/**
 * Copyright 2013 Sohu.com Inc. All Rights Reserved.
 */
package com.sohu.mail.service;

import java.util.Date;
import java.util.Properties;

import jakarta.activation.DataHandler;
import jakarta.activation.FileDataSource;
import jakarta.mail.BodyPart;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Multipart;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;

import org.springframework.stereotype.Service;

@Service
public class SendService {
    private MimeMessage mimeMsg; // MIME邮件对象

    private Session session; // 邮件会话对象

    private Properties props; // 系统属性

    private String username;
    private String password;

    private Multipart multi; // Multipart对象,邮件内容,标题,附件等内容均添加到其中后再生成MimeMessage对象

    // public SendMail() {
    // }
    //
    // public SendMail(String smtp) {
    // setSmtpHost(smtp);
    // createMimeMessage();
    // }

    /**
     * 
     * @param hostName
     *            String
     */
    public void setSMTPHost(String hostName) {
        if (props == null)
            props = new Properties(); // 获得系统属性对象
        props.put("mail.smtp.host", hostName); // 设置SMTP主机
    }

    /**
     * 
     * @return boolean
     */
    public boolean createMimeMessage() {
        try {
            session = Session.getInstance(props, null); // 获得邮件会话对象
            session.setDebug(true);
        } catch (Exception e) {
            System.err.println("获取邮件会话对象时发生错误！" + e);
            return false;
        }
        try {
            mimeMsg = new MimeMessage(session); // 创建MIME邮件对象
            multi = new MimeMultipart(); // 一个multipart对象
            // Multipart is a container that holds multiple body parts.
        } catch (Exception e) {
            System.err.println("创建MIME邮件对象失败！" + e);
            return false;
        }
        return true;
    }

    /**
     * 
     * @param need
     *            boolean
     */
    public void setNeedAuth(boolean need) {
        if (props == null)
            props = new Properties();

        if (need) {
            props.put("mail.smtp.auth", "true");
        } else {
            props.put("mail.smtp.auth", "false");
        }

    }

    /**
     * 
     * @param username
     *            String
     * @param password
     *            String
     */
    public void setUsernameAndPassword(String username, String password) {
        this.username = username;
        this.password = password;
    }

    /**
     * 
     * @param subject
     *            String
     * @return boolean
     */
    public boolean setSubject(String subject) {
        try {
            // sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();
            // mimeMsg.setSubject(enc.encode(subject.getBytes("gbk")));
            // mimeMsg.setSubject( MimeUtility.encodeText(subject,"gbk","B"));
            mimeMsg.setSubject(subject);
        } catch (Exception e) {
            System.err.println("设置邮件主题发生错误！");
            return false;
        }
        return true;
    }

    /**
     * 
     * @param content
     *            String
     */
    public boolean setContent(String content) {
        try {
            BodyPart bp = new MimeBodyPart();// 设置邮件体格式
            bp.setContent(content, "text/html;charset=gbk");
            multi.addBodyPart(bp);
        } catch (Exception e) {
            System.err.println("设置邮件正文时发生错误！" + e);
            return false;
        }
        return true;
    }

    /**
     * 
     * @return
     */
    public boolean setDate() {
        try {
            mimeMsg.setSentDate(new Date());
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 
     * @param filename
     *            String
     */
    public boolean addFileAttachment(String filename) {
        try {
            BodyPart bp = new MimeBodyPart();
            FileDataSource fileds = new FileDataSource(filename);
            bp.setDataHandler(new DataHandler(fileds));
            bp.setFileName(fileds.getName());
            multi.addBodyPart(bp);
        } catch (Exception e) {
            System.err.println("增加邮件附件：" + filename + "发生错误！" + e);
            return false;
        }
        return true;
    }

    /**
     * 
     * @param from
     * @return
     */
    public boolean setFrom(String from) {
        try {
            mimeMsg.setFrom(new InternetAddress(from)); // 设置发信人
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    /**
     * 
     * @param to
     * @return
     */
    public boolean setTo(String to) {
        if (to == null)
            return false;
        try {
            mimeMsg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    /**
     * 
     * @param copyto
     * @return
     */
    public boolean setCopyTo(String copyto) {
        if (copyto == null)
            return false;
        try {
            mimeMsg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(copyto));
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    /**
     * 发送
     * 
     * @return
     */
    public boolean send() {
        try {
            mimeMsg.setContent(multi);
            mimeMsg.saveChanges();
            // Session mailSession = Session.getInstance(props, null);
            Transport transport = session.getTransport("smtp");
            transport.connect((String) props.get("mail.smtp.host"), username, password);
            transport.sendMessage(mimeMsg, mimeMsg.getRecipients(Message.RecipientType.TO));
            // transport.send(mimeMsg);
            transport.close();
        } catch (Exception e) {
            return false;
        }
        return true;
    }
}
