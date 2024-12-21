package com.sjc.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "ilgan10god")
public class Ilgan10sinBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long seq;
	private char ilgan;
	private String cheonganjiji;
	private String match;

	public Long getSeq() {
		return seq;
	}

	public void setSeq(Long seq) {
		this.seq = seq;
	}

	public char getIlgan() {
		return ilgan;
	}

	public void setIlgan(char ilgan) {
		this.ilgan = ilgan;
	}

	public String getCheonganjiji() {
		return cheonganjiji;
	}

	public void setCheonganjiji(String cheonganjiji) {
		this.cheonganjiji = cheonganjiji;
	}

	public String getMatch() {
		return match;
	}

	public void setMatch(String match) {
		this.match = match;
	}
}