package com.sjc.system.login;

import com.sjc.model.CodeVo;
import com.sjc.model.UserInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LoginMapper {

    String getPassword(String userId);

    UserInfo getUserInfo(String userId);

    boolean signupUser(UserInfo userInfo);
}