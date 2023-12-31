package com.SkylineMvcSpring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.SkylineMvcSpring.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, String> {

	
	@Query(value = "SELECT * FROM usuario u WHERE u.email = :email", nativeQuery = true)
    Usuario findByEmail(@Param("email") String email);
	
	@Query(value = "SELECT * FROM usuario u WHERE u.email = :email and u.cpf != :cpf", nativeQuery = true)
    Usuario findByEmailNotCpf(@Param("email") String email, @Param("cpf") String cpf);
	
}
