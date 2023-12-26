package com.SkylineMvcSpring.model;

import java.time.LocalDate;
import java.util.Objects;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@EntityListeners(com.SkylineMvcSpring.model.listener.ReservaEntityListener.class)
@Table
public class Reserva {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	@DateTimeFormat(iso = ISO.DATE, pattern = "dd/MM/yyyy")
	private LocalDate data_reserva;
	
	@Column(nullable = false)
	private int num_pessoas;
	
	@Column(columnDefinition = "boolean default false")
	private boolean cancelada;
	
	@ManyToOne
	@JoinColumn(name = "usuario_cpf", nullable = false)
	private Usuario usuario;
	
	@ManyToOne
	@JoinColumn(name = "voo_id", nullable = false)
	private Voo voo;
	
	public Reserva() {
		
	}

	public Reserva(Long id, LocalDate data_reserva, int num_pessoas, boolean cancelada, Usuario usuario, Voo voo) {
		super();
		this.id = id;
		this.data_reserva = data_reserva;
		this.num_pessoas = num_pessoas;
		this.cancelada = cancelada;
		this.usuario = usuario;
		this.voo = voo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDate getData_reserva() {
		return data_reserva;
	}

	public void setData_reserva(LocalDate data_reserva) {
		this.data_reserva = data_reserva;
	}

	public int getNum_pessoas() {
		return num_pessoas;
	}

	public void setNum_pessoas(int num_pessoas) {
		this.num_pessoas = num_pessoas;
	}

	public boolean isCancelada() {
		return cancelada;
	}

	public void setCancelada(boolean cancelada) {
		this.cancelada = cancelada;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Voo getVoo() {
		return voo;
	}

	public void setVoo(Voo voo) {
		this.voo = voo;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cancelada, data_reserva, id, num_pessoas, usuario, voo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Reserva other = (Reserva) obj;
		return cancelada == other.cancelada && Objects.equals(data_reserva, other.data_reserva)
				&& Objects.equals(id, other.id) && num_pessoas == other.num_pessoas
				&& Objects.equals(usuario, other.usuario) && Objects.equals(voo, other.voo);
	}

	@Override
	public String toString() {
		return "Reserva [id=" + id + ", data_reserva=" + data_reserva + ", num_pessoas=" + num_pessoas + ", cancelada="
				+ cancelada + ", usuario=" + usuario + ", voo=" + voo + "]";
	}
	
}
