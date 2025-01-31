package com.sjc.z_custom.join;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sjc.common.util.RequestUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;


@RestController
@RequestMapping("/join")
public class JoinCont {
	/**
	* Description : join
	* @Author	: eskim
	* @Date	 	: 2024. 10. 16
	* @Method	: join 
	* @return 	: ModelAndView
	*/
	@RequestMapping("/")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("viewName", "join/join");
	    mv.setViewName("layout/common_layout");
		return mv;
	}
	
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
	* Description : loginEmail
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
	
	/**
	* Description  개인정보처리방침, 이용약관 등 설명 페이지
	* @Author	: eskim
	* @Date	 	: 2024. 12. 18
	* @Method	: sajuMainNew 
	* @return 	: ModelAndView
	*/
	@RequestMapping("/serviceDescription")
	public ModelAndView serviceDescription(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("viewName", "join/serviceDescription");
		Map<String, Object> map;
		try {
			map = RequestUtil.getReqParamToMap(req);
	        mv.addObject("descType", map.get("descType").toString());
		} catch (ServletException e) {
			e.printStackTrace();
		}
	    mv.setViewName("layout/common_layout");
		return mv;
	}

	/**
	 * Description : JoinEmail
	 * @Author	: eskim
	 * @Date	 	: 2024. 12. 29
	 * @Method	: JoinEmail
	 * @return 	: ModelAndView
	 */
	@RequestMapping("/joinEmail")
	public ModelAndView joinEmail() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("viewName", "join/joinEmail");
		mv.setViewName("layout/common_layout");
		return mv;
	}

	/**
	 * Description : 이메일확인 완료 팝업
	 * @Author	: eskim
	 * @Date	 	: 2024. 12. 29
	 * @Method	: checkEmailModal
	 * @return 	: ModelAndView
	 */
	@RequestMapping("/checkEmailModal")
	public ModelAndView checkEmailModal(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Gson gson = new Gson();
		try {
			Map<String, Object> paramData = RequestUtil.getReqParamToMap(req);
			if(paramData != null) mv.addObject("data", gson.toJson(paramData));

		} catch (ServletException e) {
			e.printStackTrace();
		}
		mv.addObject("modalName", "join/checkEmailModal");
		mv.setViewName("layout/common_modal");
		return mv;
	}

	/**
	 * Description : 회원가입 완료 팝업
	 * @Author	: eskim
	 * @Date	 	: 2024. 12. 29
	 * @Method	: joinCompleteModal
	 * @return 	: ModelAndView
	 */
	@RequestMapping("/joinCompleteModal")
	public ModelAndView joinCompleteModal(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Gson gson = new Gson();
		try {
			Map<String, Object> paramData = RequestUtil.getReqParamToMap(req);
			if(paramData != null) mv.addObject("data", gson.toJson(paramData));

		} catch (ServletException e) {
			e.printStackTrace();
		}
		mv.addObject("modalName", "join/joinCompleteModal");
		mv.setViewName("layout/common_modal");
		return mv;
	}
}