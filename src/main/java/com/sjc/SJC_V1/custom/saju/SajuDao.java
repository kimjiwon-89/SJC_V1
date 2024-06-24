package com.sjc.SJC_V1.custom.saju;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sjc.SJC_V1.model.DAILY_GROUND_MATCH;
import com.sjc.SJC_V1.model.DAILY_SKY_MATCH;
import com.sjc.SJC_V1.model.SkyMatchDTO;

@Repository
public interface SajuDao extends JpaRepository<DAILY_SKY_MATCH, Long> {

//	String findSkyMatch(String mySky, String dateSky);
	
//	@Query("SELECT d.matchscore FROM DAILY_SKY_MATCH d WHERE d.daystem1 = :mySky AND d.daystem2 = :dateSky")
//    String findSkyMatch(@Param("mySky") String mySky, @Param("dateSky") String dateSky);


//    @Query("SELECT new com.sjc.SJC_V1.model.SkyMatchDTO(d.matchscore, :date ) FROM DAILY_SKY_MATCH d WHERE d.daystem1 = :mySky AND d.daystem2 IN :dateSkies")
//    List<SkyMatchDTO> findSkyMatches(@Param("mySky") String mySky, @Param("dateSkies") List<String> dateSkies, @Param("date") String date);
    
    @Query("SELECT d FROM DAILY_SKY_MATCH d WHERE d.daystem1 = :mySky")
    List<DAILY_SKY_MATCH> findSkyMatches(@Param("mySky") String mySky );

    @Query("SELECT d FROM DAILY_GROUND_MATCH d WHERE d.daystem1 = :myGround")
	List<DAILY_GROUND_MATCH> findGroundMatch(String myGround);

}