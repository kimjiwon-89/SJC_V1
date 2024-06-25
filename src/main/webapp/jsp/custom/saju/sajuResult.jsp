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
	
	/* 7일 */
	#calendar {
	    display: grid;
	    grid-template-columns: repeat(7, 1fr);
	    grid-gap: 2px;
        max-width: 1200px;
/* 	    margin: 20px; */
	}
	
	.calendar-header {
		display: flex;
		justify-content: center;
		margin: 20px;
		font-size: 20px;
		align-items: center;
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
	.weekday {
		border: 1px solid #ccc;
		padding: 10px;
		text-align: center;
		background-color: #f0f0f0;
	}
	
	/* 공휴일 */
	.holiday {
		color: #dc3545 !important;
	}
	/* 토 */
	.satday {
		color: #0d6efd !important;
	}
	/* 활성화되지 않은 색상 */
	.inactive {
        filter: opacity(0.5);	
	}
	.detail-day {
		font-size: 12px;
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
   	 	font-weight: bold;
	}
	/* 달력 한 칸 */
	.day {
	    color: black;
	    border: 1px solid #ccc;
	    padding: 5px;
	    text-align: center;
	    min-height: 70px;
	}
	
	/* 오늘 날짜 */
	.today {
		background: rgb(76 175 80 / 40%);
	}
	
	/* 날짜 안 운세 */
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
              <img src="" class="saju-img" id="saju_1">
              <img src="" class="saju-img"  id="saju_2">
          </div>
          <div class="profile-info">
              <p>${ bean.lunIljin }</p>
              <p>생년월일: ${ bean.solYear }-${ bean.solMonth }-${ bean.solDay }  (음력 ${ bean.lunYear }-${ bean.lunMonth }-${ bean.lunDay })</p>
              <p>출생시간: ${ bean.birthTime }</p>
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
          <div id='calendar'></div>
       </div>
   </div>
</div>
