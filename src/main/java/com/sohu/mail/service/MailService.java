/**
 * Copyright 2013 Sohu.com Inc. All Rights Reserved.
 */
package com.sohu.mail.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.BodyPart;
import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.sohu.mail.model.Mail;

@Service
public class MailService {

    private Logger logger = LoggerFactory.getLogger(getClass());
    
    private String dateformat = "yy-MM-dd HH:mm";// 默认的日前显示格式

    public Mail getMail(MimeMessage mimeMessage) throws MessagingException, IOException {
        if (!mimeMessage.getFolder().isOpen()) {
            mimeMessage.getFolder().open(Folder.READ_ONLY);
        }
        Mail mail = new Mail();
        mail.setFrom(getFrom(mimeMessage));
        mail.setSubject(getSubject(mimeMessage));
        mail.setSentDate(getSentDate(mimeMessage));
        mail.setContent(getBodyText(mimeMessage));
        
        return mail;
    }

    /**
     * 获得发件人的地址和姓名
     * 
     * @throws MessagingException
     * @throws UnsupportedEncodingException
     */
    public String getFrom(MimeMessage mimeMessage) {
        String addr = "";
        try {
            InternetAddress[] address = (InternetAddress[]) mimeMessage.getFrom();

            if (address[0] != null)
                addr = address[0].toString();

            if (addr.startsWith("=?")) {
                addr = MimeUtility.decodeText(addr);
            } else {
                addr = new String(addr.getBytes("ISO8859-1"), "GBK");
            }
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return addr.replaceAll("<.*>|\"", "");
    }

    /**
     * 获得邮件的收件人，抄送，和密送的地址和姓名，根据所传递的参数的不同 "to"----收件人 "cc"---抄送人地址 "bcc"---密送人地址
     * 
     */
    public String getRecipientAddress(String type, MimeMessage mimeMessage) {
        String mailaddr = "";
        String addtype = type.toUpperCase();
        InternetAddress address[] = null;
        if (addtype.equals("TO") || addtype.equals("CC") || addtype.equals("BCC")) {
            try {
                if (addtype.equals("TO")) {
                    address = (InternetAddress[]) mimeMessage.getRecipients(Message.RecipientType.TO);
                } else if (addtype.equals("CC")) {
                    address = (InternetAddress[]) mimeMessage.getRecipients(Message.RecipientType.CC);
                } else {
                    address = (InternetAddress[]) mimeMessage.getRecipients(Message.RecipientType.BCC);
                }
            } catch (MessagingException e) {

            }
            if (address != null) {
                for (InternetAddress addr : address) {
                    String rec = addr.toString();
                    try {
                        if (rec.toLowerCase().indexOf("gb") != -1) {
                            rec = MimeUtility.decodeText(rec);
                        } else {
                            rec = new String(rec.getBytes("ISO8859-1"), "GBK");
                        }
                    } catch (UnsupportedEncodingException e) {

                    }
                    mailaddr += "," + rec;
                }
                mailaddr = mailaddr.substring(1);
            }
        } else {
            logger.warn("NO SUCH TYPE.");
        }
        return mailaddr;
    }

    /**
     * 获得邮件主题
     * 
     * @throws UnsupportedEncodingException
     */
    public String getSubject(MimeMessage mimeMessage) {
        String subject = null;
        String addr = "";
        try {
            subject = mimeMessage.getSubject();
            InternetAddress[] address = (InternetAddress[]) mimeMessage.getFrom();
            if (address[0] != null)
                addr = address[0].toString();
        } catch (MessagingException e) {
        }

        if (subject == null)
            subject = "";
        try {
            if (subject.startsWith("=?")) {
                subject = MimeUtility.decodeText(subject);
            } else {
                // subject = MimeUtility.decodeText(subject);
                // byte[] b = subject.getBytes("ISO8859-1");
                if (!addr.startsWith("=?")) {
                    subject = new String(subject.getBytes("ISO8859-1"), "GBK");
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return subject;
    }

    /**
     * 获得邮件发送日期
     */
    public String getSentDate(MimeMessage mimeMessage) {
        Date sentdate = null;
        try {
            sentdate = mimeMessage.getSentDate();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        SimpleDateFormat format = new SimpleDateFormat(dateformat);
        return format.format(sentdate);
    }

    /**
     * 获得邮件正文内容
     * @throws IOException 
     * @throws MessagingException 
     */
    public String getBodyText(MimeMessage mimeMessage) throws MessagingException, IOException {
        return getMailContent(mimeMessage).toString();
    }

    /**
     * 解析邮件，把得到的邮件内容保存到一个StringBuffer对象中，解析邮件 主要是根据MimeType类型的不同执行不同的操作，一步一步的解析
     * 
     * @throws MessagingException
     * @throws IOException
     */
    public StringBuffer getMailContent(Part part) throws MessagingException, IOException {
        StringBuffer bodytext = new StringBuffer();// 存放邮件内容
        String contentType = part.getContentType();
        int nameindex = contentType.indexOf("name");
        boolean conname = false;
        if (nameindex != -1) {
            conname = true;
        }
        if (part.isMimeType("text/plain") && !conname) {
            bodytext.append((String) part.getContent());
        } else if (part.isMimeType("text/html") && !conname) {
            bodytext.append((String) part.getContent());
        } else if (part.isMimeType("multi/*") && !conname) {
            Multipart multipart = (Multipart) part.getContent();
            int counts = multipart.getCount();
            for (int i = 0; i < counts; i++) {
                bodytext.append(getMailContent(multipart.getBodyPart(i)));
            }

        } else if (part.isMimeType("message/rfc822")) {
            bodytext.append(getMailContent((Part) part.getContent()));
        } else {
        }
        return bodytext;
    }

    /**
     * 判断此邮件是否需要回执，如果需要回执返回"true",否则返回"false"
     */
    public boolean getReplySign(MimeMessage mimeMessage) throws MessagingException {
        boolean replysign = false;
        String needreply[] = mimeMessage.getHeader("Disposition-Notification-To");
        if (needreply != null) {
            replysign = true;
        }
        return replysign;
    }

    /**
     * 获得此邮件的Message-ID
     */
    public String getMessageId(MimeMessage mimeMessage) throws MessagingException {
        return mimeMessage.getMessageID();
    }

    /**
     * 判断此邮件是否已读，如果未读返回返回false,反之返回true
     */
    public boolean isRead(MimeMessage mimeMessage) throws MessagingException {
        boolean isRead = false;
        Flags flags = mimeMessage.getFlags();
        if (flags.contains(Flags.Flag.SEEN)) {
            isRead = true;
        }
        // for (int i = 0; i < flag.length; i++)
        // {
        // if (flag[i] == Flags.Flag.SEEN)
        // {
        // isRead = true;
        // break;
        // }
        // }
        return isRead;
    }

    /**
     * 判断此邮件是否包含附件
     */
    public boolean isContainAttach(Part part) throws Exception {
        boolean attachflag = false;
        if (part.isMimeType("multipart/*")) {
            Multipart multipart = (Multipart) part.getContent();
            for (int i = 0; i < multipart.getCount(); i++) {
                BodyPart bodypart = multipart.getBodyPart(i);
                String disposition = bodypart.getDisposition();
                if ((disposition != null)
                        && ((disposition.equals(Part.ATTACHMENT)) || (disposition.equals(Part.INLINE)))) {
                    attachflag = true;
                } else if (bodypart.isMimeType("multipart/*")) {
                    attachflag = isContainAttach(bodypart);
                } else {
                    String contype = bodypart.getContentType();
                    if (contype.toLowerCase().indexOf("application") != -1)
                        attachflag = true;
                    if (contype.toLowerCase().indexOf("name") != -1)
                        attachflag = true;
                }
            }
        } else if (part.isMimeType("message/rfc822")) {
            attachflag = isContainAttach((Part) part.getContent());
        }
        return attachflag;
    }

    /**
     * 保存附件
     * 
     * @throws IOException
     * @throws MessagingException
     * @throws UnsupportedEncodingException
     */
    public void saveAttachment(Part part) throws UnsupportedEncodingException, MessagingException, IOException {
        String fileName = "";
        if (part.isMimeType("multipart/*")) {
            Multipart multipart = (Multipart) part.getContent();
            for (int i = 0; i < multipart.getCount(); i++) {
                BodyPart bodypart = multipart.getBodyPart(i);
                String disposition = bodypart.getDisposition();
                if ((disposition != null)
                        && ((disposition.equals(Part.ATTACHMENT)) || (disposition.equals(Part.INLINE)))) {
                    fileName = bodypart.getFileName();
                    if (fileName != null && fileName.toLowerCase().indexOf("gb") != -1) {
                        fileName = MimeUtility.decodeText(fileName);
                    }
                    saveFile(fileName, bodypart.getInputStream());
                } else if (bodypart.isMimeType("multipart/*")) {
                    saveAttachment(bodypart);
                } else {
                    fileName = bodypart.getFileName();
                    if ((fileName != null) && (fileName.toLowerCase().indexOf("gb") != -1)) {
                        fileName = MimeUtility.decodeText(fileName);
                        saveFile(fileName, bodypart.getInputStream());
                    }
                }
            }
        } else if (part.isMimeType("message/rfc822")) {
            saveAttachment((Part) part.getContent());
        }
    }

    /**
     * 真正的保存附件到指定目录里
     * 
     * @throws IOException
     */
    private void saveFile(String fileName, InputStream in) throws IOException {
        String osName = System.getProperty("os.name");
        String storedir = "/attachment";
        String separator = "";
        if (osName == null)
            osName = "";
        if (osName.toLowerCase().indexOf("win") != -1) {
            separator = "\\";
            if (storedir == null || storedir.equals(""))
                storedir = "c:\\tmp";
        } else {
            separator = "/";
            storedir = "/tmp";
        }
        File storefile = new File(storedir + separator + fileName);
        logger.debug("storefile's path: {}", storefile.toString());
        // for(int i=0;storefile.exists();i++){
        // storefile = new File(storedir+separator+fileName+i);
        // }
        BufferedOutputStream bos = null;
        BufferedInputStream bis = null;
        try {
            bos = new BufferedOutputStream(new FileOutputStream(storefile));
            bis = new BufferedInputStream(in);
            int c;
            while ((c = bis.read()) != -1) {
                bos.write(c);
                bos.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            bos.close();
            bis.close();
        }
    }
}
