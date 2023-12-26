package com.SkylineMvcSpring.model;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table
public class Cidade {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private String cidade;
	
	@Column(nullable = false)
	private String estado;
	
	@Column(nullable = false)
	private String pais;
	
	@Column(nullable = false)
	private String aeroporto;
	
	@OneToMany(mappedBy = "cidade")
	private List<Voo> Voos;
	
	public List<Voo> getVoo(){
		return this.Voos;
	}
	
	public Cidade() {
		
	}

	public Cidade(Long id, String cidade, String estado, String pais, String aeroporto) {
		super();
		this.id = id;
		this.cidade = cidade;
		this.estado = estado;
		this.pais = pais;
		this.aeroporto = aeroporto;
	}
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getAeroporto() {
		return aeroporto;
	}

	public void setAeroporto(String aeroporto) {
		this.aeroporto = aeroporto;
	}

	@Override
	public int hashCode() {
		return Objects.hash(aeroporto, cidade, estado, id, pais);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cidade other = (Cidade) obj;
		return Objects.equals(aeroporto, other.aeroporto) && Objects.equals(cidade, other.cidade)
				&& Objects.equals(estado, other.estado) && Objects.equals(id, other.id)
				&& Objects.equals(pais, other.pais);
	}

	@Override
	public String toString() {
		return "Cidade [id=" + id + ", cidade=" + cidade + ", estado=" + estado + ", pais=" + pais + ", aeroporto="
				+ aeroporto + "]";
	}
	
}
