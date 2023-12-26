package com.SkylineMvcSpring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.SkylineMvcSpring.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, String> {

}
