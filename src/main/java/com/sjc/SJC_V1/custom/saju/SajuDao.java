package com.sjc.SJC_V1.custom.saju;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sjc.SJC_V1.model.DailySkyBean;
import com.sjc.SJC_V1.model.DailyGroundBean;
import com.sjc.SJC_V1.model.ChemiBean;

@Repository
public interface SajuDao extends JpaRepository<DailyGroundBean, Long> {
	
	//천간 궁합
	@Query("SELECT d FROM DailySkyBean d WHERE d.daystem1 = :mySky")
	List<DailySkyBean> findSkyMatches(@Param("mySky") String mySky );
	
	//지지 궁합
	@Query("SELECT d FROM DailyGroundBean d WHERE d.daystem1 = :myGround")
	List<DailyGroundBean> findGroundMatch(String myGround);

	@Query("SELECT d.matchscore FROM ChemiBean d WHERE d.daystem1 = :r1 and d.daystem2 = :r2")
	String findChemiResult(String r1, String r2);

}