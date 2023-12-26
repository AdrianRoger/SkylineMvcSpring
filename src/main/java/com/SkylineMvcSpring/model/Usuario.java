package com.SkylineMvcSpring.model;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class Usuario {
	
	@Id
	@Column(name = "cpf", nullable = false, unique = true)
	private String CPF;
	
	@Column(nullable = false)
	private String nome;
	
	@Column(nullable = false, unique = true)
	private String email;
	
	@Column(nullable = false)
	private String telefone;
	
	@Column(nullable = false)
	private String cep;
	
	@Column(nullable = false)
	private String rua;
	
	@Column(nullable = false)
	private int numero;
	
	@Column
	private String complemento;
	
	@Column(columnDefinition = "boolean default true")
	private boolean ativo;
	
	public Usuario() {
		
	}

	public Usuario(String cPF, String nome, String email, String telefone, String cep, String rua, int numero,
			String complemento, boolean ativo) {
		super();
		CPF = cPF;
		this.nome = nome;
		this.email = email;
		this.telefone = telefone;
		this.cep = cep;
		this.rua = rua;
		this.numero = numero;
		this.complemento = complemento;
		this.ativo = ativo;
	}

	public String getCPF() {
		return CPF;
	}

	public void setCPF(String cPF) {
		CPF = cPF;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	@Override
	public int hashCode() {
		return Objects.hash(CPF, ativo, cep, complemento, email, nome, numero, rua, telefone);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Usuario other = (Usuario) obj;
		return Objects.equals(CPF, other.CPF) && ativo == other.ativo && Objects.equals(cep, other.cep)
				&& Objects.equals(complemento, other.complemento) && Objects.equals(email, other.email)
				&& Objects.equals(nome, other.nome) && numero == other.numero && Objects.equals(rua, other.rua)
				&& Objects.equals(telefone, other.telefone);
	}
	
	@Override
	public String toString() {
		return "Usuario [CPF=" + CPF + ", nome=" + nome + ", email=" + email + ", telefone=" + telefone + ", cep=" + cep
				+ ", rua=" + rua + ", numero=" + numero + ", complemento=" + complemento + ", ativo=" + ativo + "]";
	}
	
}
