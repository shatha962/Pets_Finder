package com.axsos.petsfinder.controllers;

import com.axsos.petsfinder.models.Pet;
import com.axsos.petsfinder.models.User;
import com.axsos.petsfinder.services.PetServices;
import com.axsos.petsfinder.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;
import java.util.Map;

@Controller
public class PetController {
    private final PetServices petServices;
    private final UserService userService;

    public PetController(PetServices petServices, UserService userService) {
        this.petServices = petServices;
        this.userService = userService;
    }
    public Long userSessionId(HttpSession session) {
        if(session.getAttribute("user1") == null)
            return null;
        return (Long)session.getAttribute("user1");
    }

    @RequestMapping("/addPet")
    public String showAddPet(Principal principal, @ModelAttribute("pet")Pet pet, Model model, HttpSession session){

//        session.setAttribute("userId",userSessionId(session));
//        if(userId == null)
//            return "redirect:/";
//        Long userId = this.userSessionId(session);
//        User user = this.userService.findById(userId);
//        model.addAttribute("user", user);
        model.addAttribute("pet", pet);
        return "AddPet.jsp";
    }

    @RequestMapping(value = "/addPet/{id}",method = RequestMethod.POST)
    public String addPets(@ModelAttribute("pet") Pet pet, BindingResult result, Model model, HttpSession session,  @PathVariable("id") Long id){
        Long userId = this.userSessionId(session);
//        if(result.hasErrors()) {
//            User user = this.userService.findById(userId);
//            model.addAttribute("user", user);
//            model.addAttribute("pet", pet);
//            return "AddPet.jsp";
//        }
        this.petServices.addPet(pet,userId);
        return "redirect:/";
    }

    @RequestMapping("/pet/{id}/edit")
    public String showEditPet(@Valid@ModelAttribute("pet") Pet pet, @PathVariable("id") Long id , Model model){
    model.addAttribute("currentPet",pet);
    return "page i want";
    }
    @RequestMapping(value = "/pet/{id}/edit",method =RequestMethod.POST)
    public String editPet(@Valid@ModelAttribute("pet") Pet pet, @PathVariable("id") Long id , Model model){
        petServices.updatePet(pet.getId(),pet.getName(),pet.getAge());
        return "page i want";
    }



}
