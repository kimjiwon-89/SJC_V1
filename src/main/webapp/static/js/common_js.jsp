<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script>
	//기본으로 쓰일 변수 선언
	const skyArr = ["갑", "을", "병", "정", "무", "기", "경", "신", "임", "계"];
	const groundArr = ["축", "인", "묘", "진", "사", "오", "미", "신", "유", "술", "해", "자"];

	

	//DATE Type yyyy-mm-dd형태 format 
	function formatDate(date) {
	   var year = date.getFullYear();
	   var month = String(date.getMonth() + 1).padStart(2, '0');
	   var day = String(date.getDate()).padStart(2, '0');
	   
	   return year + '-' + month + '-' + day;
	}

	
	//yyyy-mm-dd 형태 start~end까지 추출
	//Parameter : DATE
	function getCurrentCalendarDates(startDate, endDate ) {
		var datesArray = [];

	    var currentDate = new Date(startDate); // 시작 날짜를 복사하여 시작
	    while (currentDate <= endDate) {
	        datesArray.push(formatDate(currentDate)); // 날짜를 "yyyy-mm-dd" 형식으로 변환하여 배열에 추가
	        currentDate.setDate(currentDate.getDate() + 1); // 다음 날짜로 이동
	    }

	    return datesArray;
	}
	 
	
	
</script>