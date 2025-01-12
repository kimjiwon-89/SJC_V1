package com.sjc.system.code;

import com.sjc.model.CodeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CodeServiceImpl implements CodeService {

	@Autowired
	private CodeMapper codeMapper;


	@Override
	public List<CodeVo> getCodeList(CodeVo codeVo) {
		return codeMapper.getCodeList(codeVo);
	}
}
