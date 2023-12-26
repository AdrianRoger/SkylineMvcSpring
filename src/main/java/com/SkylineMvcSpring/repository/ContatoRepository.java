package com.SkylineMvcSpring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.SkylineMvcSpring.model.Contato;

public interface ContatoRepository extends JpaRepository <Contato, Long>{

}
