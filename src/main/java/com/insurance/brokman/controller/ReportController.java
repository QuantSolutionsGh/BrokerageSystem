package com.insurance.brokman.controller;

import com.insurance.brokman.model.Report;
import com.insurance.brokman.repository.ReportRepository;
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

//TODO
/*
1. Clients without any policies
2. Lapsed policies
3. Policies Due Renewal
4. Production Report
5. Lapsed Policies
6. Policies with outstanding premiums
7.
 */

@Controller
public class ReportController {

    private final Logger logger = LoggerFactory.getLogger(ReportController.class);

    @Autowired
    private ReportRepository reportRepository;

    // show update form

    @RequestMapping(value="/reports/{id}/update",method= RequestMethod.GET)
    public String showUpdateReportForm(@PathVariable("id") long id, Model model) {

        logger.debug("showUpdateReportForm() : {}", id);

        Report report =reportRepository.getOne(id);
        model.addAttribute("reportForm",report);

        return "reports/reportForm";



    }

    //show add report form

    @RequestMapping(value = "/reports/add", method = RequestMethod.GET)
    public String showAddReportForm(Model model){

        logger.debug("showAddReportForm()");

        Report report = new Report();

        model.addAttribute("reportForm",report);



        return "reports/reportForm";


    }



    @RequestMapping(value="/reports",method= RequestMethod.GET)
    public String showAllReports(Model model){
        logger.debug("showAllReports()");
        model.addAttribute("reportList",reportRepository.findAll());
        return "reports/list";
    }


    @RequestMapping(value = "/reports", method = RequestMethod.POST)
    public String saveOrUpdateAgent(@ModelAttribute("reportForm") @Validated Report report,
                                    BindingResult result, Model model, final RedirectAttributes redirectAttributes){
        logger.debug("saveOrUpdateReport() : {}",report);
        if (result.hasErrors()){

            return "reports/reportForm";
        }else{
            redirectAttributes.addFlashAttribute("css","success");
            if (report.getId()==null){
                redirectAttributes.addFlashAttribute("msg","New Report successfully added");
            }else {
                redirectAttributes.addFlashAttribute("msg","Report details updated");
            }

            reportRepository.save(report);

            // POST/REDIRECT/GET
            return "redirect:/reports";

        }

    }



}
