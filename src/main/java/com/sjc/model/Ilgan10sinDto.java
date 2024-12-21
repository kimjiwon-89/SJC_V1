package com.sjc.model;

import com.sjc.entity.Ilgan10sinBean;

public class Ilgan10sinDto {

	private Long seq;
	private char ilgan;
	private String cheonganjiji;
	private String match;

	public Ilgan10sinDto() {}

	public Ilgan10sinDto(Ilgan10sinBean ilgan10sinBean) {
		seq = ilgan10sinBean.getSeq();
		ilgan = ilgan10sinBean.getIlgan();
		cheonganjiji = ilgan10sinBean.getCheonganjiji();
		match = ilgan10sinBean.getMatch();
	}

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