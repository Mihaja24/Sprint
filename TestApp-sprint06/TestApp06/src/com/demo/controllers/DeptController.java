package com.demo.controllers;

import com.demo.models.Dept;
import mg.itu.framework.annotation.Controller;
import mg.itu.framework.annotation.Json;
import mg.itu.framework.annotation.UrlMapping;
import mg.itu.framework.vue.ModelAndView;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.http.Part;
import java.io.IOException;

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

    // Formulaire avec objet simple
    @UrlMapping(url = "/dept/save", method = "POST")
    public ModelAndView save(Dept dept) {
        ModelAndView mav = new ModelAndView("dept/form");
        mav.addAttribute("titre", "Departement enregistre");
        mav.addAttribute("dept", dept);
        mav.addAttribute("message", "Nom recu : " + dept.getNom() + " | Age recu : " + dept.getAge());
        return mav;
    }

    // Retourne du JSON
    @Json
    @UrlMapping(url = "/dept/api/list", method = "GET")
    public List<String> apiList() {
        return Arrays.asList("Informatique", "Genie Civil", "Electronique");
    }

    @UrlMapping(url = "/dept/upload", method = "POST")
    public ModelAndView upload(Part fichier) {
        ModelAndView mav = new ModelAndView("dept/upload");
        if (fichier == null || fichier.getSize() == 0) {
            mav.addAttribute("message","Aucun fichier");
            return mav;   
        }
         
        try {
            String nomOriginal = Paths.get(fichier.getSubmittedFileName()).getFileName().toString();
            String nomFinal = System.currentTimeMillis() + "_" + nomOriginal;

            Path dossier = Paths.get(System.getProperty("user.home"), "uploads");
            Files.createDirectories(dossier);
            try (InputStream in = fichier.getInputStream()) {
                Files.copy(in, dossier.resolve(nomFinal));
            }

            mav.addAttribute("message", "Fichier enregistre : " + nomFinal);
        
        } catch (IOException e) {
            mav.addAttribute("message", "Erreur de chargement du fichier");
        }

        return mav;
    }
}
