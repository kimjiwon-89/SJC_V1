<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="https://kit.fontawesome.com/60d85a80ee.js"
	crossorigin="anonymous"></script>

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

.result-table td {
	border: 1px solid #ccc;
	padding: 0 !important;
}

</style>

<div class="content-layout new-result-saju">
	<div class="title-wrap">
		<h1>everysaju</h1>
	</div>
	<div class="user-wrap">
		<div class="user-img">
			<i class="fa-solid fa-user" style="font-size: 80px;"></i>
<!-- 			<img src="https://media.istockphoto.com/id/157332035/ko/%EC%82%AC%EC%A7%84/%EC%8B%9C%ED%94%84-%EC%9E%88%EB%8F%84%EB%A1%9D-%EA%B0%84%EB%8B%A8%ED%95%9C-%EC%9E%90%EC%84%B8.jpg?s=612x612&w=is&k=20&c=N9QQdhrDllW-TrcQlwa3_1KWGSW3Vgti71mPW9Vmbws=" /> -->
		</div>
		<div class="user-info">
			<span class="user-nm" id="serch_name">김댕댕</span>
			<span class="user-year" id="user-day">을미(푸른 양)</span>
			<span class="user-birth" id="birth-info">양력 2000.01.01 00:00:00(자) 남자</span>
		</div>
	</div>
	<div class="content-wrap">
		<!-- 팔자 -->
		<div class="palja-cont">
			<div class="content-area">
				<table class="table info-table">
					<colgroup>
						<col style="width: 25%;">
						<col style="width: 25%;">
						<col style="width: 25%;">
						<col style="width: 25%;">
					</colgroup>
					<tbody>
						<tr class="lunar_title">
							<th scope="row">시주(생시)</th>
							<th scope="row">일주(생일)</th>
							<th scope="row">월주(생월)</th>
							<th scope="row">년주(생년)</th>
						</tr>
						<tr id="sky10got">
							<td id="time_saju10sin1"></td>
							<td>일간(나)</td>
							<td id="month_saju10sin1"></td>
							<td id="year_saju10sin1"></td>
						</tr>
						<tr class="lunar_cont_top">
							<td class="" id="time_saju1"></td>
							<td class="" id="day_saju1"></td>
							<td class="" id="month_saju1"></td>
							<td class="" id="year_saju1"></td>
						</tr>
						<tr class="lunar_cont_top">
							<td class="" id="time_saju2"></td>
							<td class="" id="day_saju2"></td>
							<td class="" id="month_saju2"></td>
							<td class="" id="year_saju2"></td>
						</tr>
						<tr id="ground10got">
							<td id="time_saju10sin2"></td>
							<td id="day_saju10sin2"></td>
							<td id="month_saju10sin2"></td>
							<td id="year_saju10sin2"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	
	
		<!-- 대운 -->
		<div class="detail-bar" id="daeun_detail">
			<span>대운 자세히 보기</span>
			<i class="fa-solid fa-angle-down"></i>
		</div>
		<div class="daeun-cont " id="daeun_cont">
			<c:forEach begin="1" end="3" var="wrap">
				<div class="daeun-wrap">
					<div class="daeun-title">대운수: 8(역)</div>
					<!--  나란히 사용하려면 daeun-cont-set 사용, 가운데 정렬시 마지막 flex 추가 -->
					<div class="daeun-cont-set">
						<c:forEach begin="0" end="11" var="i">
							<div class="daeun-line">
								<div class="daeun-small-title">
									<span>${i}8</span>
									<span>편인</span>
								</div>
								<div class="daeun-in text_white"> <!-- 컬러 추가 -->
									<span class="daeun-strong">丙</span> 
									<span class="daeun-small">(병)</span>
								</div>
								<div class="daeun-in text_green">
									<span class="daeun-strong">丙</span> 
									<span class="daeun-small">(병)</span>
								</div>
								<div class="daeun-small-title">
									<span>겁재</span>
									<span>장생</span>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
		

		<!-- 운세 달력 -->
		<div class="cal-cont">
			<div class="content-area" id="resultCalendar">
				<div class="calendar-container">
					<div class="calendar-header">
						<button class="cal-btn" id="prevMonth">
							<i class="fa-solid fa-angle-left"></i>
						</button>
						<div class="month-area">
							<span class="month" id="currentDate"></span>
							<span class="month-info" id="yearInfo">甲辰 壬申(갑진년 임신월)</span>
						</div>
						<button class="cal-btn" id="nextMonth">
							<i class="fa-solid fa-angle-right"></i>
						</button>
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
									<th class="holiday">SUN</th>
									<th>MON</th>
									<th>TUE</th>
									<th>WEN</th>
									<th>THU</th>
									<th>FRI</th>
									<th class="satday">SAT</th>
								</tr>
							</thead>
							<tbody id="calendar"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- JS파일 분리 -->
<%@include file="sajuResultJs.jsp"%>