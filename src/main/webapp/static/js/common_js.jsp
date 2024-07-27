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
	 
	

	//날짜 확인
	function checkDate() {
	    const birthEl = document.getElementsByName('birthday');

	    for (var i = 0; i < birthEl.length; i++) {
			const dateInput = birthEl[i].value;
		    const datePattern = /^\d{4}-\d{2}-\d{2}$/;
	
		    //1. yyyy-mm-dd 형식 확인
		    if (!datePattern.test(dateInput)) {
		        alert('날짜 형식이 유효하지 않습니다. \n yyyy-mm-dd 형식으로 입력해 주세요.');
		        return false;
		    }
	
		    //2. 실존하는 Date 확인
		    const parts = dateInput.split("-");
		    const year = parseInt(parts[0], 10);
		    const month = parseInt(parts[1], 10);
		    const day = parseInt(parts[2], 10);
	
		    if (year < 1 || year > 9999) {
		       alert(year + "는 올바르지 않은 연도입니다.");
		        return false;
		    }
	
		    if (month < 1 || month > 12) {
		       alert(month + "는 올바르지 않은 월입니다.");
		        return false;
		    }
	
		    const daysInMonth = new Date(year, month, 0).getDate();
		    if (day < 1 || day > daysInMonth) {
		       alert(day + "는 올바르지 않은 일입니다.");
		        return false;
		    }
		    
		    
		    const date = new Date(dateInput);
	
		    if (date.getFullYear() !== year || date.getMonth() + 1 !== month || date.getDate() !== day) {
		       alert("올바르지 않은 입력입니다.");
		        return false;
		    }
	
		    //3. 오늘 날짜보다 크다면
		    const currentDate = new Date();
		    if (date > currentDate) {
		    	alert("오늘 날짜보다 큰 날짜입니다.");
		        return false;
		    }
	    	
	    }
	    
	    return true;
	}
	
</script>