<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- JS파일 분리 -->
<%@include file="sajuMainJs.jsp"%>

<style>
        .select-container {
            display: flex;
        }
        .select-wrapper {
            flex: 7; /* 첫 번째 Select2의 너비 비율 설정 */
            margin-right: 10px;
        }
        .select-wrapper:last-child {
            flex: 3; /* 두 번째 Select2의 너비 비율 설정 */
            margin-right: 0;
        }
</style>

<div class="div-flex">
    <div class="logo">
        <h1>매일 운세 달력test</h1>
    </div>
    <div class="content">
        <table class="info-table">
			<colgroup>
				<col style="width: 40%">
				<col style="width: *">
			</colgroup>        
            <tr>
                <th>생년월일</th>
                <td>
	                <div class="select-container">
		                <div class="select-wrapper">
		                    <input class="ipt wd-100p" type="text" id="birthday" placeholder="YYYY-MM-DD">
						</div>
						 <div class="select-wrapper">
		                    <select class="ipt select2 wd-20p" id="smonth" name="smonth">
									<option value="sol">양력</option>
									<option value="lun">음력</option>
							</select>
						</div>
	                </div>
                </td>
            </tr>
            <tr>
                <th height="48px">출생시간</th> 
                <td>
                	<div class="select-container">
                		<div class="select-wrapper">
							<select class="ipt select2 wd-70p mgr-5" id="birthTime" name="birthTime">
								<option value="">모름</option>
								<option value="자시">자시 (23:30 - 01:29)</option>
								<option value="축시">축시 (01:30 - 03:29)</option>
								<option value="인시">인시 (03:30 - 05:29)</option>
								<option value="묘시">묘시 (05:30 - 07:29)</option>
								<option value="진시">진시 (07:30 - 09:29)</option>
								<option value="사시">사시 (09:30 - 11:29)</option>
								<option value="오시">오시 (11:30 - 13:29)</option>
								<option value="미시">미시 (13:30 - 15:29)</option>
								<option value="신시">신시 (15:30 - 17:29)</option>
								<option value="유시">유시 (17:30 - 19:29)</option>
								<option value="술시">술시 (19:30 - 21:29)</option>
								<option value="해시">해시 (21:30 - 23:29)</option>
							</select>
						</div>

                	</div>
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <label class="ipt-radio-label">
                    	<input class="ipt-radio" type="radio" name="gender" value="man"> 남
                   	</label>
                    <label class="ipt-radio-label">
                    	<input class="ipt-radio" type="radio" name="gender" value="woman"> 여
                   	</label>
                </td>
            </tr>
        </table>
        
        <div class="mgt-10">
           <button class="result-btn" onclick="search()">조회하기</button>
        </div>
    </div>
    <div class="content">
      광고 자리^^
   </div>
</div>
