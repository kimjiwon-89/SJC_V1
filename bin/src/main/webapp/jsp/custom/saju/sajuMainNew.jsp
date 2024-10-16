<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="main-wrap login-wrap">
	<div class="title-wrap">
		<h1>everysaju</h1>
		<h2>사주 정보 입력</h2>
	</div>
	<div class="content-wrap">
		<div class="name-cont">
			<h5 class="cont-title">이름</h5>
			<div class="cont-area">
				<input type="text" class="" >
			</div>
		</div>
		<div class="bitrhday-cont">
			<h5 class="cont-title">생년월일</h5>
			<div class="cont-area">
				<input class="" type="text" id="birthday" name="birthday" placeholder="2000-01-01">
				<select class="ipt select2 wd-20p" id="smonth" name="smonth">
					<option value="sol">양력</option>
					<option value="lun">음력</option>
				</select>
			</div>
		</div>
		<div class="birthtime-cont">
			<h5 class="cont-title">생년월일</h5>
			<div class="cont-area">
				<select class="" id="birthTime" name="birthTime">
					<option value="모름">모름</option>
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
					<option value="해시 (21:30 - 23:29)">해시 (21:30 - 23:29)</option>
				</select>
			</div>
		</div>
		<div class="gender-cont">
			<h5 class="cont-title">태어난 시간</h5>
			<div class="cont-area">
				<label class="ipt-radio-label">남자</label>
				<input class="ipt-radio" type="radio" name="gender" value="M" checked>
	            <label class="ipt-radio-label">여자</label>
	            <input class="ipt-radio" type="radio" name="gender" value="W">   
			</div>   
        </div>
        
        <div class="mgt-10">
           <button style= "font-family: TheJamsil4Medium" class="result-btn" onclick="search()">조회하기</button>
           <button style= "font-family: TheJamsil4Medium" class="result-btn" onclick="search2()">궁합보기</button>
        </div>
    </div>
 <!--   <div class="content">
       광고 자리^^ 
   </div> -->
</div>


<!-- JS파일 분리 -->
<%@include file="sajuMainNewJs.jsp"%>

