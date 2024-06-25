<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script>
$(document).ready(function(){
	   
	//1. 이미지 셋팅
	lunImgSet();
	
	//2. 캘린더 셋팅 및 공휴일 셋팅
	fnSetCalendar();
});

//지간 순대로 인덱스 추출하여 이미지 셋팅, 이후에 CSS로 수정할 것
function lunImgSet() {
	//천간
	var luni = "${ bean.lunIljin }";
	
	//이미지 셋팅
	var num1 = skyArr.indexOf(luni.substring(0,1)) + 1;
	var num2 = groundArr.indexOf(luni.substring(1,2))  +1;
	$("#saju_1").addClass("sky_" + num1 );
	$("#saju_2").addClass("ground_" + num2 );
}

let currentDate = dayjs();	//달력에서 보이는 날짜
const toDayDate = dayjs();	//정확한 오늘 날짜
const currentDateElement = document.getElementById('currentDate');	//오늘날짜 영역
const calendarElement = document.getElementById('calendar');		//캘린더 영역
const prevMonthButton = document.getElementById('prevMonth');		//이전달 버튼
const nextMonthButton = document.getElementById('nextMonth');		//다음달 버튼

/* 캘린더 셋팅 */
function fnSetCalendar() {
	/* 이전달 이동 이벤트 추가*/
	prevMonthButton.addEventListener('click', () => {
	    currentDate = currentDate.subtract(1, 'month');
	    updateCalendar();
	});
	
	/* 다음달 이동 이벤트 추가 */
	nextMonthButton.addEventListener('click', () => {
	    currentDate = currentDate.add(1, 'month');
	    updateCalendar();
	});
	
	//달력 셋팅
	updateCalendar();
}

const weekdays = ['일', '월', '화', '수', '목', '금', '토'];
/* 캘린더 업데이트 */
function updateCalendar() {
	//현재 월 셋팅
	currentDateElement.textContent = currentDate.format('YYYY-MM');
	//비우기
	calendarElement.innerHTML = '';
	
    // 요일 헤더 생성
	weekdays.forEach(weekday => {
		const weekdayElement = document.createElement('div');
		weekdayElement.classList.add('weekday');
		weekdayElement.textContent = weekday;
		calendarElement.appendChild(weekdayElement);
	});
	
	//달력 한달치의 시작부터 끝나는 날까지 셋팅
	const startOfMonth = currentDate.startOf('month');
	const endOfMonth = currentDate.endOf('month');
	
	var dateArr = new Set();	//사주 조회를 위한 YYYY-MM
	var yearArr = new Set();	//사주 조회를 위한 YYYY
	let date = startOfMonth.startOf('week');
	while (date.isBefore(endOfMonth.endOf('week'))) {
		const dayElement = document.createElement('div');
		dayElement.classList.add('day', date.format('YYYY-MM-DD'));
		
		//->
		// 요소 생성 (일 / 메모)
		const innerDiv = document.createElement('div');
		innerDiv.classList.add('detail-day');
		
		//일요일 0
		if( date.get("day") == 0 ) {
			innerDiv.classList.add('holiday');
		//토요일 6
		}else if( date.get("day") == 6 ) {
			innerDiv.classList.add('satday');
		}
		
		//->
		// 첫 번째 요소 생성 (왼쪽에 배치, 일)
		const leftElement = document.createElement('div');
		leftElement.textContent = date.format('D');		//날짜 추가
		leftElement.classList.add('locdate'); 			// 왼쪽 요소에 클래스 추가
		// 두 번째 요소 생성 (오른쪽에 배치, 공휴일 이름)
		const rightElement = document.createElement('div');
		rightElement.textContent = '';
		rightElement.classList.add('dateName'); 		// 오른쪽 요소에 클래스 추가
		innerDiv.appendChild(leftElement);
		innerDiv.appendChild(rightElement);

		dayElement.appendChild(innerDiv);
		
		//CSS 위한 클래스 추가
		if(date.format('M') != currentDate.format("M")) dayElement.classList.add('inactive');
		if(date.format('MM-DD') == toDayDate.format("MM-DD")) dayElement.classList.add('today');
	
		calendarElement.appendChild(dayElement);
		
		yearArr.add(date.format('YYYY'));
		dateArr.add(date.format('YYYY-MM'));
		date = date.add(1, 'day');
	}
	
	// 달력 셋팅 후 통신 시작
	uiProgress("#resultCalendar", true);
   //배열로 변환
	dateArr = [...dateArr];
	yearArr = [...yearArr];
	//한달치 간지 셋팅 함수
	fnSetLuniljin(dateArr, yearArr );
}

