package com.sjc.z_custom.user;

import com.google.gson.Gson;
import com.sjc.common.util.RequestUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;


@RestController
@RequestMapping("/user")
public class Z_UserCont {
	/**
	* Description : user
	* @Author	: eskim
	* @Date	 	: 2024. 12. 29
	* @Method	: userMain
	* @return 	: ModelAndView
	*/
	@RequestMapping("/")
	public ModelAndView userMain() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("viewName", "user/userMain");
	    mv.setViewName("layout/common_layout");
		return mv;
	}

	/**
	 * Description : 유저 친구 리스트
	 * @Author	: eskim
	 * @Date	 	: 2024. 12. 29
	 * @Method	: JoinEmail
	 * @return 	: ModelAndView
	 */
	@RequestMapping("/friendList")
	public ModelAndView joinEmail() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("viewName", "user/userFriendList");
		mv.setViewName("layout/common_layout");
		return mv;
	}

	/**
	 * Description : 유저 정보 수정
	 * @Author	: eskim
	 * @Date	 	: 2024. 12. 29
	 * @Method	: changeInfoModal
	 * @return 	: ModelAndView
	 */
	@RequestMapping("/changeInfoModal")
	public ModelAndView joinCompleteModal(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Gson gson = new Gson();
		try {
			Map<String, Object> paramData = RequestUtil.getReqParamToMap(req);
			if(paramData != null) mv.addObject("data", gson.toJson(paramData));

		} catch (ServletException e) {
			e.printStackTrace();
		}
		mv.addObject("modalName", "user/changeInfoModal");
		mv.setViewName("layout/common_modal");
		return mv;
	}
}