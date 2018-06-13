package com.insurance.brokman.controller;

import com.insurance.brokman.model.Insurer;
import com.insurance.brokman.repository.InsurerRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class InsurerController {
    private final Logger logger = LoggerFactory.getLogger(InsurerController.class);

    @Autowired
    private InsurerRepository insurerRepository;


    // show update form

    @RequestMapping(value="/insurers/{id}/update",method= RequestMethod.GET)
    public String showUpdateInsurerForm(@PathVariable("id") long id, Model model) {

        logger.debug("showUpdateInsurerForm() : {}", id);

        Insurer insurer = insurerRepository.getOne(id);

        model.addAttribute("insurerForm",insurer);


        return "insurers/insurerForm";



    }


    //show add insurer form

    @RequestMapping(value = "/insurers/add", method = RequestMethod.GET)
    public String showInsurerForm(Model model){

        logger.debug("showAddInsurersForm()");

        Insurer insurer = new Insurer();

        model.addAttribute("insurerForm",insurer);


        return "insurers/insurerForm";


    }


    @RequestMapping(value="/insurers",method= RequestMethod.GET)
    public String showAllInsurers(Model model){
        logger.debug("showAllInsurers()");
        model.addAttribute("insurerList",insurerRepository.findAll());

        return "insurers/list";
    }

    @RequestMapping(value = "/insurers", method = RequestMethod.POST)
    public String saveOrUpdateAgent(@ModelAttribute("insurerForm") @Validated Insurer insurer,
                                    BindingResult result, Model model, final RedirectAttributes redirectAttributes){
        logger.debug("saveOrUpdateForm() : {}",insurer);
        if (result.hasErrors()){

            return "insurers/insurerForm";
        }else{
            redirectAttributes.addFlashAttribute("css","success");
            if (insurer.getId()==null){
                redirectAttributes.addFlashAttribute("msg","Insurer successfully added");
            }else {
                redirectAttributes.addFlashAttribute("msg","Insurer  updated");
            }

            insurerRepository.save(insurer);

            // POST/REDIRECT/GET
            return "redirect:/insurers";

        }

    }




}
