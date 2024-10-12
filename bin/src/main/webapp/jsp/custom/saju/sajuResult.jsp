<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="https://kit.fontawesome.com/60d85a80ee.js" crossorigin="anonymous"></script>

<style>

	/* 한자 영역 너비 */
	.ml-auto {
	    width: 60px;
	}
	/* 이미지 거리 */
   .saju-img:first-child {
      margin-bottom: 1px;
   }
   
	.result-table {
		table-layout: fixed; 
	}
	.result-table td{
		border: 1px solid #ccc;
    	padding: 0 !important;
	}

	 /* CSS 달력  */
	.calendar-container {
		width: 100%;
	}
	#resultCalendar{
		padding: 5px;
	}
	
	.calendar-header {
		display: flex;
		justify-content: center;
		margin: 20px;
		font-size: 20px;
		align-items: center;
	}
	
	#calendar {
		max-width: 1200px;
		margin: 20px;
	}
	
	/* #currentDate에 flex-grow: 1을 사용하여 가능한 공간을 모두 차지하게 하고 텍스트를 중앙에 정렬. */
	#currentDate {
		flex-grow: 1;
		text-align: center;
		font-size: 1.5em;
	}
	
	/*월 변경 버튼*/
	.btn{
		background-color: #4CAF50;
	    color: white;
	    border: none;
	    border-radius: 4px;
	    padding: 5px 10px;
	    transition: background-color 0.3s;
	    height: 40px;
	}
	.btn:hover{
		background-color: #45a049;
	}
	
	/* 가장 위 날짜 */
	.calendar-wrapper thead th {
	    border: 1px solid #ccc;
	    padding: 10px;
	    text-align: center;
	    background-color: #f0f0f0;
	}
	
	/* 공휴일 red*/
	.holiday {
		color: #dc3545 !important;
	}
	/* 토 blue */
	.satday {
		color: #0d6efd !important;
	}
	/* 활성화되지 않은 색상 연하게 */
	.inactive {
        filter: opacity(0.5);	
	}
	/* 달력 한 칸 */
	.day {
	    min-height: 80px;
        padding: .5rem .5rem;
	}
	/* 상단에 고정시킬 날짜와 공휴일 이름 */
	.detail-day {
		font-size: 1em;
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
   	 	font-weight: bold;
	}
	.dateName {
	    font-size: 1em !important;
	}
	/* 오늘 날짜 */
	.today {
		background: rgb(76 175 80 / 40%);
	}
	
	/* 운세 영역*/
	.day-result {
	    display: block;
	    font-size: 0.8em;
	}
</style>

<c:set var="splitted" value="${fn:split(bean.lunIljin, '(')[1]}" />
<c:set var="firstChar" value="${fn:substring(splitted, 0, 1)}" />
<c:set var="secondChar" value="${fn:substring(splitted, 1, 2)}" />			

<div class="div-flex">
	<div class="logo">
		<h1>매일 운세 달력</h1>
	</div>
	<div class="content">
	   <div class="d-flex wd-100p">

			<div class="p-2 f8 justify-content-center">
				<table class="table info-table">
					<colgroup>
						<col style="width: auto;">
						<col style="width: 100%;">
					</colgroup>        				
		            <tbody>
		                <tr>
		                    <th scope="row">생년월일</th>
		                    <td>${ bean.solYear }-${ bean.solMonth }-${ bean.solDay }</td>
		                </tr>
		                <tr>
		                    <th scope="row">음력</th>
		                    <td>${ bean.lunYear }-${ bean.lunMonth }-${ bean.lunDay }</td>
		                </tr>
		                <tr>
		                    <th scope="row">출생시간</th>
		                    <td>${ bean.birthTime }</td>
		                </tr>
		                <tr>
		                    <th scope="row">성별</th>
		                    <td>${ bean.gender eq 'M' ? '남' : '여' }</td>
		                </tr>
		            </tbody>
		        </table>			
			</div>
		</div>
	</div>
	<div class="content">
<!-- 		<div class="p-2 d-flex f1 flex-column justify-content-center"> -->
<%-- 			<span class="saju-img" id="saju_1">${ firstChar }</span> --%>
<%-- 			<span class="saju-img"  id="saju_2">${ secondChar }</span> --%>
<!-- 		</div> -->

 		<div class="row">
            <div class="col">
                <div class="d-flex flex-column">
                    <div id="time_saju1" class="mb-2 saju-img"></div>
                    <div id="time_saju2" class="saju-img"></div>
                </div>
            </div>
            <div class="col">
                <div class="d-flex flex-column">
                    <div id="day_saju1" class="mb-2 saju-img"></div>
                    <div id="day_saju2" class="saju-img"></div>
                </div>
            </div>
            <div class="col">
                <div class="d-flex flex-column">
                    <div id="month_saju1" class="mb-2 saju-img"></div>
                    <div id="month_saju2" class="saju-img"></div>
                </div>
            </div>
            <div class="col">
                <div class="d-flex flex-column">
                    <div id="year_saju1" class="mb-2 saju-img"></div>
                    <div id="year_saju2" class="saju-img"></div>
                </div>
            </div>
        </div>

	</div>
	<div class="content" id="resultCalendar">
		<div class="calendar-container">
		<div class="calendar-header">
			<button class="btn" id="prevMonth"><i class="fa-solid fa-angle-left"></i></button>
			<span id="currentDate"></span>
			<button class="btn" id="nextMonth"><i class="fa-solid fa-angle-right"></i></button>
		</div>
		<div class='calendar-wrapper'>
			<table class="table result-table">
				<colgroup>
					<col style="width: 14.2857%;">
					<col style="width: 14.2857%;">
					<col style="width: 14.2857%;">
					<col style="width: 14.2857%;">
					<col style="width: 14.2857%;">
					<col style="width: 14.2857%;">
					<col style="width: 14.2857%;">
				</colgroup>			
				<thead>
					<tr>
						<th>일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th>토</th>
					</tr>
				</thead>
				<tbody id="calendar"></tbody>
			</table>
		</div>
		</div>
	</div>
</div>

<!-- JS파일 분리 -->
<%@include file="sajuResultJs.jsp"%>