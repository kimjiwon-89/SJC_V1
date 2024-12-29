<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="change-user-wrap new-search-saju">
	<div class="modal-title-wrap">
		<h2>정보 수정하기</h2>
		<button class="text-btn close-btn">
			<i class="fa fa-times" aria-hidden="true"></i>
		</button>
	</div>
	<div class="center-content">
		<div class="content-wrap">
			<div class="name-cont">
				<h5 class="cont-title">이름</h5>
				<div class="cont-area">
					<input type="text" class="info-name" id="serch_name" >
				</div>
			</div>

			<div class="gender-cont">
				<h5 class="cont-title">성별</h5>
				<div class="cont-area radio-wrap flex-space-btween-row">
					<input class="text-radio" type="radio" name="gender" id="gender_m" value="M" checked>
					<label class="text-radio-label" for="gender_m">남자</label>
					<input class="text-radio" type="radio" name="gender" id="gender_w" value="W">
					<label class="text-radio-label" for="gender_w">여자</label>
				</div>
			</div>

			<div class="bitrhday-cont">
				<h5 class="cont-title">생년월일</h5>
				<div class="cont-area">
					<input class="" type="text" id="birthday" name="birthday" placeholder="2000-01-01">
					<div class="radio-wrap flex-space-btween-row">
						<input class="text-radio" type="radio" name="smonth" id="smonth_sol" value="sol" checked>
						<label class="text-radio-label" for="smonth_sol">양력</label>
						<input class="text-radio" type="radio" name="smonth" id="smonth_lun" value="lun">
						<label class="text-radio-label" for="smonth_lun">음력</label>
					</div>

				</div>
			</div>
			<div class="birthtime-cont">
				<h5 class="cont-title">태어난 시간</h5>
				<div class="cont-area">

					<!-- selectbox -> input으로 변경 -->
					<input type="text" id="birthTime" placeholder="00:00"/>
					<div class="flex-start">
						<input type="checkbox" id="knowBirthTimeYn" />
						<label class="" for="knowBirthTimeYn">시간 모름</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button class="black-btn" onclick="closeModal(this)">수정완료</button>
</div>