package com.sjc.custom.join;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sjc.model.DailyGroundDto;
import com.sjc.model.DailySkyDto;
import com.sjc.model.TimePillarDto;
import com.sjc.util.RequestUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/join")
public class JoinCont {
    /**
    	* Description : login
    	* @Author	: eskim
    	* @Date	 	: 2024. 10. 16
    	* @Method	: login 
    	* @return 	: ModelAndView
    */
    @RequestMapping("/login")
    public ModelAndView login() {
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("viewName", "login/login");
        mv.setViewName("layout/common_layout");
    	return mv;
    }
    
    /**
	* Description : login
	* @Author	: eskim
	* @Date	 	: 2024. 10. 16
	* @Method	: loginEmail 
	* @return 	: ModelAndView
	*/
	@RequestMapping("/loginEmail")
	public ModelAndView loginEmail() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("viewName", "login/loginEmail");
	    mv.setViewName("layout/common_layout");
		return mv;
	}
	
	/**
	* Description : join
	* @Author	: eskim
	* @Date	 	: 2024. 10. 16
	* @Method	: login 
	* @return 	: ModelAndView
	*/
	@RequestMapping("/join")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("viewName", "join/join");
	    mv.setViewName("layout/common_layout");
		return mv;
	}
	
	
	/**
	* Description  사주정보 입력(임시로 조인컨트롤러에서 사용, 수정 필요함)
	* @Author	: eskim
	* @Date	 	: 2024. 10. 16
	* @Method	: sajuMainNew 
	* @return 	: ModelAndView
	*/
	@RequestMapping("/sajuMainNew")
	public ModelAndView sajuMainNew() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("viewName", "saju/sajuMainNew");
	    mv.setViewName("layout/common_layout");
		return mv;
	}
}