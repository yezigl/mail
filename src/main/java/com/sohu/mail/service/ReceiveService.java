/**
 * Copyright 2013 Sohu.com Inc. All Rights Reserved.
 */
package com.sohu.mail.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.URLName;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.sohu.mail.model.Mail;

@Service
public class ReceiveService {
    
    @Resource
    MailService mailService;

    public void receiveIMAP(String host, String username, String password) {
        // Create empty Properties
        Properties props = new Properties();
        // Get Session
        Session session = Session.getDefaultInstance(props, null);
        // Get Store
        try {
            Store store = session.getStore("imap");
            store.connect(host, username, password);

            // Get Folder
            Folder folder = store.getFolder("INBOX");
            folder.open(Folder.READ_ONLY);

            // Get Directory
            Message message[] = folder.getMessages();

            for (int i = 0, n = message.length; i < n; i++) {
                System.out.println(i + ": " + message[i].getFrom()[0] + "   " + message[i].getSubject());
            }
            // Close connection
            folder.close(false);
            store.close();
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public List<Mail> receivePOP3(String host, int port, String username, String password) {
        Properties props = System.getProperties();
        // props.put("mail.smtp.host", "smtp.qq.com");
        // props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props, null);
        URLName urln = new URLName("pop3", host, port, null, username, password);
        // URLName urln = new URLName("pop3", "pop3.163.com", 110, null, "lidehua3", "li2533");
        // URLName urln = new URLName("pop3", "pop.qq.com", 110, null, "253395706", "lidehua2533");
        Store store;
        try {
            store = session.getStore(urln);
            store.connect();
            Folder folder = store.getFolder("INBOX");
            folder.open(Folder.READ_ONLY);
            Message[] message = folder.getMessages();
                        
            List<Mail> list = new ArrayList<Mail>();
            for (int i = 0; i < message.length; i++) {
                Mail mail = mailService.getMail((MimeMessage) message[i]);
                list.add(mail);
                
//              System.out.println("======================");
//              System.out.println("Message " + i + " subject: " + pmm.getSubject());
//              System.out.println("Message " + i + " sentdate: " + pmm.getSentDate());
//              System.out.println("Message " + i + " replysign: " + pmm.getReplySign());
//              System.out.println("Message " + i + " hasRead: " + pmm.isRead());
//              System.out.println("Message " + i + " containAttachment: " + pmm.isContainAttach((Part) message[i]));
//              System.out.println("Message " + i + " form: " + pmm.getFrom());
//              System.out.println("Message " + i + " to: " + pmm.getRecipientAddress("to"));
//              System.out.println("Message " + i + " cc: " + pmm.getRecipientAddress("cc"));
//              System.out.println("Message " + i + " bcc: " + pmm.getRecipientAddress("bcc"));
//              pmm.setDateFormat("yy年MM月dd日 HH:mm");
//              System.out.println("Message " + i + " sentdate: " + pmm.getSentDate());
//              System.out.println("Message " + i + " Message-ID: " + pmm.getMessageId());
//              // 获得邮件内容===============
//              pmm.getMailContent((Part) message[i]);
//              System.out.println("Message " + i + " bodycontent: \r\n" + pmm.getBodyText());
//              pmm.setAttachPath("D:\\");
//              pmm.saveAttachMent((Part) message[i]);
            }

            folder.close(false);
            store.close();
            return list;
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
