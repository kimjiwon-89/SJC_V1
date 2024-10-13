package com.sjc.entity;

import java.time.LocalTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/**
 * Entity : 데이터베이스 테이블에 매핑되는 클래스
 */
@Entity
@Table(name = "timepillar_info")
public class TimepillarBean {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long seq;
    private char daystem1;
    private char daystem2;
    private LocalTime stime;
    private LocalTime etime;
    private char stem1_c;
    private char stem1_k;
    private char stem2_c;
    private char stem2_k;
    
	public Long getSeq() {
		return seq;
	}
	public void setSeq(Long seq) {
		this.seq = seq;
	}
	public char getDaystem1() {
		return daystem1;
	}
	public void setDaystem1(char daystem1) {
		this.daystem1 = daystem1;
	}
	public char getDaystem2() {
		return daystem2;
	}
	public void setDaystem2(char daystem2) {
		this.daystem2 = daystem2;
	}
	public LocalTime getStime() {
		return stime;
	}
	public void setStime(LocalTime stime) {
		this.stime = stime;
	}
	public LocalTime getEtime() {
		return etime;
	}
	public void setEtime(LocalTime etime) {
		this.etime = etime;
	}
	public char getStem1_c() {
		return stem1_c;
	}
	public void setStem1_c(char stem1_c) {
		this.stem1_c = stem1_c;
	}
	public char getStem1_k() {
		return stem1_k;
	}
	public void setStem1_k(char stem1_k) {
		this.stem1_k = stem1_k;
	}
	public char getStem2_c() {
		return stem2_c;
	}
	public void setStem2_c(char stem2_c) {
		this.stem2_c = stem2_c;
	}
	public char getStem2_k() {
		return stem2_k;
	}
	public void setStem2_k(char stem2_k) {
		this.stem2_k = stem2_k;
	}
    
}