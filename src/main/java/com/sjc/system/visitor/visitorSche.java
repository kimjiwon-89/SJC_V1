package com.sjc.system.visitor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@EnableScheduling
@Configuration
public class visitorSche {

    private static final String VISIT_KEY_PREFIX = "visit:";

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Autowired
    private VisitorMapper visitorMapper;

    @Autowired
    private HttpSession session;

    /**
     * 전날 방문자 수 저장
     */
    @Scheduled(cron = "0 1 0 * * *")
    public void saveVisitorCountAndCleanup() {
        String yesterdayKey = getVisitKey(LocalDate.now().minusDays(1));    // 전날 key값

        // 방문한 IP 목록 가져오기
        Set<String> visitors = redisTemplate.opsForSet().members(yesterdayKey);
        Long visitCount = (visitors != null) ? (long) visitors.size() : 0L;  // Set의 크기로 방문자 수 확인

        if (visitors != null && !visitors.isEmpty()) {
            Map<String, Object> data = new HashMap<>();
            data.put("yesterday", yesterdayKey);
            data.put("count", visitCount);
            visitorMapper.saveYesterDayCnt(data);
        }

        // Redis 데이터 삭제
        redisTemplate.delete(yesterdayKey);  // 어제 날짜의 방문자 정보 삭제
    }

    private String getVisitKey(LocalDate date) {
        return VISIT_KEY_PREFIX + date.toString();
    }

    /**
     * 방문자수 세션 초기화
     */
    @Scheduled(cron = "0 0 0 * * *")  // 매일 자정
    public void resetVisitSession() {
        String visitKey = "visitedToday";

        // 세션에서 방문 여부 초기화
        session.removeAttribute(visitKey);
    }
}
