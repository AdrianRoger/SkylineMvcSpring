package com.SkylineMvcSpring.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.SkylineMvcSpring.model.Contato;
import com.SkylineMvcSpring.repository.ContatoRepository;

@Controller
public class MenuController {
	
	@Autowired
	private ContatoRepository contatoRepository;
	
	
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
	
	@PostMapping("/contato")
	public ModelAndView cadastrarContato(Contato contato) throws IOException {
		
		ModelAndView modelAndView = new ModelAndView("redirect:/contato");
	 
		contatoRepository.save(contato);
 
		return modelAndView;
	}
}
