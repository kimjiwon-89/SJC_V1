<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- JS파일 분리 -->
<%@include file="sajuEtcJs.jsp"%>

<style>
        .select-container {
            display: flex;
        }
        .select-wrapper {
            flex: 7; /* 첫 번째 Select2의 너비 비율 설정 */
            margin-right: 2px;
        }
        .select-wrapper:last-child {
            flex: 3; /* 두 번째 Select2의 너비 비율 설정 */
            margin-right: 0;
        }
</style>

<div class="div-flex">
    <div class="logo">
        <h1>매일 운세 달력</h1>
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
                <th>성별</th>
                <td>
                    <label class="ipt-radio-label">
                    	<input class="ipt-radio" type="radio" name="gender" value="M"> 남
                   	</label>
                    <label class="ipt-radio-label">
                    	<input class="ipt-radio" type="radio" name="gender" value="W"> 여
                   	</label>
                </td>
            </tr>
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
                <th>성별</th>
                <td>
                    <label class="ipt-radio-label">
                    	<input class="ipt-radio" type="radio" name="gender" value="M"> 남
                   	</label>
                    <label class="ipt-radio-label">
                    	<input class="ipt-radio" type="radio" name="gender" value="W"> 여
                   	</label>
                </td>
            </tr>
        </table>
        
        <div class="mgt-10">
           <button style= "font-family: TheJamsil4Medium" class="result-btn" onclick="search2()">궁합보기</button>
        </div>
    </div>
    <div class="content">
      광고 자리^^
   </div>

	<div class="content">
		<table class="info-table">
			<colgroup>
				<col style="width: 40%">
				<col style="width: *">
			</colgroup>        
	           <tr>
	               <th>우리의 궁합은?</th>
	               <th>good</th>
			</tr>
		</table>
	</div>
</div>
	