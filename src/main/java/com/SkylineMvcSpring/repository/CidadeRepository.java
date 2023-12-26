package com.SkylineMvcSpring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.SkylineMvcSpring.model.Cidade;

public interface CidadeRepository extends JpaRepository<Cidade, Long>{

}
