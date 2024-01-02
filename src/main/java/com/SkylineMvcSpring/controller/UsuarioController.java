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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.SkylineMvcSpring.model.Reserva;
import com.SkylineMvcSpring.model.Usuario;
import com.SkylineMvcSpring.repository.ReservaRepository;
import com.SkylineMvcSpring.repository.UsuarioRepository;

import jakarta.transaction.Transactional;

@Controller
@RequestMapping("/admin/usuario")
public class UsuarioController {

	@Autowired
	UsuarioRepository usuarioRepository;
	@Autowired
	ReservaRepository reservaRepository;
	
	//Método para listar os registros na view
	@GetMapping
	public ModelAndView list() throws IOException {
		ModelAndView modelAndView = new ModelAndView("/admin/usuario");

		List<Usuario> usuarios = usuarioRepository.findAll();
		modelAndView.addObject("usuarios", usuarios);
		modelAndView.addObject("usuario", new Usuario());
		
		return modelAndView;
	}
	
	//Cadastrar novo registro verifica de não existe CPF e email igual antes 
	@PostMapping("/create")
	public ModelAndView create(@ModelAttribute Usuario usuario) throws IOException{
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/usuario");
		
		//testes para verificar se o cpf e email usados já não estão na base antes de executar o método
		if(usuarioRepository.findById(usuario.getCpf()).isPresent() && usuarioRepository.findByEmail(usuario.getEmail()) != null) {
			modelAndView.addObject("error", "CPF e email já existentes na base de dados!");
		}else if(usuarioRepository.findById(usuario.getCpf()).isPresent()) {
			modelAndView.addObject("error", "CPF já existente na base de dados!");
		}else if(usuarioRepository.findByEmail(usuario.getEmail()) != null){
			modelAndView.addObject("error", "Email já existente na base de dados!");
		}else {
			usuarioRepository.save(usuario);
		}

		return modelAndView;
	}
	
	@PostMapping("/update")
	public ModelAndView updateUsuario(@ModelAttribute("form") Usuario usuario) throws IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/usuario");
		
		if(usuarioRepository.findByEmailNotCpf(usuario.getEmail(), usuario.getCpf()) != null) {
			modelAndView.addObject("error", "Email já existente na base de dados!");
		}else {
			usuarioRepository.save(usuario);
		}
		
		return modelAndView;
	}
	
	//Atualizar CPF e possíveis referências existentes
	@Transactional
	@PostMapping("/update/cpf")
	public ModelAndView updateCpf(@RequestParam("old") String old, @RequestParam("cpf") String newCpf) throws IOException{
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/usuario");
		
		if (usuarioRepository.findById(newCpf).isPresent()) {
	        modelAndView.addObject("error", "CPF em uso. Não é possível realizar a atualização.");
	        return modelAndView;
	    }
		
		Usuario usuOld = usuarioRepository.findById(old).get();
		
		Usuario usuNew = new Usuario(newCpf, usuOld.getNome(), "emailTeporario", usuOld.getTelefone(), usuOld.getCep(),
				usuOld.getRua(), usuOld.getNumero(), usuOld.getComplemento(), usuOld.isAtivo());
		
		usuarioRepository.save(usuNew);//salva novo usuário com email temporário por ser unique
		usuNew.setEmail(usuOld.getEmail());//passa o email correto para o usuário novo
		//Remove o email da instância antiga para evitar erro de duplicidade
		usuOld.setEmail("emailTemporario2");
		
		//busca as reservas por usuario_cf para atualizar as referências
		List<Reserva> reservas = reservaRepository.findByCpf(old);
		
		for(Reserva res : reservas) {
			res.setUsuario(usuNew);//atualiza as reservas com cpf do novo usuario
			reservaRepository.save(res);//salva as reservas uma por uma
		}
		
		usuarioRepository.delete(usuOld);//deleta o usuário antigo
		usuarioRepository.save(usuNew);//atualiza o email(unique) ara o email correto do usuario
		
		return modelAndView;
	}
	
	//Método de deletar usuário
	
	//Preparar exclusão lógica ao concluir todas as demais etapas
	@GetMapping("/{id}")
	public ModelAndView delete(@PathVariable String id) throws IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/usuario");
		
		try {
			usuarioRepository.deleteById(id);
		} catch(DataIntegrityViolationException e) {
			modelAndView.addObject("error", "Não é possível excluir o registro devido a referências no banco de dados!");	        
		}
		
		return modelAndView;
	}
}
