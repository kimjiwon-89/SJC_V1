package com.sjc.SJC_V1.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
public class DAILY_GROUND_MATCH {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long seq;
    private String daystem1;
    private String daystem2;
    private String matchscore;
    private String date;
    
    
	public Long getSeq() {
		return seq;
	}
	public void setSeq(Long seq) {
		this.seq = seq;
	}
	public String getDaystem1() {
		return daystem1;
	}
	public void setDaystem1(String daystem1) {
		this.daystem1 = daystem1;
	}
	public String getDaystem2() {
		return daystem2;
	}
	public void setDaystem2(String daystem2) {
		this.daystem2 = daystem2;
	}
	public String getMatchscore() {
		return matchscore;
	}
	public void setMatchscore(String matchscore) {
		this.matchscore = matchscore;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}