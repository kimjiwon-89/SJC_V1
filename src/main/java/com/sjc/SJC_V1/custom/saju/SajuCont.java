package com.sjc.SJC_V1.custom.saju;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sjc.SJC_V1.model.DailySkyBean;
import com.sjc.SJC_V1.model.DailyGroundBean;
import com.sjc.SJC_V1.util.RequestUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/saju")
public class SajuCont {

    @Autowired
    private SajuService sajuService;
    
//    /**
//       * Description : 메인 레이아웃
//       * @Author   : jwkim-pc
//       * @Date       : 2024. 6. 7.
//       * @Method   : sajuMainPage 
//       * @return    : ModelAndView
//     */
//    @RequestMapping("/main")
//    public ModelAndView sajuMainPage() {
//       ModelAndView mv = new ModelAndView();
//       mv.setViewName("layout/common_layout");
//       return mv;
//    }
    
    
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
      try {
         Map<String, Object> map = RequestUtil.getReqParamToMap(req);
         mv.addObject("bean", map);
         
      } catch (ServletException e) {
         e.printStackTrace();
      }
       
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
	        List<DailySkyBean> skyScoreList = sajuService.findSkyMatch(mySky);
			List<DailyGroundBean> groundScoreList = sajuService.findGroundMatch(myGround);
			
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
    
    
    @RequestMapping("/getChemiResult")
    public String getChemiResult(HttpServletRequest req) {
    	String result="";
    	try {
    		Map<String, Object> map = RequestUtil.getReqParamToMap(req);

    		String r1 = (String) map.get("result1[lunIljin]");
    		String r2 = (String) map.get("result2[lunIljin]");
    		
    		result = sajuService.findChemiResult(r1.substring(0,1), r2.substring(0,1));
    		
    	} catch (ServletException e) {
    		e.printStackTrace();
    	}
    	
    	return result;
    }
	
	
	
}