package com.SkylineMvcSpring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.SkylineMvcSpring.model.Usuario;
import com.SkylineMvcSpring.repository.UsuarioRepository;

@Controller
@RequestMapping("/admin/usuario")
public class UsuarioController {

	@Autowired
	UsuarioRepository usuarioRepository;//aqui está apontando erro
	
	@GetMapping
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("/admin/usuario");

		List<Usuario> usuarios = usuarioRepository.findAll();
		modelAndView.addObject("usuarios", usuarios);
		modelAndView.addObject("usuario", new Usuario());
		
		return modelAndView;
	}
	
}
