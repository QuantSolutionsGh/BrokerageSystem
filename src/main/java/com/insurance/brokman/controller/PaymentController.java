package com.insurance.brokman.controller;

import com.insurance.brokman.model.PaymentDetails;
import com.insurance.brokman.model.Policy;
import com.insurance.brokman.repository.PaymentDetailsRepository;
import com.insurance.brokman.repository.PolicyRepository;
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

import java.util.Date;

@Controller
public class PaymentController {
    private final Logger logger = LoggerFactory.getLogger(PaymentController.class);

    @Autowired
    private PaymentDetailsRepository paymentDetailsRepository;


    @Autowired
    private PolicyRepository policyRepository;



    @RequestMapping(value ="/payments/makepayment/{id}",method= RequestMethod.GET)
    public String showPaymentForm(@PathVariable("id") long id, Model model){
        logger.debug("showPaymentForm()");

        Policy policy = policyRepository.getOne(id);
        PaymentDetails paymentDetails = new PaymentDetails();
        paymentDetails.setPolicy(policy);
        model.addAttribute("paymentDetailsForm",paymentDetails);

        return "payments/paymentForm";
    }

    // show update form

    @RequestMapping(value="/payments/{id}/update",method=RequestMethod.GET)
    public String updatePaymentForm(@PathVariable("id") long id, Model model) {

        logger.debug("updatePaymentForm() : {}", id);

        PaymentDetails pd=paymentDetailsRepository.getOne(id);

        model.addAttribute("paymentForm",pd);

        return "payments/paymentForm";



    }

    @RequestMapping(value = "/payments", method = RequestMethod.POST)
    public String saveOrUpdatePayment(@ModelAttribute("paymentForm") @Validated PaymentDetails pd,
                                      BindingResult result, Model model, final RedirectAttributes redirectAttributes){
        logger.debug("saveOrUpdatePayment() : {}",pd);
        if (result.hasErrors()){
            return "payments/paymentForm";
        }else{
            redirectAttributes.addFlashAttribute("css","success");
            if (pd.getId()==null){
                redirectAttributes.addFlashAttribute("msg","Payment has been recorded.");
            }else {
                redirectAttributes.addFlashAttribute("msg","Payment updated.");
            }

            pd.setEntryDate(new Date());

            pd.getPolicy().setAmtPaid(pd.getPolicy().getAmtPaid()+pd.getAmtPaid());


            paymentDetailsRepository.save(pd);


            // POST/REDIRECT/GET  /policies/{id}/update
            return "redirect:/policies/"+pd.getPolicy().getId()+"/update";

        }

    }








}
