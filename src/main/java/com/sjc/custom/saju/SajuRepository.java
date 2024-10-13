package com.sjc.custom.saju;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sjc.entity.DailyGroundBean;

@Repository
public interface SajuRepository extends JpaRepository<DailyGroundBean, Long>, SajuRepositoryCustom {

}