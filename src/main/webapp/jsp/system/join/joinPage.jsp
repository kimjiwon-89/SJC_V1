<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="content-layout pd login-wrap join-wrap join-email-wrap">
	<div class="small-back-warp">
		<button class="back-btn" onclick="goToback()">
			<i class="fa fa-angle-left" aria-hidden="true"></i>
		</button>
	</div>

	<%--	이메일 입력 영역 --%>
	<div class="join-check-wrap">
		<div class="border-box">
			<input class="form-control" type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요." />
			<button class="text-btn" onclick="fnDuplIdCheck();">아이디 중복확인</button>
		</div>

		<div class="border-box">
			<div class="icon">
				<i class="fa fa-lock" aria-hidden="true"></i>
			</div>
			<input class="form-control" type="password" id="userPwd" name="userPwd" placeholder="비밀번호" />
			<button class="text-btn" onclick="showPwd(this);">
				<i class="fa fa-eye-slash" aria-hidden="true"></i>
			</button>
		</div>

		<div class="border-box">
			<div class="icon" >
				<i class="fa fa-lock" aria-hidden="true"></i>
			</div>
			<input class="form-control" type="password" id="userPwdCheck" placeholder="비밀번호 확인" />
			<button class="text-btn" onclick="showPwd(this);">
				<i class="fa fa-eye-slash" aria-hidden="true"></i>
			</button>
		</div>

		<div id="alertText" class="text-danger mb-3"></div>

	</div>

<%--

	&lt;%&ndash;	사용자 개인정보 입력 영역&ndash;%&gt;
	<div class="join-check-wrap">
		<div class="border-box">
			<div class="icon" >
				<i class="fa fa-user-o" aria-hidden="true"></i>
			</div>
			<input type="text" id="userName" name="userName" placeholder="이름" />
		</div>

		<div class="border-box">
			<div class="icon" >
				<i class="fa fa-calendar" aria-hidden="true"></i>
			</div>
			<input type="text" placeholder="생년월일 8자리" />
		</div>

		<div class="radio-wrap select-gender flex-space-btween-row">
			<input class="text-radio" type="radio" name="gender" id="gender_m" value="M" checked>
			<label class="text-radio-label" for="gender_m">남자</label>
			<input class="text-radio" type="radio" name="gender" id="gender_w" value="W">
			<label class="text-radio-label" for="gender_w">여자</label>
			<input class="text-radio" type="radio" name="gender" id="gender_none" value="N">
			<label class="text-radio-label" for="gender_none">선택안함</label>
		</div>

		<div class="border-box">
			<div class="nation-num">대한민국 +82</div>
			<input type="text" placeholder="휴대전화번호" />
			<button class="text-btn">인증요청</button>
		</div>

		<div class="err-msg display-none" id="user-err-msg">
			<div>
				이름: 한글, 영문 대/소문자를 사용해 주세요.(특수기호, 공백 사용불가)
			</div>
			<div>
				생년월일: 필수정보 입니다.
			</div>
			<div>
				휴대전화번호: 필수정보 입니다.
			</div>
		</div>
	</div>
--%>

	<div class="login-select-wrap">
		<button class="login-btn email-login" type="button" onclick="userSave()">가입하기</button>
	</div>
</div>

<!-- JS파일 분리 -->
<%@include file="joinPageJs.jsp"%>