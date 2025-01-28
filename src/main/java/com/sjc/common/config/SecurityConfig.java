package com.sjc.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public AuthenticationManager authenticationManager(HttpSecurity http) throws Exception {
        // 기본 AuthenticationManager를 설정
        AuthenticationManagerBuilder authenticationManagerBuilder =
                http.getSharedObject(AuthenticationManagerBuilder.class);
        return authenticationManagerBuilder.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable()) // CSRF 비활성화
                .authorizeHttpRequests(authorizeRequests -> authorizeRequests
                        .requestMatchers("/", "/loginPage", "/saju/**", "/join/**").permitAll()  // 세션없이 접근가능
                        .requestMatchers("/system/**").hasAnyAuthority("ROLE_SUPER", "ROLE_ADMIN") // 권한 제어
                        .requestMatchers("/mySite/**").hasAnyAuthority("ROLE_USER")
                        .anyRequest().permitAll() // 그 외 요청은 인증 필요
                )
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED) // 세션이 필요한 경우에만 생성
                        .invalidSessionUrl("/saju/main")                          // 세션이 유효하지 않으면 로그인 페이지로 이동
                )
                .formLogin(formLogin -> formLogin
                        .loginPage("/loginPage") // 커스텀 로그인 페이지
                        .defaultSuccessUrl("/saju/main", true) // 로그인 성공 시 이동할 기본 페이지
                        .permitAll() // 로그인 페이지는 인증 없이 접근 가능
                        .failureUrl("/loginPage?error=true") // 로그인 실패 시
                        .usernameParameter("userId")  // 여기에서 "userId"를 사용하도록 지정
                        .passwordParameter("userPwd")  // 패스워드 파라미터는 "userPwd"
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/saju/main") // 로그아웃 성공 시 이동할 페이지
                        .invalidateHttpSession(true) // 세션 무효화
                )
                .exceptionHandling(exceptionHandling -> exceptionHandling
                        .authenticationEntryPoint((request, response, authException) -> {
                            // 로그인한 사용자가 로그인 페이지로 접근할 경우 /saju/main으로 리다이렉트
                            if (request.getRequestURI().equals("/loginPage")) {
                                response.sendRedirect("/index.jsp");
                            }
                        })
                );

        return http.build();
    }
}