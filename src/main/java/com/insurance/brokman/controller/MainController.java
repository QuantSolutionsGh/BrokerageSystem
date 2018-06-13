package com.insurance.brokman.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {




    @RequestMapping(value="/custForm")
    public String custForm(Model model){
        return "/customers/custForm";
    }
}
