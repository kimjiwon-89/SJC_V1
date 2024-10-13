package com.sjc.SJC_V1.custom.saju;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.sjc.SJC_V1.entity.QChemiBean;
import com.sjc.SJC_V1.entity.QDailyGroundBean;
import com.sjc.SJC_V1.entity.QDailySkyBean;
import com.sjc.SJC_V1.model.ChemiDto;
import com.sjc.SJC_V1.model.DailyGroundDto;
import com.sjc.SJC_V1.model.DailySkyDto;

import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;


/*
	STUDY
	
	fetchOne(): 단일 결과를 반환합니다. 결과가 없으면 null을 반환하고, 결과가 두 개 이상일 경우 예외를 발생시킵니다.
	fetchFirst(): 첫 번째 결과만 가져옵니다.
	fetchCount(): 결과의 개수만 반환합니다.

*/
@Repository
@Transactional
public class SajuRepositoryImpl implements SajuRepositoryCustom{
	
	private final JPAQueryFactory queryFactory;

	public SajuRepositoryImpl(EntityManager entityManager) {
		this.queryFactory = new JPAQueryFactory(entityManager);
	}

	//천간 궁합
	@Override
	public List<DailySkyDto> findSkyMatches(String mySky) {
		
		QDailySkyBean dailySkyBean = QDailySkyBean.dailySkyBean;
		
		return queryFactory
				.select(Projections.fields(DailySkyDto.class, dailySkyBean.daystem1, dailySkyBean.daystem2, dailySkyBean.matchscore))	//조회
				.from(dailySkyBean) //테이블
				.where(dailySkyBean.daystem1.eq(mySky))	//조건
				.fetch();	//쿼리 실행
	}

	//지지궁합
	@Override
	public List<DailyGroundDto> findGroundMatch(String myGround) {
		QDailyGroundBean dailyGroundBean = QDailyGroundBean.dailyGroundBean;
		return queryFactory
				.select(Projections.fields(DailyGroundDto.class, dailyGroundBean.daystem1, dailyGroundBean.daystem2, dailyGroundBean.matchscore))	//조회
				.from(dailyGroundBean)	//테이블
				.where(dailyGroundBean.daystem1.eq(myGround))	//조건
				.fetch();	//쿼리 실행
	}

	//사람 궁합
	@Override
	public String findChemiResult(String r1, String r2) {
		QChemiBean chemiBean = QChemiBean.chemiBean;
		return queryFactory
				.select(chemiBean.matchscore)	//조회
				.from(chemiBean)	//테이블
				.where(chemiBean.daystem1.eq(r1).and(chemiBean.daystem2.eq(r2)))
				.fetchFirst();
	}
	
	
}
