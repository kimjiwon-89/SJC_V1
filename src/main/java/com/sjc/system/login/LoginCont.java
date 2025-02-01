package com.sjc.system.login;

import com.sjc.model.UserInfo;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
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

	@Autowired
	private AuthenticationManager authenticationManager;

	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	// 로그인 폼 화면
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage(HttpSession session) {
/*		ModelAndView mv = new ModelAndView();
		// 세션에 "userInfo"가 있는지 확인
		if (session.getAttribute("userInfo") != null) {
			mv.addObject("viewName", "/saju/main");
			mv.setViewName("layout/common_layout");
		} else {
			mv.addObject("viewName", "login/login");
			mv.setViewName("layout/system_layout");
		}

		return mv;*/
		return "layout/common_layout";
	}

	/**
	 * 로그인 구현
	 * @param userId
	 * @param userPwd
	 * @param session
	 * @return
	 */
	@PostMapping("/login")
	public @ResponseBody Map<String, Object> login(String userId, String userPwd, HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		String message = "알 수 없는 오류가 발생하였습니다. 잠시 후 다시 로그인해주세요.";
		try {
			// 첫 번째로 아이디가 있는지 확인하는 서비스 호출
			UserInfo userInfo = loginService.getUserInfo(userId);

			if (userInfo == null) {
				message = "아이디가 존재하지 않습니다";
				response.put("success", false);
				response.put("message", message);
				return response; // 아이디가 없다면 여기서 리턴
			}

			// 로그인 시도
			UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(userId, userPwd);
			Authentication authentication = authenticationManager.authenticate(authToken);

			// 인증 성공 시
			SecurityContextHolder.getContext().setAuthentication(authentication);
			session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());

			message = "로그인 성공";
			response.put("success", true);
		} catch (BadCredentialsException e) {
			// 비밀번호 불일치
			message = "비밀번호가 일치하지 않습니다";
			response.put("success", false);
		} catch (DisabledException e) {
			// 계정 비활성화
			message = "계정이 잠겨있거나 비활성화 상태입니다";
			response.put("success", false);
		} catch (UsernameNotFoundException e) {
			// 아이디 존재하지 않음
			message = "아이디가 존재하지 않습니다";
			response.put("success", false);
		}
		response.put("message", message);

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

	@PostMapping("/joinUser")
	@ResponseBody // AJAX 요청에 JSON 응답을 반환하기 위해 @ResponseBody 사용
	public Map<String, Object> join(UserInfo userInfo, HttpSession session) {
		Map<String, Object> response = new HashMap<>();

		if (loginService.signupUser(userInfo)) {
			response.put("success", true);
		} else {
			response.put("success", false);
		}

		return response;
	}

	@PostMapping("/duplIdCheck")
	@ResponseBody // AJAX 요청에 JSON 응답을 반환하기 위해 @ResponseBody 사용
	public Integer duplIdCheck(UserInfo userInfo) {
		Integer loginCheck = loginService.duplCheckUser(userInfo);
		return loginCheck;
	}

}