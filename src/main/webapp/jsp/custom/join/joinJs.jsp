<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
function goToDesc(_descType) {
	const currentUrl = window.location.href;
	const url = currentUrl + "serviceDescription?descType=" + _descType;
	window.location.href = url;
}

// 이메일 회원가입 이동
function goToEmailJoin() {
    const currentUrl = window.location.href;
    window.location.href = currentUrl+'joinEmail';
}
</script>
