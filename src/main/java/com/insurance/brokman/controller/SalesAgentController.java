package com.insurance.brokman.controller;

import com.insurance.brokman.model.SalesAgent;
import com.insurance.brokman.repository.SalesAgentRepository;
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
public class SalesAgentController {

    private final Logger logger = LoggerFactory.getLogger(SalesAgentController.class);

    @Autowired
    private SalesAgentRepository salesAgentRepository;


    // show update form

    @RequestMapping(value="/salesagents/{id}/update",method=RequestMethod.GET)
    public String showUpdateSalesAgentsForm(@PathVariable("id") long id, Model model) {

        logger.debug("showUpdateSalesAgentsForm() : {}", id);

        SalesAgent salesAgent =salesAgentRepository.getOne(id);
        model.addAttribute("salesAgentForm",salesAgent);

        return "salesagents/salesAgentsForm";



    }

    @RequestMapping(value="/salesagents/salesagentform/cancel",method=RequestMethod.GET)
    public String custFormCancel(){
        logger.debug("salesAgentFormCancel");
        return "redirect:/salesagents";

    }

    //show add salesagent form

    @RequestMapping(value = "/salesagents/add", method = RequestMethod.GET)
    public String showAddAgentForm(Model model){

        logger.debug("showAddAgentForm()");

        SalesAgent salesAgent = new SalesAgent();

        model.addAttribute("salesAgentForm",salesAgent);



        return "salesagents/salesAgentsForm";


    }



    @RequestMapping(value="/salesagents",method= RequestMethod.GET)
    public String showAllAgents(Model model){
        logger.debug("showAllAgents()");
        model.addAttribute("agentList",salesAgentRepository.findAll());
        return "salesagents/list";
    }


    @RequestMapping(value = "/salesagents", method = RequestMethod.POST)
    public String saveOrUpdateAgent(@ModelAttribute("salesAgentForm") @Validated SalesAgent salesAgent,
                                     BindingResult result, Model model, final RedirectAttributes redirectAttributes){
        logger.debug("saveOrUpdateAgent() : {}",salesAgent);
        if (result.hasErrors()){

            return "salesagents/salesAgentsForm";
        }else{
            redirectAttributes.addFlashAttribute("css","success");
            if (salesAgent.getId()==null){
                redirectAttributes.addFlashAttribute("msg","New Agent successfully added");
            }else {
                redirectAttributes.addFlashAttribute("msg","Agent details updated");
            }

            salesAgentRepository.save(salesAgent);

            // POST/REDIRECT/GET
            return "redirect:/salesagents";

        }

    }





}
