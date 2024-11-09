<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
	/* Default 색상 임시 추가 */
	.footer-manu-bar .footer-btn.active {
		background: #80808026;
	}
</style>
<div class="footer-manu-bar">
	<button class="text-btn footer-btn" onclick="selectMenu('')">
		<i class="fa fa-home" aria-hidden="true"></i>
		<span>홈</span>
	</button>
	<button class="text-btn footer-btn active" onclick="selectMenu('saju/main')">
		<i class="fa fa-search" aria-hidden="true"></i>
		<span>사주조회</span>
	</button>
	<button class="text-btn footer-btn" onclick="selectMenu('')">
		<i class="fa fa-list-alt" aria-hidden="true"></i>
		<span>친구목록</span>
	</button>
	<button class="text-btn footer-btn" onclick="selectMenu('')">
		<i class="fa fa-user-o" aria-hidden="true"></i>
		<span>프로필</span>
	</button>
</div>