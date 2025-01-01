package com.sjc.model;

import lombok.Data;

import java.time.LocalTime;

@Data
public class TimePillarVo {
    private char daystem1;
    private char daystem2;
    private LocalTime stime;
    private LocalTime etime;
    private char stem1_c;
    private char stem1_k;
    private char stem2_c;
    private char stem2_k;

}