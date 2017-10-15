/*
 *  Created by ZhongWenjie on 2017-09-24 0:33
 */

package com.meliora.controller;

import com.meliora.annotation.LoginExclude;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@LoginExclude
public class IndexController extends BaseController {

    private static final String DEFAULT_ERROR_VIEW = "404";

    @GetMapping(value = {"/","/publicMain"})
    public String index(){
        return "home/new_index";
    }

    @GetMapping(value = "/404")
    public String notFoundPage(Model model,HttpServletRequest request){
        model.addAttribute("url",request.getRequestURI());
        return DEFAULT_ERROR_VIEW;
    }

}
