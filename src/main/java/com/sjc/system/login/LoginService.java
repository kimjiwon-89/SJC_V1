package com.sjc.system.login;

import com.sjc.model.UserInfo;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Map;

public interface LoginService {

    Integer validateUser(String userId, String userPwd);

    UserInfo getUserInfo(String userId);

    boolean signupUser(UserInfo userInfo);

    Integer duplCheckUser(UserInfo userInfo);

}