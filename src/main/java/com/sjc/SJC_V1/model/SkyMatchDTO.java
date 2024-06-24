package com.sjc.SJC_V1.model;

public class SkyMatchDTO {
    private String matchscore;
    private String date;
    private String daystem1;
    private String daystem2;

	public SkyMatchDTO(String matchscore, String date, String daystem1, String daystem2) {
        this.matchscore = matchscore;
        this.date = date;
        this.daystem1 = daystem1;
        this.daystem2 = daystem2;
    }

    // Getters and setters
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
}