package com.sjc.system.visitor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class VisitorCont {

	private static final Logger logger = LoggerFactory.getLogger(VisitorCont.class);

	@Autowired
	private VisitorService visitorService;

	/**
	 * 방문자 수 증가
	 * @param request
	 */
	@PostMapping("/visit")
	public void incrementVisit(HttpServletRequest request) {

		// 세션 추가하여 중복적으로 redis를 call하지 않도록 함
		HttpSession session = request.getSession();
		String visitKey = "visitedToday";

		if (session.getAttribute(visitKey) == null) {
			session.setAttribute(visitKey, true);  // 방문 여부 기록

			String ipAddress = getClientIp(request);
			visitorService.incrementVisitorCount(ipAddress);
		}

	}

	public String getClientIp(HttpServletRequest request) {
		String remoteAddr = request.getHeader("X-Forwarded-For");
		if (remoteAddr == null || remoteAddr.isEmpty()) {
			remoteAddr = request.getRemoteAddr();
		}
		return remoteAddr;
	}

	// 오늘의 방문자 수 조회
	@GetMapping("/visitorCount")
	public Long getVisitorCount() {
		return visitorService.getVisitorCount();
	}

}