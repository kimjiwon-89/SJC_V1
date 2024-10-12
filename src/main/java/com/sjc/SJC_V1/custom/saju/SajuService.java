package com.sjc.SJC_V1.custom.saju;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjc.SJC_V1.model.DailyGroundDto;
import com.sjc.SJC_V1.model.DailySkyDto;

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
}