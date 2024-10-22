<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>




<div class="main-wrap login-wrap">
	<div class="login-title">
		<h1>everysaju</h1>
	</div>
	<div class="login-select-wrap">
		<button class="login-btn kakao-login" onclick="">카카오로 로그인</button>
		<button class="login-btn naver-login" onclick="">네이버로 로그인</button>
		<button class="login-btn google-login" onclick="">구글계정으로 로그인</button>
		<button class="login-btn email-login" onclick="goToEmailLogin()">이메일 로그인</button>
	</div>
	<div class="login-bottom-wrap">
		<div class="stay-logged-in-cont">
			<input type="checkbox" id="stayLoggedIn" />
			<label for="stayLoggedIn">로그인 상태 유지</label>
		</div>
		<div class="join-cont">
			<span>아직 회원이 아니신가요?</span>
			<button class="text-btn" onclick="goToJoin()">회원가입</button>
		</div>
	</div>
</div>

<!-- JS파일 분리 -->
<%@include file="loginJs.jsp"%>