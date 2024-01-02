package com.SkylineMvcSpring.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.SkylineMvcSpring.model.Reserva;
import com.SkylineMvcSpring.model.Usuario;
import com.SkylineMvcSpring.model.Voo;
import com.SkylineMvcSpring.repository.ReservaRepository;
import com.SkylineMvcSpring.repository.UsuarioRepository;
import com.SkylineMvcSpring.repository.VooRepository;

@Controller
@RequestMapping("/admin/reserva")
public class ReservaController {

	@Autowired
	ReservaRepository reservaRepository;
	@Autowired
	UsuarioRepository usuarioRepository;
	@Autowired
	VooRepository vooRepository;
	
	@GetMapping
	public ModelAndView list() throws IOException{
		ModelAndView modelAndView = new ModelAndView("/admin/reserva");
		
		List<Reserva> reservas = reservaRepository.findAll();
		modelAndView.addObject("reservas", reservas);
		List<Usuario> usuarios = usuarioRepository.findAll();
		modelAndView.addObject("usuarios", usuarios);
		List<Voo> voos = vooRepository.findAll();
		modelAndView.addObject("voos", voos);
		modelAndView.addObject("reserva", new Reserva());
		
		return modelAndView;
	}
	
	@PostMapping
	public ModelAndView createOrUpdate(@ModelAttribute("form") Reserva reserva) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/reserva");
		
		reservaRepository.save(reserva);
		
		return modelAndView;
	}
	
	@Transactional
	@GetMapping("/cancel/{id}")
	public ModelAndView cancela(@PathVariable("id") Long id) throws IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/reserva");
		
		reservaRepository.cancel(id);
		
		return modelAndView;
	}
	
	@GetMapping("/{id}")
	public ModelAndView delete (@PathVariable("id") Long id ) throws IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/reserva");
		try {
			reservaRepository.deleteById(id);
		}catch(DataIntegrityViolationException e) {
			
			modelAndView.addObject("error" , "Não é possível excluir a reserva! Contate o Administrador");
			return modelAndView;
		}
		
		return modelAndView;
	}
	
}
