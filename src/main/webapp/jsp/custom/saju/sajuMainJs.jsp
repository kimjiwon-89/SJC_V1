<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">

/* 페이지/이미지/css 등 모든 리소스 로드 후에 실행, 주로 이미지&외부 리소스 로드 기다릴 때 사용 */
$(window).on("load", function() { /* 로직 추가 */ });

/* HTML 요소가 등록 된 후에 실행, 주 사용 이벤트 */
$(document).ready(function(){
   //1. select2 실행
    $('.select2').select2({
        minimumResultsForSearch: Infinity,	 			// 검색 필터 제거
        dropdownCssClass: 'custom-select2-dropdown', 	// 커스텀 CSS 클래스 지정
//         dropdownAutoWidth: true, 						// 드롭다운 너비 자동 설정
        width: 'resolve', // 자동으로 부모의 너비를 따르게 설정
	});
   
	//input 이벤트 추가
	$('#birthday').on('input', function() {
		let input = $(this).val();
		let formattedDate = formatDateString(input);
		$(this).val(formattedDate);
	});

});

/* 조회하기 */
function search() {
   if(!checkDate() ) return;
   
   fnCallDateInfoAPI(function(data) {
       if(data) {
    	   $("#content").load("/saju/main2", data);
       } else {
           alert('정보를 불러오지 못했습니다.');
       }
   });
}

/* 뭘 만드시죠 ? */
function search2() {
   $("#content").load("/saju/sajuEtc");
}

//날짜 확인
function checkDate() {
    const dateInput = document.getElementById('birthday').value;
    const datePattern = /^\d{4}-\d{2}-\d{2}$/;

    //1. yyyy-mm-dd 형식 확인
    if (!datePattern.test(dateInput)) {
        alert('날짜 형식이 유효하지 않습니다. \n yyyy-mm-dd 형식으로 입력해 주세요.');
        return false;
    }
    
    if (!datePattern.test(dateInput)) {
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
        return false;
    }

    return true;
}

//yyyy-mm-dd 형태로 수정
function formatDateString(input) {
    // 숫자만 남기고 나머지는 제거
    input = input.replace(/[^0-9]/g, '');

    // yyyy-mm-dd 형식에 맞게 포맷팅
    let formatted = '';
    if (input.length >= 4) {
        formatted = input.slice(0, 4);
        if (input.length >= 6) {
            formatted += '-' + input.slice(4, 6);
            if (input.length > 6) {
                formatted += '-' + input.slice(6, 8);
            }
        } else if (input.length > 4) {
            formatted += '-' + input.slice(4);
        }
    } else {
        formatted = input;
    }

    return formatted;
}

//API 호출
function fnCallDateInfoAPI(callback) {
	const dateInput = document.getElementById('birthday').value;
	const smonth = document.getElementById('smonth').value;
	const parts = dateInput.split("-");
	const year = parts[0];
	const month = parts[1];
	const day = parts[2];
	
	
	var url = 'http://apis.data.go.kr/B090041/openapi/service/LrsrCldInfoService/getLunCalInfo';				//양력일 조회
	if(smonth == 'lun') url = 'http://apis.data.go.kr/B090041/openapi/service/LrsrCldInfoService/getSolCalInfo';//음력일 조회
   
	var xhr = new XMLHttpRequest();
	var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'Njev63C4hP6FAMTWCtsUYfhOsPQt42h2%2BfzDRfsobDdGO3T%2BGGeIXcjypeDrX3RdMF3YK8KnRuF22H8p44VLIw%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent(smonth+'Year') + '=' + encodeURIComponent(year); /**/
	queryParams += '&' + encodeURIComponent(smonth+'Month') + '=' + encodeURIComponent(month); /**/
	queryParams += '&' + encodeURIComponent(smonth+'Day') + '=' + encodeURIComponent(day); /**/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
		if(this.readyState == 4) {
			if(this.status == 200) {
				var xmlString = this.responseText;
				var parser = new DOMParser();
				var xmlDoc = parser.parseFromString(xmlString, "text/xml");
				
				// XML 문서에서 필요한 데이터 추출
				var lunIljin = xmlDoc.getElementsByTagName("lunIljin")[0].childNodes[0].nodeValue;	//간지
				var lunYear = xmlDoc.getElementsByTagName("lunYear")[0].childNodes[0].nodeValue;	//음력 년도
				var lunMonth = xmlDoc.getElementsByTagName("lunMonth")[0].childNodes[0].nodeValue;	//음력 월
				var lunDay = xmlDoc.getElementsByTagName("lunDay")[0].childNodes[0].nodeValue;		//음력 일
				var solYear = xmlDoc.getElementsByTagName("solYear")[0].childNodes[0].nodeValue;	//양력 년도
				var solMonth = xmlDoc.getElementsByTagName("solMonth")[0].childNodes[0].nodeValue;	//양력 월
				var solDay = xmlDoc.getElementsByTagName("solDay")[0].childNodes[0].nodeValue;		//양력 일
				 
				 var param={};
				 param.lunIljin    	= lunIljin;
				 param.lunYear    	= lunYear;
				 param.lunMonth   	= lunMonth;
				 param.lunDay   	= lunDay;
				 param.solYear    	= solYear;
				 param.solMonth   	= solMonth;
				 param.solDay   	= solDay;
				 param.birthday  	= $("#birthday").val();
				 param.birthTime	= $("#birthTime").val();
				 param.gender   	=  $('input[name="gender"]:checked').val();
		              
				callback(param);
			} else {
				console.error('서버 응답 오류:', this.statusText);
				callback(null); // 실패 시 콜백 함수에 null 전달
			}
		}
	};
	xhr.send('');
   
}
</script>
