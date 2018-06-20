package com.insurance.brokman.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {




    @RequestMapping(value={"/login"})
    public String login(Model model, @RequestParam(value="error",required=false) String error, @RequestParam(value="logout",required=false)String logout){

        if (error !=null){
            model.addAttribute("msg","Invalid username or password");
            model.addAttribute("cssclass","alert alert-danger");
        }

        if (logout !=null){
            model.addAttribute("msg","You have been logged out successfully");
            model.addAttribute("cssclass","alert alert-info");
        }

        return "login";
    }
}
