package com.insurance.brokman.controller;

import com.insurance.brokman.model.UserRoles;
import com.insurance.brokman.model.Users;
import com.insurance.brokman.repository.UserRepository;
import com.insurance.brokman.repository.UserRolesRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
public class UserController {

    private final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserRepository userRepository;


    @Autowired
    private UserRolesRepository userRolesRepository;


    // show update form

    @RequestMapping(value="/users/{id}/update",method= RequestMethod.GET)
    public String showUpdateUsersForm(@PathVariable("id") long id, Model model) {

        logger.debug("showUpdateUsersForm() : {}", id);

        Users users =userRepository.getOne(id);
        model.addAttribute("userForm",users);

        return "users/userForm";



    }

    //show add salesagent form

    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public String showAddAgentForm(Model model){

        logger.debug("showAddUsersForm()");

        Users users = new Users();

        model.addAttribute("userForm",users);



        return "users/userForm";


    }



    @RequestMapping(value="/users",method= RequestMethod.GET)
    public String showAllAgents(Model model){
        logger.debug("showAllUsers()");
        model.addAttribute("usersList",userRepository.findAll());
        return "users/list";
    }


    @RequestMapping(value="/users/userform/cancel",method=RequestMethod.GET)
    public String custFormCancel(){
        logger.debug("userformcancel()");
        return "redirect:/users";

    }

    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public String saveOrUpdateAgent(@ModelAttribute("userForm") @Validated Users user,
                                    BindingResult result, Model model, final RedirectAttributes redirectAttributes){
        logger.debug("saveOrUpdateUser() : {}",user);
        if (result.hasErrors()){

            return "users/userForm";
        }else{
            redirectAttributes.addFlashAttribute("css","success");
            if (user.getId()==null){
                user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
                user.setEnabled(1);

                UserRoles userRoles = new UserRoles();

                userRoles.setRole("admin");
                user.addToUserRoles(userRoles);

                redirectAttributes.addFlashAttribute("msg","New User successfully added");
            }else {
                redirectAttributes.addFlashAttribute("msg","User details updated");
            }



            userRepository.save(user);

            // POST/REDIRECT/GET
            return "redirect:/users";

        }

    }


}
