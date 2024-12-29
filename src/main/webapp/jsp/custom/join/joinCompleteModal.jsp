<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="useableCheckEmail flex-space-btween">
	<div class="center-content">
		<div class="roundChecked">
			<i class="fa fa-check" aria-hidden="true"></i>
		</div>
		<div class="text-desc">
			<div class="top-desc">
				회원 가입 완료!
			</div>
		</div>
	</div>

	<button class="black-btn" onclick="closeModal(this)">내 사주 보러 가기</button>
</div>