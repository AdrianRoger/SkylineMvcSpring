package com.SkylineMvcSpring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.SkylineMvcSpring.model.Contato;

@Controller
public class MenuController {
	
	@GetMapping("/destino")
	public String showDestinoPage() {
	  return "destino";
	}
	  
	@GetMapping("/promocoes")
	public String showPromocoesPage() {
	  return "promocoes";
	}
	  
	@GetMapping("/contato")
	public ModelAndView contato() {
		ModelAndView modelAndView = new ModelAndView("contato");
	
		modelAndView.addObject("contato", new Contato());
	
		return modelAndView;
	}
}
