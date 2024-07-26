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
});

function chSearch() {
	var param = {
		dateInput 	: document.getElementById('birthday1').value,
		smonth 		: document.getElementById('smonth1').value,
	}
	var param2 = {
		dateInput 	: document.getElementById('birthday2').value,
		smonth 		: document.getElementById('smonth2').value,
	}
	
	var result1;
	fnCallDateInfoAPI(function(data) {
    	if(data) {
    		result1 = data;
    		
    		//2번쨰 궁합 재전송
    		fnCallDateInfoAPI(function(data2) {
    	    	if(data2) {
    	    		var _param = {result1:data, result2:data2}
    	    		
    	    		$.ajax({
    					url: '${rootPath}/saju/getChemiResult',
    					type: "POST",
    					data: _param,
    					success:function(data){
    						console.log(data);
    					},
    					error:function(data){
    					},
    					complete:function(data){
    					}
    	    		});
    	    		console.log(result1);
    	    		console.log(result2);
    	    		
    	    		
    	       	} else {
    	        	alert('정보를 불러오지 못했습니다.');
    	       	}
    		}, param);
    		
       	} else {
        	alert('정보를 불러오지 못했습니다.');
       	}
	}, param);
}


//API 호출
function fnCallDateInfoAPI(callback, param) {
	const dateInput = param.dateInput;
	const smonth = param.smonth;
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
				 param.lunIljin    	= lunIljin.split("(")[0];
				 param.lunYear    	= lunYear;
				 param.lunMonth   	= lunMonth;
				 param.lunDay   	= lunDay;
				 param.solYear    	= solYear;
				 param.solMonth   	= solMonth;
				 param.solDay   	= solDay;
		              
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
