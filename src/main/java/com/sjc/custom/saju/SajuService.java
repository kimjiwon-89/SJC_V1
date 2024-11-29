package com.sjc.custom.saju;

import java.time.LocalTime;
import java.util.List;

import com.sjc.model.Ilgan10sinDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjc.model.DailyGroundDto;
import com.sjc.model.DailySkyDto;
import com.sjc.model.TimePillarDto;

@Service
public class SajuService {

    @Autowired
    private SajuRepository sajuRepository;

    //천간 궁합
	public List<DailySkyDto> findSkyMatch(String mySky) {
		return sajuRepository.findSkyMatches(mySky);
	}

	//지지 궁합
	public List<DailyGroundDto> findGroundMatch(String myGround) {
		return sajuRepository.findGroundMatch(myGround);
	}

	//사람 궁합
	public String findChemiResult(String r1, String r2) {
		return sajuRepository.findChemiResult(r1, r2);
	}

	public TimePillarDto getTimePillarInfo(LocalTime birthTime, char stem) {
		return sajuRepository.getTimePillarInfo(birthTime, stem);
	}

	public List<Ilgan10sinDto> getIlgan10sin(char stem) {
		return  sajuRepository.getIlgan10sin(stem);
	}
}