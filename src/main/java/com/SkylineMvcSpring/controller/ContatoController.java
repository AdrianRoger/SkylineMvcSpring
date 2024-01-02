package com.SkylineMvcSpring.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.SkylineMvcSpring.model.Contato;
import com.SkylineMvcSpring.repository.ContatoRepository;

@Controller
@RequestMapping("/admin/contato")
public class ContatoController {
	
	@Autowired
	private ContatoRepository contatoRepository;
	
	//O método de criar desta classe encontra-se na classe menuController
	
	//Método para listar
	@GetMapping
	public ModelAndView listar() {
		ModelAndView modelAndView = new ModelAndView("/admin/contato");
		
		List<Contato> contatos = contatoRepository.findAll();
		modelAndView.addObject("contatos", contatos);

		return modelAndView;
	}
	
	//Método para criar ou atualizar
	@PostMapping
	public ModelAndView createOrUpadate(@ModelAttribute("form") Contato contato) throws IOException {
		ModelAndView modelAndView;
		
		if(contato.isResolvido()) {
			modelAndView = new ModelAndView ("redirect:/admin/contato");
		}else {
			modelAndView = new ModelAndView("redirect:/contato");
		}
			 
		contatoRepository.save(contato);
 
		return modelAndView;
	}
	
	//Médoto para deletar
	@GetMapping("/{id}")
	public ModelAndView delete(@PathVariable Long id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/contato");
		
		try {
			contatoRepository.deleteById(id);
		} catch(DataIntegrityViolationException e) {
			
			modelAndView.addObject("error", "Não é possível excluir o registro!");	        
			return modelAndView;
		}

		return modelAndView;
	}

}
