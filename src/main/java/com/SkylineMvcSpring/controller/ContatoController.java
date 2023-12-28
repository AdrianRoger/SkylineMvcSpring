package com.SkylineMvcSpring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.SkylineMvcSpring.model.Contato;
import com.SkylineMvcSpring.repository.ContatoRepository;

@Controller
@RequestMapping("/admin/contato")
public class ContatoController {
	
	@Autowired
	private ContatoRepository contatoRepository;
	
	@GetMapping
	public ModelAndView listar() {
		ModelAndView modelAndView = new ModelAndView("admin/contato");
		
		List<Contato> contatos = contatoRepository.findAll();
		modelAndView.addObject("contatos", contatos);

		return modelAndView;
	}
	
	@GetMapping("/{id}/update")
	public ModelAndView update(@PathVariable Long id) {
		
		Contato c = contatoRepository.findById(id).orElse(null);
		c.setResolvido(true);
		contatoRepository.save(c);
		
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/contato");
		
		List<Contato> contatos = contatoRepository.findAll();
		modelAndView.addObject("contatos", contatos);
		
		return modelAndView;		
	}
	
	@GetMapping("/{id}/delete")
	public ModelAndView delete(@PathVariable Long id) {
		contatoRepository.deleteById(id);
		
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/contato");
		
		List<Contato> contatos = contatoRepository.findAll();
		modelAndView.addObject("contatos", contatos);
 
		return modelAndView;
	}

}
