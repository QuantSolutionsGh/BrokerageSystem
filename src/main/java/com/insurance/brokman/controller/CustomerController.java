package com.insurance.brokman.controller;

import com.insurance.brokman.model.Customer;
import com.insurance.brokman.repository.CustomerRepository;
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
public class CustomerController {

    @Autowired
    private CustomerRepository custRepo;

    private final Logger logger = LoggerFactory.getLogger(CustomerController.class);

    // save or update customer
    // 1. @ModelAttribute bind form value
    // 2. @Validated form validator
    // 3. RedirectAttributes for flash value
    @RequestMapping(value = "/customers", method = RequestMethod.POST)
    public String saveOrUpdateCustomer(@ModelAttribute("custForm") @Validated Customer customer,
                                       BindingResult result, Model model, final RedirectAttributes redirectAttributes){
        logger.debug("saveOrUpdateCustomer() : {}",customer);
        if (result.hasErrors()){
            return "customers/custForm";
        }else{
            redirectAttributes.addFlashAttribute("css","success");
            if (customer.getId()==null){
                redirectAttributes.addFlashAttribute("msg","New customer successfully added");
            }else {
                redirectAttributes.addFlashAttribute("msg","Customer details updated");
            }

            custRepo.save(customer);

            // POST/REDIRECT/GET
            return "redirect:/customers";

        }

    }

    @RequestMapping(value = {"/customers","/index","/"}, method = RequestMethod.GET)

    public String showAllCustomers(Model model) {
        logger.debug("showAllCustomers()");
        model.addAttribute("customers", custRepo.findAll());
        return "customers/list";
    }

    //show add customer form

    @RequestMapping(value = "/customers/add", method = RequestMethod.GET)
    public String showAddUserForm(Model model){

        logger.debug("showAddUserForm()");

        Customer cust = new Customer();

        model.addAttribute("custForm",cust);

        return "customers/custForm";


    }

    @RequestMapping(value="/customers/custform/cancel",method=RequestMethod.GET)
    public String custFormCancel(){
        logger.debug("custFormCancel");
        return "redirect:/customers";

    }


    // show update form

    @RequestMapping(value="/customers/{id}/update",method=RequestMethod.GET)
    public String showUpdateCustomerForm(@PathVariable("id") long id, Model model) {

        logger.debug("showUpdateCustomerForm() : {}", id);

        Customer customer = custRepo.getOne(id);

        model.addAttribute("custForm",customer);

        return "customers/custForm";



    }





}
