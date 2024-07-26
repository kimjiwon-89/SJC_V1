package com.sjc.SJC_V1.custom.saju;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjc.SJC_V1.model.DailySkyBean;
import com.sjc.SJC_V1.model.DailyGroundBean;

@Service
public class SajuService {

    @Autowired
    private SajuDao sajuDao;

    //천간 궁합
	public List<DailySkyBean> findSkyMatch(String mySky) {
		return sajuDao.findSkyMatches(mySky);
	}

	//지지 궁합
	public List<DailyGroundBean> findGroundMatch(String myGround) {
		return sajuDao.findGroundMatch(myGround);
	}


	public String findChemiResult(String r1, String r2) {
		return sajuDao.findChemiResult(r1, r2);
	}
}