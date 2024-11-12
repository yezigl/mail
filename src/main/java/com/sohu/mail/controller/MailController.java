/**
 * Copyright 2013 Sohu.com Inc. All Rights Reserved.
 */
package com.sohu.mail.controller;

import java.util.List;

import jakarta.annotation.Resource;

import org.apache.commons.configuration2.Configuration;
import org.apache.commons.configuration2.PropertiesConfiguration;
import org.apache.commons.configuration2.builder.fluent.Configurations;
import org.apache.commons.configuration2.ex.ConfigurationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sohu.mail.model.Mail;
import com.sohu.mail.service.ReceiveService;
import com.sohu.mail.utils.Constants;

@Controller
public class MailController {
    
    @Resource
    ReceiveService receiveService;

    @RequestMapping("/inbox")
    public ModelAndView inbox() {
        ModelAndView mv = new ModelAndView("mail/inbox");
        Configurations configs = new Configurations();
        PropertiesConfiguration config = null;
        try {
            config = configs.properties("classpath:/mail.properties");
        } catch (ConfigurationException e) {
            e.printStackTrace();
        }
        String serv = config.getString("mail.serv");
        String host = config.getString(serv + Constants.POP_HOST_SUFFIX);
        int port = config.getInt(serv + Constants.POP_PORT_SUFFIX);
        String username = config.getString("username");
        String password = config.getString("password");
        
        List<Mail> list = receiveService.receivePOP3(host, port, username, password);
        mv.addObject("mailList", list);
        
        return mv;
    }
    
   @RequestMapping("/sent")
    public ModelAndView sent() {
        ModelAndView mv = new ModelAndView("mail/sent");
        return mv;
    }
    @RequestMapping("/draft")
    public ModelAndView draft() {
        ModelAndView mv = new ModelAndView("mail/draft");
        return mv;
    }
    @RequestMapping("/spam")
    public ModelAndView spam() {
        ModelAndView mv = new ModelAndView("mail/spam");
        return mv;
    }
    @RequestMapping("/trash")
    public ModelAndView trash() {
        ModelAndView mv = new ModelAndView("mail/trash");
        return mv;
    }
    @RequestMapping("/compose")
    public ModelAndView compose() {
        ModelAndView mv = new ModelAndView("mail/compose");
        return mv;
    }
    @RequestMapping("/addrlist")
    public ModelAndView addrlist() {
        ModelAndView mv = new ModelAndView("mail/addrlist");
        return mv;
    }
}
