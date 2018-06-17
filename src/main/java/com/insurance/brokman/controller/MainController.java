package com.insurance.brokman.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {




    @RequestMapping(value={"/login"})
    public String login(){
        return "login";
    }
}
