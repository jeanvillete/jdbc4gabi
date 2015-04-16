package org.jdb4gabi.model;

public class Cidade extends Entidade {

	private String nome;
	private Estado estado;
	
	public String getNome() {
		return nome;
	}
	public Estado getEstado() {
		return estado;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	
}
