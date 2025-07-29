<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<util:layout menuList="${sideMenus}">
	<form class="form" method="post"
		action="${pageContext.request.contextPath}/employee/insert.do">
		<h1 class="insertemployee">직원추가</h1>
		<div class="content-title1">추가할 직원의 정보를 입력해주세요</div>

		<div class="content-title">직원 이름</div>
		<input type="text" class="input" placeholder="이름을 입력하세요." name="name" />
		<div class="content-title">전화번호</div>
		<input type="text" class="input" placeholder="전화번호를 입력하세요"
			maxlength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
			name="phone" />

		<div class="content-title">직급선택</div>
		<select class="input" name="title">
			<option disabled selected>직급을 선택해주세요</option>
			<option value="점장">점장</option>
			<option value="매니저">매니저</option>
			<option value="알바">알바</option>
		</select>


		<div class="content-title">급여</div>
		<input type="text" class="input" placeholder="월 급여를 입력하세요."
			name="salary" />


		<div class="button-group">
			<button type=reset class="btn-earn-pass">입력취소</button>
			<button type="submit" class="btn-earn-points">저장하기</button>
		</div>
	</form>
</util:layout>
<script>
	document
		.querySelectorAll('.sidebar_item')
		.forEach(btn => btn.addEventListener('click', e => {
			document.querySelectorAll('.sidebar_item').forEach(b => b.classList.remove('is-active'));
			e.target.classList.add('is-active');
		}));

	function toggleDropdown() {
		const menu = document.getElementById("dropdownMenu");
		menu.style.display = menu.style.display === "block" ? "none" : "block";
	}

	function selectOption(element) {
		const btn = document.querySelector(".custom-dropdown-btn");
		btn.textContent = element.textContent;
		document.getElementById("dropdownMenu").style.display = "none";
	}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
