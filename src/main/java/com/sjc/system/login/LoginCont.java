package com.sjc.system.login;

import com.sjc.model.UserInfo;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;


@RestController
@RequestMapping
public class LoginCont {

	private static final Logger logger = LoggerFactory.getLogger(LoginCont.class);

    @Autowired
    private LoginService loginService;

	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	// 로그인 폼 화면
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public ModelAndView loginPage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 세션에 "userInfo"가 있는지 확인
		if (session.getAttribute("userInfo") != null) {
			mv.addObject("viewName", "/saju/main");
			mv.setViewName("layout/common_layout");
		} else {
			mv.addObject("viewName", "login/login");
			mv.setViewName("layout/system_layout");
		}

		return mv;
	}

	@PostMapping("/login")
	@ResponseBody // AJAX 요청에 JSON 응답을 반환하기 위해 @ResponseBody 사용
	public Map<String, Object> login(String userId, String userPwd, HttpSession session) {
		Map<String, Object> response = new HashMap<>();

		if (loginService.validateUser(userId, userPwd)) {
			session.setAttribute("userInfo", loginService.getUserInfo(userId));
			response.put("success", true); // 로그인 성공
		} else {
			response.put("success", false); // 로그인 실패
		}

		return response;
	}

	// 로그인 폼 화면
	@RequestMapping(value = "/joinPage", method = RequestMethod.GET)
	public ModelAndView joinPage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 세션에 "userInfo"가 있는지 확인
		if (session.getAttribute("userInfo") != null) {
			mv.addObject("viewName", "/saju/main");
			mv.setViewName("layout/common_layout");
		} else {
			mv.addObject("viewName", "join/joinPage");
			mv.setViewName("layout/system_layout");
		}

		return mv;
	}

	@PostMapping("/join")
	@ResponseBody // AJAX 요청에 JSON 응답을 반환하기 위해 @ResponseBody 사용
	public Map<String, Object> join(UserInfo userInfo, HttpSession session) {
		Map<String, Object> response = new HashMap<>();

		if (loginService.signupUser(userInfo)) {
//			session.setAttribute("userInfo", loginService.getUserInfo(userInfo.getUserId()));
			response.put("success", true); // 로그인 성공
		} else {
			response.put("success", false); // 로그인 실패
		}

		return response;
	}

}