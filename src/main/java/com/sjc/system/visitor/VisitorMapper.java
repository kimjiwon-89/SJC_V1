package com.sjc.system.visitor;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface VisitorMapper {

    void saveYesterDayCnt(Map<String, Object> data);
}