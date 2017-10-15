/*
 *  Created by ZhongWenjie on 2017-09-24 0:34
 */

package com.meliora.controller;

import com.meliora.common.$;
import com.meliora.common.DateEditor;
import com.meliora.service.CommonService;
import com.meliora.service.EmployeeService;
import com.meliora.service.SystemService;
import com.meliora.util.SessionUtils;
import com.meliora.util.Util;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

@Slf4j
public abstract class BaseController {

    private static final String DEFAULT_404_VIEW = "404";

    @ExceptionHandler
    public ModelAndView exception(HttpServletRequest request, Exception e){
        log.error("",e);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("code",500);
        modelAndView.addObject("exception", e);
        modelAndView.addObject("url",request.getRequestURL());
        modelAndView.setViewName(DEFAULT_404_VIEW);
        return modelAndView;
    }

    protected String  redirect(String action){
        return "redirect:"+action;
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new DateEditor());
    }

    @ModelAttribute
    public void setTheme(Model model){
        String theme = (String)SessionUtils.getAttribute($.APPLICATION_THEME);
        if (!Util.valid(theme)) theme="blue";
        model.addAttribute("clientTheme",theme);
    }

    @Autowired
    protected SystemService systemService;

    @Autowired
    protected CommonService commonService;

    @Autowired
    protected EmployeeService employeeService;

}
