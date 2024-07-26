<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- JS파일 분리 -->
<%@include file="sajuChemistryJs.jsp"%>

<style>

</style>

<div class="div-flex">
    <div class="logo">
        <h1>매일 운세 달력</h1>
    </div>
    <div class="content">
    	<div class="card">
			<div class="card-header">
				<h5 class="card-title">내 정보</h5>
			</div>
            <div class="card-body">
		        <table class="table info-table">
					<colgroup>
						<col style="width: 25%">
						<col style="width: *">
					</colgroup>        
		            <tr>
		                <th>생년월일</th>
		                <td>
			                <div class="d-flex">
				                <div class="p-1 f7">
				                    <input class="ipt wd-100p" type="text" id="birthday1" placeholder="YYYY-MM-DD" value="${ bean.birthday }">
								</div>
								 <div class="p-1 f3">
				                    <select class="ipt select2 wd-20p" id="smonth1" name="smonth1">
											<option value="sol" ${ bean.smonth eq 'sol' ? 'selected' : ''} >양력</option>
											<option value="lun" ${ bean.smonth eq 'lun' ? 'selected' : ''} >음력</option>
									</select>
								</div>
			                </div>
		                </td>
		            </tr>
		            <tr>
		                <th>성별</th>
		                <td>
		                	<div class="d-flex">
		                		<div class="p-1 f1">
				                    <label class="ipt-radio-label">
				                    	<input class="ipt-radio" type="radio" name="gender1" value="M" ${ bean.gender == null || bean.gender == 'M' ? 'checked' : ''} > 남
				                   	</label>
				                    <label class="ipt-radio-label">
				                    	<input class="ipt-radio" type="radio" name="gender1" value="W" ${ bean.gender == 'W' ? 'checked' : ''}> 여
				                   	</label>
		                		</div>
		                	</div>
		                </td>
		            </tr>
		        </table>
	        </div>
    	</div>

    	<div class="card mgt-10">
			<div class="card-header">
				<h5 class="card-title">상대 정보</h5>
			</div>
            <div class="card-body">
		        <table class="table info-table">
					<colgroup>
						<col style="width: 25%">
						<col style="width: *">
					</colgroup>                    
		            <tr>
		                <th>생년월일</th>
		                <td>
			                <div class="d-flex">
				                <div class="p-1 f7">
				                    <input class="ipt wd-100p" type="text" id="birthday2" placeholder="YYYY-MM-DD">
								</div>
								 <div class="p-1 f3">
				                    <select class="ipt select2 wd-20p" id="smonth2" name="smonth2">
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
		                	<div class="d-flex">
		                		<div class="p-1 f1">
				                    <label class="ipt-radio-label">
				                    	<input class="ipt-radio" type="radio" name="gender2" value="M" checked> 남
				                   	</label>
				                    <label class="ipt-radio-label">
				                    	<input class="ipt-radio" type="radio" name="gender2" value="W"> 여
				                   	</label>
		                		</div>
		                	</div>
		                </td>
		            </tr>
		        </table>
        	</div>
        </div>
        <div class="mgt-10">
           <button style= "font-family: TheJamsil4Medium" class="result-btn" onclick="chSearch()">궁합보기</button>
        </div>
    </div>
    <div class="content">
<!--       광고 자리^^ -->
   </div>

	<div class="content">
		<table class="info-table">
			<colgroup>
				<col style="width: 40%">
				<col style="width: *">
			</colgroup>        
	           <tr>
	               <th>우리의 궁합은?</th>
	               <th id="ch_result"></th>
			</tr>
		</table>
	</div>
</div>
	