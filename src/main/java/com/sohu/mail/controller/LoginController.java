/**
 * Copyright 2013 Sohu.com Inc. All Rights Reserved.
 */
package com.sohu.mail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpServletRequest request,
                        HttpServletResponse response) {
        
        request.setAttribute("username", username);
        request.getSession().setAttribute("username", username);
        
        return "redirect:index";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginget() {
        ModelAndView mv = new ModelAndView("login");
                
        return mv;
    }
}
