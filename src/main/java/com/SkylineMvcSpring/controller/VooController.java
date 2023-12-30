package com.SkylineMvcSpring.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.SkylineMvcSpring.model.Cidade;
import com.SkylineMvcSpring.model.Voo;
import com.SkylineMvcSpring.repository.CidadeRepository;
import com.SkylineMvcSpring.repository.VooRepository;

@RestController
@RequestMapping("/admin/voo")
public class VooController {
	
	@Autowired
	private VooRepository vooRepository;
	@Autowired 
	private CidadeRepository cidadeRepository;
	
	//Rota para listar
	@GetMapping
	public ModelAndView list() throws IOException {
		ModelAndView modelAndView = new ModelAndView("/admin/voo");
		
		List<Voo> voos = vooRepository.findAll();
		modelAndView.addObject("voos",voos);
		List<Cidade> cidades = cidadeRepository.findAll();
		modelAndView.addObject("cidades", cidades);
		
		modelAndView.addObject("voo", new Voo());
		
		return modelAndView;
	}
	
	//Rota para criar registro
	@PostMapping
	public ModelAndView create(@ModelAttribute("form") Voo voo, @RequestParam long origem, @RequestParam Long destino) throws IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/voo");

		voo.setOrigem(cidadeRepository.findById(origem).get());
		voo.setDestino(cidadeRepository.findById(destino).get());
		vooRepository.save(voo);
		
		return modelAndView;
	}
	
	//Rota para Atualizar registro
	@PutMapping
	public ModelAndView update(@ModelAttribute Voo voo) throws IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/voo");
		
		vooRepository.save(voo);
		
		return modelAndView;
	}
	
	//Rota para Deletar
	@DeleteMapping("/{id}")
	public ModelAndView delete(@PathVariable("id") Long id) throws IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/voo");
		try {
			vooRepository.deleteById(id);
		} catch(DataIntegrityViolationException e) {
		 
			modelAndView.addObject("error", "Não é possível excluir o registro devido a referências no banco de dados!");	        
			return modelAndView;
		}
		return modelAndView;
	}

}
