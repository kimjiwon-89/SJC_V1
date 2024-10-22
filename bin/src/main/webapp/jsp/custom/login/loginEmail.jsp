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
		<span>이메일로 로그인</span>
	</div>
	<div class="login-email-wrap">
		<input type="text" placeholder="아이디(이메일)" autofocus />
		<input type="password" placeholder="비밀번호" />
	</div>
	<div class="login-btn-wrap">
		<button class="login-btn">로그인</button>
		<div class="flex-space-btween">
			<div class="find-id-pw-cont">
				<button class="text-btn find-id-btn" onclick="">아이디 찾기</button>
				<button class="text-btn" onclick="">비밀번호 찾기</button>
			</div>
			<div class="stay-logged-in-cont">
				<input type="checkbox" id="stayLoggedIn" />
				<label for="stayLoggedIn">로그인 상태 유지</label>
			</div>
		</div>
	</div>
	<div class="login-bottom-wrap">
		<div class="join-cont">
			<span>아직 회원이 아니신가요?</span>
			<button class="text-btn" onclick="goToJoin()">회원가입</button>
		</div>
	</div>
</div>

<!-- JS파일 분리 -->
<%@include file="loginJs.jsp"%>