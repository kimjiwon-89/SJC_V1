package com.sjc.SJC_V1.model;

import com.sjc.SJC_V1.entity.ChemiBean;

/**
 * DTO : API 요청 응답에 사용되는 객체, 특정 필드만 담아 전송하도록 함
 */
public class ChemiDto {

    private Long seq;
    private String daystem1;
    private String daystem2;
    private String matchscore;
    
    public ChemiDto() {}
    
    public ChemiDto(ChemiBean chemiBean) {
    	seq = chemiBean.getSeq();
    	daystem1 = chemiBean.getDaystem1();
    	daystem2 = chemiBean.getDaystem2();
    	matchscore = chemiBean.getMatchscore();
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
    
}