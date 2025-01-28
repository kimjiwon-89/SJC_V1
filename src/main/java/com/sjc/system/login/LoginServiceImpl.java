package com.sjc.system.login;

import com.sjc.model.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


@Service
public class LoginServiceImpl implements LoginService, UserDetailsService {

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private LoginMapper loginMapper;


	@Override
	public Integer validateUser(String userId, String userPwd) {
		String storedPassword = loginMapper.getPassword(userId);

		if(storedPassword == null) {
			return 1;
		} else if(passwordEncoder.matches(userPwd, storedPassword)) {
			return 0;
		} else {
			return 2;
		}
	}

	@Override
	public UserInfo getUserInfo(String userId) {
		return loginMapper.getUserInfo(userId);
	}

	@Override
	public boolean signupUser(UserInfo userInfo) {
		String encodedPassword = passwordEncoder.encode(userInfo.getUserPwd());
		userInfo.setUserPwd(encodedPassword);

		return loginMapper.signupUser(userInfo);
	}

	@Override
	public Integer duplCheckUser(UserInfo userInfo) {
		UserInfo user = loginMapper.getUserInfo(userInfo.getUserId());
		if (user != null) {
			return 0;
		} else {
			return 1;
		}
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// DB에서 사용자 정보 조회 (예: UserInfo 객체)
		UserInfo userInfo = loginMapper.getUserInfo(username);

		// roleId가 하나일 경우 이를 GrantedAuthority로 변환
		SimpleGrantedAuthority authority = new SimpleGrantedAuthority(userInfo.getRoleId());

		// UserDetails 객체 반환
		return User.builder()
				.username(userInfo.getUserId()) // userId는 username으로 사용
				.password(userInfo.getUserPwd())
				.authorities(authority) // 권한 부여
				.build();
	}
}
