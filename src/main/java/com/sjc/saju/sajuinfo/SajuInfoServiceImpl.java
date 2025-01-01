package com.sjc.saju.sajuinfo;

import com.sjc.model.DailyGroundVo;
import com.sjc.model.DailySkyVo;
import com.sjc.model.Ilgan10sinVo;
import com.sjc.model.TimePillarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalTime;
import java.util.List;

@Service
public class SajuInfoServiceImpl implements SajuInfoService {

	@Autowired
	private SajuInfoMapper sajuInfoMapper;

	@Override
	public TimePillarVo getTimePillarInfo(LocalTime birthTime, char stem) {
		return sajuInfoMapper.getTimePillarInfo(birthTime, stem);
	}

	@Override
	public List<Ilgan10sinVo> getIlgan10sin(char stem) {
		return sajuInfoMapper.getIlgan10sin(stem);
	}

	@Override
	public List<DailySkyVo> findSkyMatch(String mySky) {
		return sajuInfoMapper.findSkyMatch(mySky);
	}

	@Override
	public List<DailyGroundVo> findGroundMatch(String myGround) {
		return sajuInfoMapper.findGroundMatch(myGround);
	}

	@Override
	public String findChemiResult(String lunIljin1, String lunIljin2) {
		return sajuInfoMapper.findChemiResult(lunIljin1, lunIljin2);
	}

}
