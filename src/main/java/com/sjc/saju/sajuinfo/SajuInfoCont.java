package com.sjc.saju.sajuinfo;

import com.google.gson.Gson;
import com.sjc.common.util.RequestUtil;
import com.sjc.model.*;
import com.sjc.system.code.CodeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import org.eclipse.tags.shaded.org.apache.bcel.classfile.Code;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/saju")
public class SajuInfoCont {

	private static final Logger logger = LoggerFactory.getLogger(SajuInfoCont.class);

    @Autowired
    private SajuInfoService sajuInfoService;

	@Autowired
	private CodeService codeService;
    
    /**
    	* Description : 메인 JSP 이동
    	* @Author	: jwkim-pc
    	* @Date	 	: 2024. 7. 26.
    	* @Method	: sajuMain 
    	* @return 	: ModelAndView
    */
    @RequestMapping("/main")
    public ModelAndView sajuMain() {
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("viewName", "saju/sajuMain");
        mv.setViewName("layout/common_layout");
    	return mv;
    }
    
    
    /**
    	* Description : 결과 페이지 이동
    	* @Author	: jwkim-pc
    	* @Date	 	: 2024. 7. 26.
    	* @Method	: sajuResult 
    	* @return 	: ModelAndView
    */
    @RequestMapping("/sajuResult")
    public ModelAndView sajuResult(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Gson gson = new Gson();

		CodeVo codeVo 			= new CodeVo();
		List<CodeVo> ganjiList	= new ArrayList<>();
		List<CodeVo> tenganList = new ArrayList<>();

		try {
			Map<String, Object> map = RequestUtil.getReqParamToMap(req);
         	mv.addObject("bean", gson.toJson(map));

			 // 기본 사주정보 조회
			codeVo.setCode("GANJI");
			codeVo.setUse_yn("Y");
			ganjiList = codeService.getCodeList(codeVo);
			codeVo.setCode("TENGAN");
			tenganList = codeService.getCodeList(codeVo);

			//시주 정보 조회
			//SajuMain에서 Value값이 Stime이기에 일치하는 정보를 우선 전부 불러옴
			String strBirthTime = (String) map.get("birthTime");
			if(!strBirthTime.isEmpty()) {
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
				LocalTime birthTime = LocalTime.parse(strBirthTime, formatter);

				String str_stem = (String) map.get("lunIljin");
				char stem = str_stem.charAt(0);

				// 시주 조회
				TimePillarVo timePillar = sajuInfoService.getTimePillarInfo(birthTime, stem);
				mv.addObject("timePillar", timePillar);

				// 십신 조회, 기본적으로 내 일간 천간값으로 비교하기에 내 천간의 모든 값을 가져온다.
				List<Ilgan10sinVo> ilgan10sin = sajuInfoService.getIlgan10sin(stem);

				gson = new Gson();
				mv.addObject("ilgan10sinList", gson.toJson(ilgan10sin));
			}

		} catch (ServletException e) {
		 e.printStackTrace();
		}

		mv.addObject("ganjiList", gson.toJson(ganjiList));
		mv.addObject("tenganList", gson.toJson(tenganList));
		mv.addObject("viewName", "saju/sajuResult");
		mv.setViewName("layout/common_layout");
		return mv;
    }
    
	/**
		* Description : 사주 궁합 계산
		* @Author	: jwkim-pc
		* @Date	 	: 2024. 6. 20.
		* @Method	: getSajuCalcResult 
		* @return 	: AjaxBean
	*/
	@RequestMapping("getSajuCalcResult")
	public @ResponseBody Map<String, Object> getSajuCalcResult(HttpServletRequest req) {
		Map<String, Object> result = new HashMap<String,Object>();
		try {
			Map<String, Object> map = RequestUtil.getReqParamToMap(req);

			//나의 지간
			String mySky = (String)map.get("mySky");
			String myGround = (String)map.get("myGround");
			
	        //해당 날짜 셋팅
	        List<DailySkyVo> skyScoreList = sajuInfoService.findSkyMatch(mySky);
			List<DailyGroundVo> groundScoreList = sajuInfoService.findGroundMatch(myGround);
			
			result.put("skyScoreList", skyScoreList);
			result.put("groundScoreList", groundScoreList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
    
    /**
    	* Description : 궁합보기 페이지 이동
    	* @Author	: jwkim
    	* @Date	 	: 2024. 7. 26.
    	* @Method	: sajuChemistry 
    	* @return 	: ModelAndView
    */
    @RequestMapping("/sajuChemistry")
    public ModelAndView sajuChemistry(HttpServletRequest req) {
    	ModelAndView mv = new ModelAndView();
    	try {
    		Map<String, Object> map = RequestUtil.getReqParamToMap(req);
    		mv.addObject("bean", map);
    		
    	} catch (ServletException e) {
    		e.printStackTrace();
    	}
    	
    	mv.addObject("viewName", "saju/sajuChemistry");
        mv.setViewName("layout/common_layout");
    	return mv;
    }

	/**
	 * 사주 궁합 결과 표출
	 * @param req
	 * @return
	 */
	@RequestMapping("/getChemiResult")
    public String getChemiResult(HttpServletRequest req) {
    	String result="";
    	try {
    		Map<String, Object> map = RequestUtil.getReqParamToMap(req);

    		String r1 = (String) map.get("result1[lunIljin]");
    		String r2 = (String) map.get("result2[lunIljin]");
    		
    		result = sajuInfoService.findChemiResult(r1.substring(0,1), r2.substring(0,1));
    		
    	} catch (ServletException e) {
    		e.printStackTrace();
    	}
    	
    	return result;
    }

}