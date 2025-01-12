package com.sjc.system.code;

import com.sjc.common.util.RequestUtil;
import com.sjc.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/code")
public class CodeCont {

	private static final Logger logger = LoggerFactory.getLogger(CodeCont.class);

    @Autowired
    private CodeService codeService;

    @RequestMapping("/main")
    public ModelAndView codeMain() {
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("viewName", "code/codeMain");
        mv.setViewName("layout/system_layout");
    	return mv;
    }

	@RequestMapping("/list")
	public List<CodeVo> getChemiResult(HttpServletRequest req, CodeVo codeVo) {
		List<CodeVo> list = new ArrayList<>();
		try {
			list = codeService.getCodeList(codeVo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}



}