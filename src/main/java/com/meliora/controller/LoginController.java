/*
 *  Created by ZhongWenjie on 2017-09-24 0:59
 */

package com.meliora.controller;

import com.meliora.annotation.LoginExclude;
import com.meliora.common.$;
import com.meliora.model.Account;
import com.meliora.util.SecurityUtils;
import com.meliora.util.SessionUtils;
import com.meliora.util.Util;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@LoginExclude
public class LoginController extends BaseController{

    @GetMapping(value = "/login")
    public String toLogin(){
        if (SessionUtils.isLogin())
            return redirect("/main");
        return "login/login";
    }

    @PostMapping(value = "/login")
    public String login(Account account, String captcha, Model  model){
        if (!captcha.equals(SessionUtils.getAttribute($.SESSION_CAPTCHA))){
            model.addAttribute("message","验证码错误");
            return "login/login";
        }
        Account real = systemService.findByUsername(account.getUsername());
        if (real==null || !"enabled".equals(real.getState()) )
            real=systemService.getAccountByJobnumber(account.getUsername());
        if (real==null || !"enabled".equals(real.getState()) ){
            String accountType = real.getCAccountType().getId();
            if (!$.ACCOUNT_TYPE_ADMIN.equals(accountType) && !$.ACCOUNT_TYPE_EMPLOYEE.equals(accountType) ){
                model.addAttribute("message","该帐号不能登录管理系统");
                return "login/login";
            }
        }
        if (Util.valid(real) && SecurityUtils.MD5(account.getPassword()).equals(real.getPassword())){
            SessionUtils.login(real);
            return redirect("/main");
        }
        model.addAttribute("message","账号或密码错误");
        return "login/login";
    }

    @GetMapping(value = "logout")
    public String logout(){
        SessionUtils.logout();
        return redirect("/publicMain");
    }

    @GetMapping(value = "/login/captcha")
    public ResponseEntity<byte[]> captcha(){
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(Util.createCaptcha(),headers, HttpStatus.CREATED);
    }

}
