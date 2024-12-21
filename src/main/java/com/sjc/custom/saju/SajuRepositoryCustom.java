package com.sjc.custom.saju;

import java.time.LocalTime;
import java.util.List;

import com.sjc.model.DailyGroundDto;
import com.sjc.model.DailySkyDto;
import com.sjc.model.Ilgan10sinDto;
import com.sjc.model.TimePillarDto;

public interface SajuRepositoryCustom {

	//천간 궁합
	public List<DailySkyDto> findSkyMatches(String mySky);
	//지지 궁합
	public List<DailyGroundDto> findGroundMatch(String myGround);
	//사람 궁합
	public String findChemiResult(String r1, String r2);
	//시주 조회
	public TimePillarDto getTimePillarInfo(LocalTime birthTime, char stem);
	//십신 조회
	public List<Ilgan10sinDto> getIlgan10sin(char stem);
}
