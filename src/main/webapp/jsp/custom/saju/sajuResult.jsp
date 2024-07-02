<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- JS파일 분리 -->
<%@include file="sajuResultJs.jsp"%>

<style>
   img.saju-img {
       width: calc(80% - 5px);
       max-width: 50px
   }
   .saju-img:first-child {
      margin-bottom: 1px;
   }
   .profile-tab {
       display: flex;
       align-items: center;
   }
   .profile-tab .photos {
       display: flex;
       flex-direction: column;
       align-items: center;
       margin-right: 20px;
       width: calc(20% - 10px);
   }
   .profile-info p {
       margin: 5px 0;
       text-align: left;
   }
   
   .profile-info {
       width: 80%;
   }



	 /* CSS 달력  */
	.calendar-container {
		width: 100%;
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
	
	/* #currentDate에 flex-grow: 1을 사용하여 가능한 공간을 모두 차지하게 하고 텍스트를 중앙에 정렬합니다. */
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
        filter: opacity(0.7);	
	}
	/* 달력 한 칸 */
	.day {
	    color: black;
	    border: 1px solid #ccc;
	    padding: 5px;
	    text-align: center;
	    min-height: 70px;
   	 	vertical-align: top;
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
	    font-size: 0.8em !important;
	}
	/* 오늘 날짜 */
	.today {
		background: rgb(76 175 80 / 40%);
	}
	
	/* 운세 영역*/
	.day-result {
	    display: block;
	    font-size: 14px;
	}
</style>

<div class="div-flex">
	<div class="logo">
		<h1>매일 운세 달력</h1>
	</div>
	<div class="content">
	   <div class="profile-tab">
			<div class="photos">
<!-- 				<img src="" class="saju-img" id="saju_1"> -->
<!-- 				<img src="" class="saju-img"  id="saju_2"> -->
				<c:set var="splitted" value="${fn:split(bean.lunIljin, '(')[1]}" />
				<c:set var="firstChar" value="${fn:substring(splitted, 0, 1)}" />
				<c:set var="secondChar" value="${fn:substring(splitted, 1, 2)}" />			
				<span class="saju-img" id="saju_1">${ firstChar }</span>
				<span class="saju-img"  id="saju_2">${ secondChar }</span>
			</div>
			<div class="profile-info">
				
				<span class="text-left block"> <span class="bold">생년월일: </span>${ bean.solYear }-${ bean.solMonth }-${ bean.solDay }</span>
				<span class="text-left block"> <span class="bold">음력: </span>${ bean.lunYear }-${ bean.lunMonth }-${ bean.lunDay }</span>
				<span class="text-left block"> <span class="bold">출생시간: </span>${ bean.birthTime }</span>
				<span class="text-left block"> <span class="bold">성별: </span>${ bean.gender eq 'M' ? '남' : '여' }</span>
			</div>
		</div>
	</div>
	<div class="content">
		광고 자리^^
	</div>
	<div class="content" id="resultCalendar">
		<div class="calendar-container">
		<div class="calendar-header">
			<button class="btn" id="prevMonth">&lt;</button>
			<span id="currentDate"></span>
			<button class="btn" id="nextMonth">&gt;</button>
		</div>
		<div class='calendar-wrapper'>
			<table>
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
