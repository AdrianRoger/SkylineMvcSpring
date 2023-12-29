package com.SkylineMvcSpring.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.SkylineMvcSpring.model.Cidade;
import com.SkylineMvcSpring.repository.CidadeRepository;

@Controller
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
	@GetMapping("/{id}/update")
	public ModelAndView update(@PathVariable Long id, @RequestParam("cidade") String cidade,
			@RequestParam("estado") String estado, @RequestParam("pais") String pais, @RequestParam("aero") String aero)
			throws IOException{
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/cidade");
		
		Cidade cid = cidadeRepository.findById(id).get();
		cid.setCidade(cidade);
		cid.setEstado(estado);
		cid.setPais(pais);
		cid.setAeroporto(aero);
		
		cidadeRepository.save(cid);
		return modelAndView;
	}
	
	//deletar
	@GetMapping("/{id}/delete")
	public ModelAndView delete(@PathVariable Long id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/cidade");
		
		cidadeRepository.deleteById(id);
		
		return modelAndView;
	}
}
