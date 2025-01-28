<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="https://kit.fontawesome.com/60d85a80ee.js" crossorigin="anonymous"></script>

<div class="content-layout pd login-wrap">
	<div class="small-back-warp">
		<button class="back-btn" onclick="goToback()">
			<i class="fa fa-angle-left" aria-hidden="true"></i>
		</button>
	</div>
	<div class="content-wrap">
		<form id="loginForm">
			<div class="content-area">
				<h5 class="cont-title">아이디</h5>
				<div class="cont-area">
					<input class="form-control" type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요" autofocus/>
				</div>
			</div>

			<div class="content-area">
				<h5 class="cont-title">비밀번호</h5>
				<div class="cont-area">
					<input class="form-control" type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력해주세요" />
				</div>
			</div>

			<div id="alertText" class="text-danger mb-3"></div>

			<div class="content-area">
				<button type="button" class="login-btn email-login" onclick="goLogin();">로그인</button>
				<div class="flex-space-btween-row">
					<div class="flex-center find-id-pw-cont">
						<button type="button" class="text-btn find-id-btn" onclick="">아이디 찾기</button>
						<button type="button" class="text-btn" onclick="">비밀번호 찾기</button>
					</div>
					<div class="stay-logged-in-cont">
						<input type="checkbox" id="stayLoggedIn" />
						<label for="stayLoggedIn">로그인 상태 유지</label>
					</div>
				</div>
			</div>
		</form>
	</div>

	<div class="login-bottom-wrap">
		<div class="join-cont">
			<span>아직 회원이 아니신가요?</span>
			<button type="button" class="text-btn" onclick="window.location.href='<c:url value="/joinPage"/>'">회원가입</button>
		</div>
	</div>
</div>

<!-- JS파일 분리 -->
<%@include file="loginJs.jsp"%>