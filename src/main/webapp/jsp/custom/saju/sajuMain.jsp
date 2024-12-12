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
		<h1>everysaju</h1>
<!-- 		<h2>사주 정보 입력</h2> -->
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
				 
<!--  				<select class="ipt select2" id="birthTime" name="birthTime">  -->
					<%--<option value="모름">모름</option>
					<option value="자시 (23:30 - 01:29)">자시 (23:30 - 01:29)</option>
					<option value="축시 (01:30 - 03:29)">축시 (01:30 - 03:29)</option>
					<option value="인시 (03:30 - 05:29)">인시 (03:30 - 05:29)</option>
					<option value="묘시 (05:30 - 07:29)">묘시 (05:30 - 07:29)</option>
					<option value="진시 (07:30 - 09:29)">진시 (07:30 - 09:29)</option>
					<option value="사시 (09:30 - 11:29)">사시 (09:30 - 11:29)</option>
					<option value="오시 (11:30 - 13:29)">오시 (11:30 - 13:29)</option>
					<option value="미시 (13:30 - 15:29)">미시 (13:30 - 15:29)</option>
					<option value="신시 (15:30 - 17:29)">신시 (15:30 - 17:29)</option>
					<option value="유시 (17:30 - 19:29)">유시 (17:30 - 19:29)</option>
					<option value="술시 (19:30 - 21:29)">술시 (19:30 - 21:29)</option>
					<option value="해시 (21:30 - 23:29)">해시 (21:30 - 23:29)</option>--%>
<!-- 				</select> -->
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
    
 <!--   <div class="content">
       광고 자리^^ 
   </div> -->
</div>


<!-- JS파일 분리 -->
<%@include file="sajuMainJs.jsp"%>

