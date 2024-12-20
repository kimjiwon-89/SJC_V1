package com.sjc.model;

import com.sjc.entity.DailySkyBean;

public class DailySkyDto {

    private Long seq;
    private String daystem1;
    private String daystem2;
    private String matchscore;
    private String date;

    public DailySkyDto() {}
    
    public DailySkyDto(DailySkyBean dailySkyBean) {
    	seq = dailySkyBean.getSeq();
    	daystem1 = dailySkyBean.getDaystem1();
    	daystem2 = dailySkyBean.getDaystem2();
    	matchscore = dailySkyBean.getMatchscore();
    	date = dailySkyBean.getDate();
    }

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