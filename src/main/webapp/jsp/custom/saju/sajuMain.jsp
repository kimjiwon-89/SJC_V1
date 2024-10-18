<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="div-flex">
    <div class="logo">
        <h1>매일 운세 달력</h1>
    </div>
    <div class="content">
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
		                    <input class="ipt wd-100p" type="text" id="birthday" name="birthday" placeholder="YYYY-MM-DD">
						</div>
						 <div class="p-1 f3">
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
                	<div class="d-flex">
                		<div class="p-1 f1">
							<select class="ipt select2 wd-70p mgr-5" id="birthTime" name="birthTime">
							<!-- 
								<option value="">모름</option>
								<option value="23:30:00">자시 (23:30 - 01:29)</option>
								<option value="01:30:00">축시 (01:30 - 03:29)</option>
								<option value="03:30:00">인시 (03:30 - 05:29)</option>
								<option value="05:30:00">묘시 (05:30 - 07:29)</option>
								<option value="07:30:00">진시 (07:30 - 09:29)</option>
								<option value="09:30:00">사시 (09:30 - 11:29)</option>
								<option value="11:30:00">오시 (11:30 - 13:29)</option>
								<option value="13:30:00">미시 (13:30 - 15:29)</option>
								<option value="15:30:00">신시 (15:30 - 17:29)</option>
								<option value="17:30:00">유시 (17:30 - 19:29)</option>
								<option value="19:30:00">술시 (19:30 - 21:29)</option>
								<option value="21:30:00">해시 (21:30 - 23:29)</option>
							 -->
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
		                    	<input class="ipt-radio" type="radio" name="gender" value="M" checked> 남
		                   	</label>
		                    <label class="ipt-radio-label">
		                    	<input class="ipt-radio" type="radio" name="gender" value="W"> 여
		                   	</label>
                		</div>
                	</div>
                </td>
            </tr>
        </table>
        
        <div class="mgt-10">
           <button style= "font-family: TheJamsil4Medium" class="result-btn" onclick="search()">조회하기</button>
           <button style= "font-family: TheJamsil4Medium" class="result-btn" onclick="search2()">궁합보기</button>
        </div>
    </div>
    <div class="content">
<!--       광고 자리^^ -->
   </div>
</div>


<!-- JS파일 분리 -->
<%@include file="sajuMainJs.jsp"%>

