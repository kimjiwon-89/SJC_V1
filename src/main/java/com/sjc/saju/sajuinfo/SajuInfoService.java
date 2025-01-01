package com.sjc.saju.sajuinfo;

import com.sjc.model.DailyGroundVo;
import com.sjc.model.DailySkyVo;
import com.sjc.model.Ilgan10sinVo;
import com.sjc.model.TimePillarVo;
import java.time.LocalTime;
import java.util.List;

public interface SajuInfoService {

	TimePillarVo getTimePillarInfo(LocalTime birthTime, char stem);

	List<Ilgan10sinVo> getIlgan10sin(char stem);

	List<DailySkyVo> findSkyMatch(String mySky);

	List<DailyGroundVo> findGroundMatch(String myGround);

	String findChemiResult(String lunIljin1, String lunIljin2);
}