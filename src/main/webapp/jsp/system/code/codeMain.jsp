<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="content-layout pd new-search-saju">
	<div class="title-wrap center">
		<h1>코드 관리</h1>
	</div>
	<div class="content-wrap">
		<div class="name-cont">
			<h5 class="cont-title">이름</h5>
			<div class="cont-area">
				<input type="text" class="info-name" id="serch_name" >
			</div>
		</div>
		
		<div class="gender-cont">
			<h5 class="cont-title">성별</h5>
			<div class="cont-area radio-wrap flex-space-btween-row">
				<input class="text-radio" type="radio" name="gender" id="gender_m" value="M" checked>
	            <label class="text-radio-label" for="gender_m">남자</label>
	            <input class="text-radio" type="radio" name="gender" id="gender_w" value="W">
	            <label class="text-radio-label" for="gender_w">여자</label>   
			</div>   
        </div>
        
		<div class="bitrhday-cont">
			<h5 class="cont-title">생년월일</h5>
			<div class="cont-area">
				<input class="" type="text" id="birthday" name="birthday" placeholder="2000-01-01">
				<div class="radio-wrap flex-space-btween-row">
					<input class="text-radio" type="radio" name="smonth" id="smonth_sol" value="sol" checked>
		            <label class="text-radio-label" for="smonth_sol">양력</label>
		            <input class="text-radio" type="radio" name="smonth" id="smonth_lun" value="lun">
		            <label class="text-radio-label" for="smonth_lun">음력</label> 
				</div>
				
			</div>
		</div>
		<div class="birthtime-cont">
			<h5 class="cont-title">태어난 시간</h5>
			<div class="cont-area">
				
				<!-- selectbox -> input으로 변경 -->
				<input type="text" id="birthTime" placeholder="00:00"/>
				<div class="flex-start">
					<input type="checkbox" id="knowBirthTimeYn" />
					<label class="" for="knowBirthTimeYn">시간 모름</label>
				</div>
			</div>
		</div>
       <div class="btn-cont">
			<button class="search-btn" onclick="search()">사주 조회하기</button>
       		
			<div class="flex-space-around-row">
				<button class="text-btn" onclick="goLogin()">로그인</button>
				<button class="text-btn" onclick="goJoin()">회원가입</button>
				<button class="text-btn" onclick="">저장하기</button>
				<button class="text-btn" onclick="">회원목록</button>
			</div>
       </div>
    </div>
</div>