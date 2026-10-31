package com.demo.controllers;

import mg.itu.framework.annotation.Controller;
import mg.itu.framework.annotation.Json;
import mg.itu.framework.annotation.UrlMapping;
import mg.itu.framework.vue.ModelAndView;

import java.util.Arrays;
import java.util.List;

@Controller
public class DeptController {

    // Retourne une vue JSP simple
    @UrlMapping(url = "/dept/list", method = "GET")
    public String list() {
        return "dept/list";
    }

    // Retourne une vue JSP avec données
    @UrlMapping(url = "/dept/new", method = "GET")
    public ModelAndView form() {
        ModelAndView mav = new ModelAndView("dept/form");
        mav.addAttribute("titre", "Nouveau departement");
        return mav;
    }

    // Formulaire simple avec paramètres primitifs
    @UrlMapping(url = "/dept/save", method = "POST")
    public ModelAndView save(String nom, int age) {
        ModelAndView mav = new ModelAndView("dept/form");
        mav.addAttribute("titre", "Departement enregistre");
        mav.addAttribute("message", "Nom recu : " + nom + " | Age recu : " + age);
        mav.addAttribute("nom", nom);
        mav.addAttribute("age", age);
        return mav;
    }

    // Retourne du JSON
    @Json
    @UrlMapping(url = "/dept/api/list", method = "GET")
    public List<String> apiList() {
        return Arrays.asList("Informatique", "Genie Civil", "Electronique");
    }
}
