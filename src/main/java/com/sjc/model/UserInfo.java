package com.sjc.model;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.List;
import java.util.stream.Collectors;

@Data
public class UserInfo {

    private String userId;
    private String userPwd;
    private List<String> authIds;
    
    // 여러 권한을 반환하는 메소드
    public List<GrantedAuthority> getAuthorities() {
        return authIds.stream()
                .map(authId -> new SimpleGrantedAuthority("ROLE_" + authId)) // "ROLE_" 접두어를 붙여서 권한 설정
                .collect(Collectors.toList());
    }

    private String userName;
    private String userEmail;
    private String userPhone;
    private String regDate;
    private String uptDate;
}