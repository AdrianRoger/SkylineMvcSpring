package com.SkylineMvcSpring.model.listener;

import java.time.LocalDate;

import com.SkylineMvcSpring.model.Reserva;

import jakarta.persistence.PrePersist;

public class ReservaEntityListener {
	
	@PrePersist
	public void prePersist(Reserva reserva) {
		reserva.setData_reserva(LocalDate.now());
	}

}
