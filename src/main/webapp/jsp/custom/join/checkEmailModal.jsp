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
				사용가능한 이메일이에요!
			</div>
			<div class="bottom-desc">
				가입을 위해 본인 확인을 진행해주세요
			</div>
		</div>
	</div>

	<button class="black-btn" onclick="closeModal(this)">현재 이메일 사용</button>
</div>