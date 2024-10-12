package com.sjc.SJC_V1.custom.saju;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sjc.SJC_V1.entity.DailyGroundBean;

@Repository
public interface SajuRepository extends JpaRepository<DailyGroundBean, Long>, SajuRepositoryCustom {

}