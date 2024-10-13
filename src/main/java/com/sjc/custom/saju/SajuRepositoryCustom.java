package com.sjc.custom.saju;

import java.util.List;

import com.sjc.model.DailyGroundDto;
import com.sjc.model.DailySkyDto;

public interface SajuRepositoryCustom {

	//천간 궁합
	public List<DailySkyDto> findSkyMatches(String mySky);
	//지지 궁합
	public List<DailyGroundDto> findGroundMatch(String myGround);
	//사람 궁합
	public String findChemiResult(String r1, String r2);
}
