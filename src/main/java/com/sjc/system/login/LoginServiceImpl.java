package com.sjc.system.login;

import com.sjc.model.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
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
	public boolean validateUser(String userId, String userPwd) {
		String storedPassword = loginMapper.getPassword(userId);
		return storedPassword != null && passwordEncoder.matches(userPwd, storedPassword);
	}

	@Override
	public UserInfo getUserInfo(String userId) {

		return loginMapper.getUserInfo(userId);
	}



	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		UserInfo user = loginMapper.getUserInfo(userId);

		if (user == null) {
			throw new UsernameNotFoundException("User not found");
		}

		// User 객체를 UserDetails 객체로 변환하여 반환
		return new org.springframework.security.core.userdetails.User(
				user.getUserId(),
				user.getUserPwd(),
				user.getAuthorities() // 권한 정보 (예: ROLE_USER, ROLE_ADMIN 등)
		);
	}

	@Override
	public boolean signupUser(UserInfo userInfo) {
		UserInfo user = loginMapper.getUserInfo(userInfo.getUserId());

		if (user != null) {
			return false;
		}

		String encodedPassword = passwordEncoder.encode(userInfo.getUserPwd());
		userInfo.setUserPwd(encodedPassword);

		return loginMapper.signupUser(userInfo);
	}


}
