/*
 *  Created by ZhongWenjie on 2017-10-03 18:52
 */

package com.meliora.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController extends BaseController {

    @GetMapping(value = "/main")
    public String main(Model model) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        model.addAttribute("employeeInfos",mapper.writeValueAsString(systemService.getEmployeeInfo()));
        return "login/main_new";
    }

    @GetMapping(value = "/main/content")
    public String content(){
        return "login/welcome_new";
    }

}
