package com.insurance.brokman.controller;


import com.insurance.brokman.model.*;
import com.insurance.brokman.repository.*;
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

import java.util.ArrayList;

@Controller
public class PolicyController {

    @Autowired
    private PolicyRepository policyRepo;

    @Autowired
    private CustomerRepository customerRepo;

    @Autowired
    private InsurerRepository insurerRepo;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private SalesAgentRepository salesAgentRepo;

    private final Logger logger = LoggerFactory.getLogger(PolicyController.class);

    @RequestMapping(value = "/policies", method = RequestMethod.GET)

    public String showAllPolicies(Model model) {
        logger.debug("showAllPolicies()");
        model.addAttribute("policyList", policyRepo.findAll());
        return "policies/list";
    }


    @RequestMapping(value = "/policies", method = RequestMethod.POST)
    public String saveOrUpdatePolicy(@ModelAttribute("policyForm") @Validated Policy policy,
                                       BindingResult result, Model model, final RedirectAttributes redirectAttributes){
        logger.debug("saveOrUpdatePolicy() : {}",policy);
        if (result.hasErrors()){

            return "policies/policyForm";
        }else{
            redirectAttributes.addFlashAttribute("css","success");
            if (policy.getId()==null){
                redirectAttributes.addFlashAttribute("msg","New Policy successfully added");
            }else {
                redirectAttributes.addFlashAttribute("msg","Policy details updated");
            }

            policyRepo.save(policy);

            // POST/REDIRECT/GET
            return "redirect:/policies";

        }

    }

    @RequestMapping(value="/policies/policyform/cancel",method=RequestMethod.GET)
    public String custFormCancel(){
        logger.debug("policyFormCancel");
        return "redirect:/policies";

    }


    @ModelAttribute("customerList")
    public ArrayList<Customer> populateCustomerList(){

        return (ArrayList<Customer>) customerRepo.findAll();

    }


    @ModelAttribute("productList")
    public ArrayList<Product>populateProductList(){
        return (ArrayList<Product>)productRepository.findAll();
    }



    @ModelAttribute("insurerList")
    public ArrayList<Insurer> populateInsurerList(){
        return (ArrayList<Insurer>) insurerRepo.findAll();
    }


    @ModelAttribute("salesAgentList")
    public ArrayList<SalesAgent>populateAgentList(){
        return (ArrayList<SalesAgent>) salesAgentRepo.findAll();
    }


    @RequestMapping(value = "/policies/add", method = RequestMethod.GET)
    public String setupPolicyForm(Model model){

        logger.debug("showAddPolicyForm()");

        Policy policy = new Policy();

        model.addAttribute("policyForm",policy);

        return "policies/policyForm";


    }

    // show update form

    @RequestMapping(value="/policies/{id}/update",method=RequestMethod.GET)
    public String showUpdatePolicyForm(@PathVariable("id") long id, Model model) {

        logger.debug("showUpdatePolicyForm() : {}", id);

        Policy policy = policyRepo.getOne(id);

        model.addAttribute("policyForm",policy);

        return "policies/policyForm";



    }
}