//간지 API 호출
//총 42일치를 보여주기에 Start와 End는 다를 것, 무조건 두 번 보낸다.
async function fnSetLuniljin(dateArr, yearArr) {
	lunIljinMap = [];

	try {
		for(var i in dateArr) {
			var str = dateArr[i].split("-");
			//캘린더 셋팅 후 공휴일 추가
			await fnSetDateSaju(str[0], str[1]);
		}
		
		//1년치 데이터 다 뽑아와서 사용
		for(var i in yearArr) {
			var holData = await fnSetHolidayInfo(yearArr[i]);
			fnSetHolidaySet(holData);
		}
		
	} catch (error) {
           console.log(error);
    }
	
	//사주는 내 정보만 불러와서 날짜에 각 조합에 맞게 셋팅해준다.
	var luni = "${ bean.lunIljin }";
	var sky = luni.substring(0,1);
	var ground = luni.substring(1,2);
	
	var param = {
		mySky : sky,
		myGround : ground,
	}
	
	//AJAX 통신
	$.ajax({
		url: '/saju/getSajuCalcResult',
		type: "POST",
	    data : param,
	    success: function ( data ) {
    		var skyScoreList = data.skyScoreList;
    		var groundScoreList = data.groundScoreList;
   			
   			//캘린더 리스트 만큼 돈다
   			for(var i in lunIljinMap) {
   				
   				//캘린더 날짜
   				var calDate = lunIljinMap[i].date;
   				
   				//캘린더 사주 정보
   				var calLunIljin = lunIljinMap[i].lunIljin;
   				var calSky		= calLunIljin.substring(0,1);
   				var calGround	= calLunIljin.substring(1,2);
   				
   				//각 궁합		
   				var skyScore 	= skyScoreList.filter( v=> calSky == v.daystem2 )[0].matchscore;
   				var groundScore = groundScoreList.filter( v=> calGround == v.daystem2 )[0].matchscore;
   				
   				var obj = {
  					myLunIljin 	: luni,
					calDate 	: calDate,
					calLunIljin : calLunIljin,
					skyScore 	: skyScore,
					groundScore : groundScore,
   				}
   				
   				setSajuInfoToCalendar(obj);
   				
   			}
    		
	    },
	    error: function (data, status, err) {
	    },
	    complete: function () {
	    	uiProgress("#resultCalendar", false);
	    }
	});
}

      
// 캘린더에 추가
function setSajuInfoToCalendar(obj) {
	//각 날짜에 셋팅
	var html = "<span class='day-result'>" + obj.skyScore + "<br>" + obj.groundScore +"</span>"
	$("."+obj.calDate).append(html);
}      


