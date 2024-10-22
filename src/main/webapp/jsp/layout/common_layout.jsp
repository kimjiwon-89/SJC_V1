<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Saju</title>
	<link rel="icon" type="image/png" sizes="32x32" href="${rootPath}/static/img/favicon/favicon.ico">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Expires" content="-1">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="No-Cache">
	
	<c:set var="rootPath" value="${pageContext.request.contextPath}" scope="application"/>
	<c:set var="pageHash" value="<%=System.currentTimeMillis()%>" scope="request" />
	
	<!-- jquery -->
	<script src="${rootPath}/static/js/jquery-3.3.1.min.js"></script>
	<!-- FullCalendar -->
<%-- 	<script src="${rootPath}/static/js/index.global.min.js"></script> --%>
	<!-- dayJS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.11/dayjs.min.js"></script>
	
	<!-- Common css -->
	<link rel="stylesheet" type="text/css" media="screen" href="${rootPath}/static/css/common_css.css?v=${pageHash}">
    <link rel="stylesheet" href="${rootPath}/webjars/bootstrap/5.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" media="screen" href="${rootPath}/static/css/common_v2.css?v=${pageHash}">
    
    <!-- select2 - selectBox API -->
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

	<!-- 구글 폰트 -->
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
	</style>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/60d85a80ee.js"
	crossorigin="anonymous"></script>

</head>
<body>
	<!-- <div class="container body-wrapper"> -->
	<div class="new-container">
    	<script src="${rootPath}/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
		<jsp:include page="${rootPath}/static/js/common_js.jsp" />
    	
		<!-- 기존 컨텐츠영역 -->
		<%-- <div class="div-flex-wrap" id="content" style="">
			<jsp:include page='../custom/${viewName}.jsp' flush="false"/>
		</div> --%>
		
		<!-- 컨텐츠영역 new -->
		<div class="new-content-area" id="content" style="">
			<jsp:include page='../custom/${viewName}.jsp' flush="false"/>
		</div>
		
    	<!-- footer 하단 버튼 바 추가 -->
    	<footer class="footer-area">
    		<jsp:include page='../layout/footer.jsp' flush="false"/>
		</footer>
	</div>
</body>
</html>

<script>
// 	$("#content").load("/saju/sajuMain");
	
	//로딩함수 호출 함수
	function uiProgress(_sel, status) {
		if(status) {
		    var html = '<div class="loader-wrapper">';
				html +=	'<div id="loader" class="loader"></div>';
		    	html += '</div>';
		    	
			$(_sel).append(html);
		} else {
			$(".loader-wrapper").remove();
		}
	}
</script>
