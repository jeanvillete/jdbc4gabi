package org.jdb4gabi.model;

public class Estado extends Entidade {

	private String nome;
	private String uf;
	
	public String getNome() {
		return nome;
	}
	public String getUf() {
		return uf;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	
}
