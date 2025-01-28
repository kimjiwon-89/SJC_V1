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

    let duplCheck = false;
    function fnDuplIdCheck() {

        let userId = $('#userId').val();
        if (!userId) {
            $("#userId").addClass("is-invalid").focus();
            $("#alertText").text("아이디를 입력해주세요.");
            return false;
        }
        if (/[^a-zA-Z]/.test(userId)) {
            $("#userId").val("").addClass("is-invalid").focus();
            $("#alertText").text("아이디는 영문으로만 입력해주세요.").show();
            return false;
        }

        $.ajax({
            url: "<c:url value="/duplIdCheck"/>",
            type: 'POST',
            data: {
                userId: $('#userId').val()
            },
            success: function(response) {
                if (response > 1) {
                    $("#userId").removeClass("is-valid").addClass("is-invalid");
                    $("#alertText").text("이미 존재하는 아이디입니다.").show();
                } else {
                    duplCheck = true;

                    $("#alertText").hide();
                    $("#userId").removeClass("is-invalid").addClass("is-valid");
                    $("#userId").next().addClass("display-none");
                }
            },
            error: function(xhr, status, error) {
                alert('서버와의 통신에 실패했습니다.');
            }
        });
    }

    // 회원가입 구현
    function userSave() {
        if(!vaildation()) return;
        var userId = $('#userId').val();
        var userPwd = $('#userPwd').val();

        $.ajax({
            url: "<c:url value="/joinUser"/>",
            type: 'POST',
            data: {
                userId: userId,
                userPwd: userPwd,
            },
            success: function(response) {
                if (response.success) {
                    alert("회원가입에 성공하였습니다. 로그인을 진행해주세요.")
                    window.location.href = '<c:url value="/loginPage" /> ';
                } else {
                    alert('서버와의 통신에 실패했습니다');
                }
            },
            error: function(xhr, status, error) {
                alert('서버와의 통신에 실패했습니다.');
            }
        });
    }

    function vaildation() {
        let userId       = $('#userId').val();
        let userPwd      = $('#userPwd').val();
        let userPwdCheck = $('#userPwdCheck').val();

        if (!userId) {
            $("#userId").addClass("is-invalid").focus();
            $("#alertText").text("아이디를 입력해주세요.").show();
            return false;
        }
        if (/[^a-zA-Z]/.test(userId)) {
            $("#userId").val("").addClass("is-invalid").focus();
            $("#alertText").text("아이디는 영문으로만 입력해주세요.").show();
            return false;
        }

        if(!duplCheck) {
            $("#userId").addClass("is-invalid").focus();
            $("#alertText").text("아이디 중복확인을 진행해주세요.").show();
            return false;
        }


        if (!userPwd) {
            $("#userPwd").addClass("is-invalid").focus();
            $("#alertText").text("비밀번호를 입력해주세요.").show();
            return false;
        }

        if(!userPwdCheck) {
            $("#userPwdCheck").addClass("is-invalid").focus();
            $("#alertText").text("비밀번호 확인란을 입력해주세요.").show();
            return false;
        }
        if(userPwd !== userPwdCheck) {
            $("#userPwdCheck").addClass("is-invalid").focus();
            $("#alertText").text("확인 비밀번호가 일치하지 않습니다. 다시 확인해주세요.").show();
            return false;
        }

        $("#userId").removeClass("is-invalid");
        $("#userPwd").removeClass("is-invalid");
        $("#userPwdCheck").removeClass("is-invalid");

        $("#alertText").hide();
        return true;
    }

    // ID 입력 필드 키업 이벤트
    $("#userId").on("keyup", function () {
        if($(this).hasClass("is-valid")){
            duplCheck = false;
            $(this).removeClass("is-valid");
            $(this).next().removeClass("display-none");
        }
    });


    function showPwd(element) {
        const input = $(element).prev('input'); // 버튼 바로 앞의 input 요소
        const icon = $(element).find('i'); // 버튼 내부의 아이콘

        if (input.attr('type') === 'password') {
            input.attr('type', 'text'); // 비밀번호 보이기
            icon.removeClass('fa-eye-slash').addClass('fa-eye');
        } else {
            input.attr('type', 'password'); // 비밀번호 숨기기
            icon.removeClass('fa-eye').addClass('fa-eye-slash');
        }
    }

</script>
