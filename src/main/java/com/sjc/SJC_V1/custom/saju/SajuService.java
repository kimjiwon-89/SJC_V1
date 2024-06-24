package com.sjc.SJC_V1.custom.saju;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjc.SJC_V1.model.DAILY_GROUND_MATCH;
import com.sjc.SJC_V1.model.DAILY_SKY_MATCH;

@Service
public class SajuService {

    @Autowired
    private SajuDao sajuDao;


	public List<DAILY_SKY_MATCH> findSkyMatch(String mySky) {
		return sajuDao.findSkyMatches(mySky);
	}


	public List<DAILY_GROUND_MATCH> findGroundMatch(String myGround) {
		return sajuDao.findGroundMatch(myGround);
	}
}