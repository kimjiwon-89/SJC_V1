<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
	/* Default 색상 임시 추가 */
	.footer-manu-bar .footer-btn.active {
		background: #80808026;
	}
</style>
<div class="footer-manu-bar">

	<%-- HOME --%>
	<button type="button" class="text-btn footer-btn active" onclick="selectMenu(this, 'saju/main')">
		<img src="/static/img/icon/Home.png" />
	</button>

	<%-- ? --%>
	<button type="button" class="text-btn footer-btn" onclick="selectMenu(this, '')">
		<img src="/static/img/icon/Search.png" />
	</button>

	<%-- List --%>
	<button type="button" class="text-btn footer-btn" onclick="selectMenu(this, '')">
		<img src="/static/img/icon/List.png" />
	</button>

	<%-- 마이 페이지 --%>
	<button type="button" class="text-btn footer-btn" onclick="selectMenu(this, '')">
<!-- 		<i class="fa fa-user-o" aria-hidden="true"></i> -->
<!-- 		<span>프로필</span> -->
		<img src="/static/img/icon/User.png" />
	</button>

	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SUPER')">
		<button type="button" class="text-btn footer-btn" onclick="selectMenu(this, '')">
			<!-- 		<i class="fa fa-user-o" aria-hidden="true"></i> -->
			<!-- 		<span>프로필</span> -->
			<img src="/static/img/icon/SystemUser.png" />
		</button>
	</sec:authorize>
</div>

<script>
	/* 하단 탭 메뉴 구성, 페이지 이동 */
	function selectMenu(element, type) {
		if(type === "") return;

		$(".footer-btn").removeClass("active");
		$(element).addClass("active");

		window.location.href = "${pageContext.request.contextPath}/"+ type;  // 해당 URL로 이동
	}
</script>