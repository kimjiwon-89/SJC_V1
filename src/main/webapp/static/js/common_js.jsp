<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script>
	//기본으로 쓰일 변수 선언
	const skyobkj = {
		"갑" : "saju-green",
		"을" : "saju-green",
		"병" : "saju-red",
		"정" : "saju-red",
		"무" : "saju-yellow",
		"기" : "saju-yellow",
		"경" : "saju-white",
		"신" : "saju-white",
		"임" : "saju-black",
		"계" : "saju-black",
		"甲" : "saju-green",
		"乙" : "saju-green",
		"丙" : "saju-red",
		"丁" : "saju-red",
		"戊" : "saju-yellow",
		"己" : "saju-yellow",
		"庚" : "saju-white",
		"辛" : "saju-white",
		"壬" : "saju-black",
		"癸" : "saju-black",
	}
	
	const groundObj = {
		"자" : "saju-black",
		"축" : "saju-yellow",
		"인" : "saju-green",
		"묘" : "saju-green",
		"진" : "saju-yellow",
		"사" : "saju-red",
		"오" : "saju-red",
		"미" : "saju-yellow",
		"신" : "saju-white",
		"유" : "saju-white",
		"술" : "saju-yellow",
		"해" : "saju-black",
		"子" : "saju-black",
		"丑" : "saju-yellow",
		"寅" : "saju-green",
		"卯" : "saju-green",
		"辰" : "saju-yellow",
		"巳" : "saju-red",
		"午" : "saju-red",
		"未" : "saju-yellow",
		"申" : "saju-white",
		"酉" : "saju-white",
		"戌" : "saju-yellow",
		"亥" : "saju-black",
	}
	
	//출생시간 공통으로 사용
	const birthTimeObj = new Map([
		["23:30:00", "자시 (23:30 - 01:29)"],
		["01:30:00", "축시 (01:30 - 03:29)"],
		["03:30:00", "인시 (03:30 - 05:29)"],
		["05:30:00", "묘시 (05:30 - 07:29)"],
		["07:30:00", "진시 (07:30 - 09:29)"],
		["09:30:00", "사시 (09:30 - 11:29)"],
		["11:30:00", "오시 (11:30 - 13:29)"],
		["13:30:00", "미시 (13:30 - 15:29)"],
		["15:30:00", "신시 (15:30 - 17:29)"],
		["17:30:00", "유시 (17:30 - 19:29)"],
		["19:30:00", "술시 (19:30 - 21:29)"],
		["21:30:00", "해시 (21:30 - 23:29)"],
	]);

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
	
	
	//server 통신 위한 form 소스
	function formCallServer(data, url) {
		//form 형태로 데이터 생성
		const form = document.createElement('form');
		form.method = 'POST';
		form.action = url;

		// Map 데이터를 FormData로 변환하여 Form에 추가
		$.each(data, function(key, value){
		    const input = document.createElement('input');
		    input.type = 'hidden';
		    input.name = key;
		    input.value = value;
		    form.appendChild(input);
		})

		// Form을 동적으로 document에 추가하고 제출
		document.body.appendChild(form);
		form.submit();
	}
	
	
	
	
	
</script>