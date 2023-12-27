package com.SkylineMvcSpring.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table
public class Voo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private int num_voo;
	
	@Column(nullable = false)
	private String comp_aerea;
	
	@Column(nullable = false)
	private int assentos;
	
	@Column(nullable = false)
	@DateTimeFormat(iso = ISO.DATE, pattern = "dd/MM/yyyy")
	private LocalDate data_partida;
	
	@Column(nullable = false, columnDefinition = "DECIMAL(10, 2) DEFAULT 0.00")
    private BigDecimal preco_unit;
	
	@ManyToOne
	@JoinColumn(name="cidade_origem_id", nullable = false)
	private Cidade cidade_origem;
	
	@ManyToOne
	@JoinColumn(name="cidade_destino_id", nullable = false)
	private Cidade cidade_destino;
	
	@OneToMany(mappedBy = "voo")
	public List<Reserva> reservas;
	
	public List<Reserva> getReservas(){
		return this.reservas;
	}
	
	public Voo() {
		
	}

	public Voo(Long id, int num_voo, String comp_aerea, int assentos, LocalDate data_partida, BigDecimal preco_unit,
			Cidade origem, Cidade destino) {
		super();
		this.id = id;
		this.num_voo = num_voo;
		this.comp_aerea = comp_aerea;
		this.assentos = assentos;
		this.data_partida = data_partida;
		this.preco_unit = preco_unit;
		this.cidade_origem = origem;
		this.cidade_destino = destino;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getNum_voo() {
		return num_voo;
	}

	public void setNum_voo(int num_voo) {
		this.num_voo = num_voo;
	}

	public String getComp_aerea() {
		return comp_aerea;
	}

	public void setComp_aerea(String comp_aerea) {
		this.comp_aerea = comp_aerea;
	}

	public int getAssentos() {
		return assentos;
	}

	public void setAssentos(int assentos) {
		this.assentos = assentos;
	}

	public LocalDate getData_partida() {
		return data_partida;
	}

	public void setData_partida(LocalDate data_partida) {
		this.data_partida = data_partida;
	}

	public BigDecimal getPreco_unit() {
		return preco_unit;
	}

	public void setPreco_unit(BigDecimal preco_unit) {
		this.preco_unit = preco_unit;
	}

	public Cidade getCidadeOrigem() {
		return cidade_origem;
	}

	public void setCidadeOrigem(Cidade cidade) {
		this.cidade_origem = cidade;
	}
	
	public Cidade getCidadeDestino() {
		return cidade_destino;
	}

	public void setCidadeDestino(Cidade cidade) {
		this.cidade_destino = cidade;
	}

	@Override
	public int hashCode() {
		return Objects.hash(assentos, comp_aerea, data_partida, id, num_voo, preco_unit, cidade_origem, cidade_destino);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Voo other = (Voo) obj;
		return assentos == other.assentos && Objects.equals(comp_aerea, other.comp_aerea)
				&& Objects.equals(data_partida, other.data_partida) && Objects.equals(id, other.id)
				&& num_voo == other.num_voo && Objects.equals(preco_unit, other.preco_unit)
				&& Objects.equals(cidade_origem, other.cidade_origem)
				&& Objects.equals(cidade_destino, other.cidade_destino);
	}

	@Override
	public String toString() {
		return "Voo [id=" + id + ", num_voo=" + num_voo + ", comp_aerea=" + comp_aerea + ", assentos=" + assentos
				+ ", data_partida=" + data_partida + ", preco_unit=" + preco_unit + ", cidade_origem=" + cidade_origem
				+ ", cidade_destino=" + cidade_destino + ", reservas=" + reservas + "]";
	}

	
}
