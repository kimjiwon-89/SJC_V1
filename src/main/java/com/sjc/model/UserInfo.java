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
    private String roleId;
    private String userName;
    private String userEmail;
    private String userPhone;
    private String regDate;
    private String uptDate;
}