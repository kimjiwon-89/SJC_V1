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
    // 회원가입 구현
    function userSave() {
        if(!vaildation()) return;
        var userId = $('#userId').val();
        var userPwd = $('#userPwd').val();
        var userName = $('#userName').val();

        $.ajax({
            url: "<c:url value="/join"/>",
            type: 'POST',
            data: {
                userId: userId,
                userPwd: userPwd,
                userName: userName
            },
            success: function(response) {
                if (response.success) {
                    alert("회원가입에 성공하였습니다. 로그인을 진행해주세요.")
                    window.location.href = '<c:url value="/loginPage" /> ';
                } else {
                    alert('이미 존재하는 아이디 나중에추가');
                }
            },
            error: function(xhr, status, error) {
                alert('서버와의 통신에 실패했습니다.');
            }
        });
    }

    function vaildation() {
        var userId = $('#userId').val();
        var userPwd = $('#userPwd').val();
        var userName = $('#userName').val();

        if(userId === "") {
            alert("ID를 입력해주세요.");
            $("#userid").focus();

            return false;
        } else if(userPwd === "") {
            alert("비밀번호를 입력해주세요.");
            $("#userPwd").focus();
            return false;
        } else if(userName === "") {
            alert("이름을 입력해주세요.");
            $("#userName").focus();
            return false;
        }

        return true;
    }

</script>
