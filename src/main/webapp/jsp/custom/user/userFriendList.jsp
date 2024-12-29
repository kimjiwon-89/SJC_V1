<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="content-layout friend-list-wrap">
	<div class="title-wrap">
		<h1>저장목록</h1>
	</div>
	<div class="user-wrap">
		<div class="user-info">
			<div class="user-img">
				<i class="fa-solid fa-user"></i>
			</div>
			<span class="user-nm" id="serch_name">김댕댕</span>
		</div>
		<button class="text-btn" onclick="openModal('changeInfoModal')">
			<i class="fa fa-chevron-right" aria-hidden="true"></i>
		</button>
	</div>

	<div class="content-wrap">
		<div class="flex-space-btween-row sub-title-wrap">
			<h3 class="">친구목록</h3>
			<button class="text-btn">
				<span>이름순</span>
				<i class="fa fa-arrow-down" aria-hidden="true"></i>
			</button>
		</div>
		<div class="friend-list">
			<c:forEach begin="0" end="50" var="i">
				<div class="user-wrap">
					<div class="user-info">
						<div class="user-img">
							<i class="fa-solid fa-user"></i>
						</div>
						<span class="user-nm" id="friend_${i}">친구${i}</span>
					</div>
					<div class="score">${i}점</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<!-- JS파일 분리 -->
<%@include file="userFriendListJs.jsp"%>