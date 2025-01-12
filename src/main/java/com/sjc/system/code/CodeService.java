package com.sjc.system.code;

import com.sjc.model.CodeVo;

import java.util.List;

public interface CodeService {

	List<CodeVo> getCodeList(CodeVo codeVo);
}