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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.SkylineMvcSpring.model.Cidade;
import com.SkylineMvcSpring.repository.CidadeRepository;

@RestController
@RequestMapping("/admin/cidade")
public class CidadeController {

	@Autowired
	private CidadeRepository cidadeRepository;
	
	//listar
	@GetMapping
	public ModelAndView list() throws IOException{
		ModelAndView modelAndView = new ModelAndView("/admin/cidade");
		
		List<Cidade> cidades = cidadeRepository.findAll();
		modelAndView.addObject("cidades", cidades);
		
		Cidade cidade = new Cidade();
		modelAndView.addObject("cidade", cidade);
		
		return modelAndView;
	}
	
	//criar
	@PostMapping
	public ModelAndView create(@ModelAttribute("form") Cidade cidade) throws IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/cidade");
		
		cidadeRepository.save(cidade);
		return modelAndView;
	}
	
	//atualizar
	@PutMapping
	public ModelAndView update(@ModelAttribute Cidade cidade) throws IOException{
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/cidade");
		
		cidadeRepository.save(cidade);
		return modelAndView;
	}
	
	//deletar
	@DeleteMapping("/{id}")
	public ModelAndView delete(@PathVariable Long id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/cidade");
		
		try {
			cidadeRepository.deleteById(id);
		} catch(DataIntegrityViolationException e) {
		 
			modelAndView.addObject("error", "Não é possível excluir o registro devido a referências no banco de dados!");	        
			return modelAndView;
		}
		return modelAndView;
	}
}
