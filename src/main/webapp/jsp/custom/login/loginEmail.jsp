<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="https://kit.fontawesome.com/60d85a80ee.js"
	crossorigin="anonymous"></script>


<div class="content-layout pd login-wrap">
	<div class="title-wrap center">
		<h1>everysaju</h1>
	</div>
	<div class="content-wrap">
		<h2>이메일로 로그인</h2>

		<div class="email-cont">
			<h5 class="cont-title">이메일</h5>
			<div class="cont-area">
				<input type="text" placeholder="아이디(이메일)을 입력해주세요" autofocus/>
			</div>
		</div>

		<div class="password-cont">
			<h5 class="cont-title">비밀번호</h5>
			<div class="cont-area">
				<input type="password" placeholder="비밀번호를 입력해주세요" />
			</div>
		</div>

		<div class="login-btn-wrap">
			<button class="login-btn email-login">로그인</button>
			<div class="flex-space-btween-row">
				<div class="flex-center find-id-pw-cont">
					<button class="text-btn find-id-btn" onclick="">아이디 찾기</button>
					<button class="text-btn" onclick="">비밀번호 찾기</button>
				</div>
				<div class="stay-logged-in-cont">
					<input type="checkbox" id="stayLoggedIn" />
					<label for="stayLoggedIn">로그인 상태 유지</label>
				</div>
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