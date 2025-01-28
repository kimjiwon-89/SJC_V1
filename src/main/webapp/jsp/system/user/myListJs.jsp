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

    // 로그인 구현
    $('#loginForm').submit(function(e) {
        e.preventDefault(); // 폼 제출을 막고 AJAX로 처리

        var userId = $('#userId').val();
        var userPwd = $('#userPwd').val();
        var csrfToken = $('meta[name="csrf-token"]').attr('content');

        $.ajax({
            url: "<c:url value="/login"/>",
            type: 'POST',
            data: {
                userId: userId,
                userPwd: userPwd
            },
            headers: {
                'X-CSRF-TOKEN': csrfToken // CSRF 토큰을 헤더에 추가
            },
            success: function(response) {
                if (response.success) {
                    window.location.href = '<c:url value="/saju/main"/>'; // 로그인 성공 시 페이지 이동
                } else {
                    alert('로그인 실패! 아이디나 비밀번호를 확인해주세요.');
                }
            },
            error: function(xhr, status, error) {
                alert('서버와의 통신에 실패했습니다.');
            }
        });
    });

    function goToJoin() {
        window.location.href = "<c:url value="/joinPage"/>";
    }

</script>
