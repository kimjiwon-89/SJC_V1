package com.sjc.common.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration
@EnableCaching
public class redisConfig {
    @Value("${spring.redis.host:15.165.89.39}")
    private String redisHost;

    @Value("${spring.redis.port:6379}")
    private int redisPort;

    @Value("${spring.redis.password:yj230916!}")  // 기본값을 공백으로 설정
    private String redisPassword;

   @Bean
    public RedisConnectionFactory redisConnectionFactory() {
       LettuceConnectionFactory factory = new LettuceConnectionFactory(redisHost, redisPort);
       factory.setPassword(redisPassword);

       return factory;
    }

    @Bean
    public RedisTemplate<String, String> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
        RedisTemplate<String, String> redisTemplate = new RedisTemplate<>();
        redisTemplate.setConnectionFactory(redisConnectionFactory);
        redisTemplate.setKeySerializer(new StringRedisSerializer());    // 키 직렬화
        redisTemplate.setValueSerializer(new StringRedisSerializer());  // 값 직렬화
        return redisTemplate;
    }
}
