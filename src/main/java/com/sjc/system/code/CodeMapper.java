package com.sjc.system.code;

import com.sjc.model.CodeVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CodeMapper {

    List<CodeVo> getCodeList(CodeVo codeVo);
}