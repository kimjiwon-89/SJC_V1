package com.sjc.system.visitor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Service
public class VisitorServiceImpl implements  VisitorService {

    private static final String VISIT_KEY_PREFIX = "visit:";

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    // 오늘 날짜를 "visit:YYYY-MM-DD" 형식으로 저장
    private String getTodayVisitKey() {
        return VISIT_KEY_PREFIX + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    @Override
    public void incrementVisitorCount(String ipAddress) {
        String visitKey = getTodayVisitKey();  // 오늘 날짜 기준 키

        // IP가 이미 방문한 적 있는지 확인 (O(1))
        Boolean isNewVisit = redisTemplate.opsForSet().isMember(visitKey, ipAddress);

        // 새로운 방문자라면 카운트 증가
        if (!Boolean.TRUE.equals(isNewVisit)) {  // 방문하지 않은 IP일 때만
            redisTemplate.opsForSet().add(visitKey, ipAddress);  // IP 추가
        }
    }

    @Override
    public Long getVisitorCount() {
        String visitKey = getTodayVisitKey();
        return redisTemplate.opsForSet().size(visitKey);  // Set의 크기만 가져오면 방문자 수
    }

}
