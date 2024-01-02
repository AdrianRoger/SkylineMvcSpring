package com.SkylineMvcSpring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.SkylineMvcSpring.model.Reserva;

public interface ReservaRepository extends JpaRepository<Reserva, Long>{

	@Query(value = "SELECT * FROM reserva r WHERE r.usuario_cpf = :cpf", nativeQuery = true)
    List<Reserva> findByCpf(@Param("cpf") String cpf);
	
	@Modifying
	@Query(value = "UPDATE reserva  SET cancelada = true WHERE id = :id", nativeQuery = true)
	int cancel(@Param("id") Long id);
	
}
