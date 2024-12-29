<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="content-layout pd login-wrap join-wrap">
	<div class="title-wrap back-title big">
		<button class="back-btn" onclick="goToback()">
			<i class="fa fa-angle-left" aria-hidden="true"></i>
		</button>
		<h1>회원가입 하기</h1>
	</div>
	
	<div class="join-check-wrap">
		<div class="all-check">
			<input type="checkbox" id="allCheck" />
			<label for="allCheck">전체 약관 동의</label>
		</div>
		<div class="">
			<input type="checkbox" id="tosCheck" />
			<label for="tosCheck">서비스 이용약관(필수)</label>
			<button class="text-btn" onclick="goToDesc('termsOfService')">내용보기</button>
		</div>
		<div class="">
			<input type="checkbox" id="ppCheck" />
			<label for="ppCheck">개인정보 수집 및 이용(필수)</label>
			<button class="text-btn" onclick="goToDesc('privacyPolicy')">내용보기</button>
		</div>
	</div>
	
	<div class="login-select-wrap">
		<button class="login-btn kakao-login" onclick="">카카오로 간편 가입하기</button>
		<button class="login-btn naver-login" onclick="">네이버로 간편 가입하기</button>
		<button class="login-btn google-login" onclick="">구글계정으로 간편 가입하기</button>
		<button class="login-btn email-login" onclick="goToEmailJoin()">이메일로 가입하기</button>
	</div>
</div>

<!-- JS파일 분리 -->
<%@include file="joinJs.jsp"%>