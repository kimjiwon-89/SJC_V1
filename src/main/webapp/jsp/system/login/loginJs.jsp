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

    function goLogin() {
        if(!vaildation() ) return;
        $('#loginForm').submit();
    }

    function vaildation() {
        let userId = $("#userId").val();
        let userPwd = $("#userPwd").val();

        if (!userId) {
            $("#userId").addClass("is-invalid").focus();
            $("#alertText").text("아이디를 입력해주세요.");
            return false;
        }

        if (/[^a-zA-Z]/.test(userId)) {
            $("#userId").addClass("is-invalid").focus();
            $("#alertText").text("아이디는 영문으로만 입력해주세요.").show();
            return false;
        } else {
            $("#userIdAlert").hide();
        }

        if (!userPwd) {
            $("#userPwd").addClass("is-invalid").focus();
            $("#alertText").text("비밀번호를 입력해주세요.");
            return false;
        }

        return true;
    }

    // ID 입력 필드 키업 이벤트
    $("#userId").on("keyup", function () {
        $(this).removeClass("is-invalid");
        if (!$("#userPwd").hasClass("is-invalid")) {
            $("#alertText").text("");
        }
    });

    // Password 입력 필드 키업 이벤트
    $("#userPwd").on("keyup", function () {
        $(this).removeClass("is-invalid");
        if (!$("#userPwd").hasClass("is-invalid")) {
            $("#alertText").text("");
        }
    });

    // 로그인 구현
    $('#loginForm').submit(function(e) {
        e.preventDefault(); // 폼 제출을 막고 AJAX로 처리

        $.ajax({
            url: "<c:url value="/login"/>",
            type: 'POST',
            data: {
                userId: $('#userId').val(),
                userPwd: $('#userPwd').val()
            },
            success: function(response) {
                if (response.success) {
                    window.location.href = '<c:url value="/saju/main"/>'; // 로그인 성공 시 페이지 이동
                } else {
                    alert(response.message);
                }
            },
            error: function(xhr, status, error) {
                alert('서버와의 통신에 실패했습니다.');
            }
        });
    });


</script>