// 간지 추출
var lunIljinMap = [];
function fnSetDateSaju( year, month, day ) {
	return new Promise((resolve, reject) => {
		var xhr = new XMLHttpRequest();
		var url = 'http://apis.data.go.kr/B090041/openapi/service/LrsrCldInfoService/getLunCalInfo'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'Njev63C4hP6FAMTWCtsUYfhOsPQt42h2%2BfzDRfsobDdGO3T%2BGGeIXcjypeDrX3RdMF3YK8KnRuF22H8p44VLIw%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('solYear') + '=' + encodeURIComponent(year);
		queryParams += '&' + encodeURIComponent('solMonth') + '=' + encodeURIComponent(month); 
 		if(day) queryParams += '&' + encodeURIComponent('solDay') + '=' + encodeURIComponent(day);  
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent("35"); /*	최대 필요 개수 */
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function () {
			if (this.readyState == 4) {
				if(this.status == 200) {
					var xmlString = this.responseText;
					var parser = new DOMParser();
					var xmlDoc = parser.parseFromString(xmlString, "text/xml");
					

					var arr = xmlDoc.getElementsByTagName("item");
					$.each(arr, function(i , data){
						
						/* 
							0 : lunDay			- 음력일
							1 : lunIljin		- 간지		[일의 간지]
							2 : lunLeapmonth	- 윤달구분	
							3 : lunMonth		- 월
							4 : lunNday			- 월일수(음력)
							5 : lunSecha		- 간지(세차)	[년도의 간지]
							6 : lunWolgeon		- 간지(월)	[월의 간지]
							7 : lunYear			- 연(음력)
							8 : solDay			- 월(음력)
							9 : solJd			- 일(음력)
							10 : solLeapyear	- 윤년 구분
							11 : solMonth		- 월
							12 : solWeek		- 요일(월, 화...)
							13 : solYear		--연
 						*/
						var lunSecha;	//연 간지
						var lunWolgeon;	//월 간지
						var lunIljin;	//일 간지
						var lunYear;	//연 음력
						var lunMonth;	//연 월
						var lunDay;		//연 일
						var date = "yyyy-mm-dd";
						var dataList = data.childNodes;
						$.each(dataList, function(idx, cData){
							if(cData.nodeName == "lunIljin") lunIljin = cData.textContent;
							if(cData.nodeName == "lunSecha") lunSecha = cData.textContent;
							if(cData.nodeName == "lunWolgeon") lunWolgeon = cData.textContent;
							if(cData.nodeName == "lunYear") lunYear = cData.textContent;
							if(cData.nodeName == "lunMonth") lunMonth = cData.textContent;
							if(cData.nodeName == "lunDay") lunDay = cData.textContent;
							
							//date 셋팅
							if(cData.nodeName == "solYear") 	date = date.replace("yyyy", cData.textContent);
							if(cData.nodeName == "solMonth")	date = date.replace("mm", cData.textContent);
							if(cData.nodeName == "solDay") 		date = date.replace("dd", cData.textContent);
							
						});
						
						var obj = {
							lunSecha 	: lunSecha,
							lunWolgeon 	: lunWolgeon,
							lunIljin 	: lunIljin,
							lunYear 	: lunYear,
							lunMonth	: lunMonth,
							lunDay 		: lunDay,
							date		: date,
						}
						lunIljinMap.push(obj);
							
					});
					
					resolve(lunIljinMap);
				} else {
					reject('서버 응답 오류:', this.statusText);
				}
			}
		};
		
		xhr.send('');	
	});
}

//공휴일 추가 및 달력 색깔 셋팅(빨,파)
function fnSetHolidayInfo(year, month ) {
	var holidayArr = [];
	
	return new Promise((resolve, reject) => {
		var xhr = new XMLHttpRequest();
		var url = 'http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '=' +'Njev63C4hP6FAMTWCtsUYfhOsPQt42h2%2BfzDRfsobDdGO3T%2BGGeIXcjypeDrX3RdMF3YK8KnRuF22H8p44VLIw%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('solYear') + '=' + encodeURIComponent(year); 
// 		queryParams += '&' + encodeURIComponent('solMonth') + '=' + encodeURIComponent(month); 
		queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent("json"); 
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('50'); /**/
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function () {
			if (this.readyState == 4) {
				if(this.status == 200) {
		            var jsonStr = this.responseText;
		            var resultArr = JSON.parse(jsonStr);
					
					var totalCount = resultArr.response.body.totalCount;						//총 개수
					if(totalCount == 0 ) return;
					
					
			        $.each(resultArr.response.body.items.item, function(idx, data){
			        	if(typeof(data) == "object")  {
			        		data.locdate = data.locdate.toString().replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');//날짜
							holidayArr.push(data);
							
// 							var locdate = data.locdate.toString().replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');//날짜
// 							var dateKind = data.dateKind;											//종류 (특일 뷴류)
// 							var isHoliday = data.isHoliday== "Y" ? true : false;					//공공기관 휴일 여부	(Y/N)
// 							var dateName = data.dateName;											//명칭
							
							resolve(holidayArr);
			        	}
			        });
				} else {
					reject('서버 응답 오류:', this.statusText);
				}
			}
		};
	
		xhr.send('');
	});
}

function fnSetHolidaySet(dataArr) {
	$.each(dataArr, function(idx, data){
		$("."+ data.locdate + " .detail-day").addClass("holiday");
		$("."+ data.locdate + " .dateName").text(data.dateName);
		if(data.locdate.split("-")[1] ==  currentDate.format("MM") ) {
		} else {
			$("."+data.locdate).addClass("inactive")
		}
	});
	
	
}
	
</script>