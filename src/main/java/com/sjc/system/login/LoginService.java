package com.sjc.system.login;

import com.sjc.model.UserInfo;
import org.springframework.security.core.userdetails.UserDetails;

public interface LoginService {

    boolean validateUser(String userId, String userPwd);

    Object getUserInfo(String userId);

    UserDetails loadUserByUsername(String userId);

    boolean signupUser(UserInfo userInfo);
}