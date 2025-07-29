<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />

<util:layout menuList="${sideMenus}">
	<form class="form" method="post"
		action="${pageContext.request.contextPath}/employee/insert.do">
		<h1 class="insertemployee">
			<fmt:message key="empIns.Title" />
		</h1>
		<div class="content-title1">
			<fmt:message key="empIns.SubTitle" />
		</div>

		<div class="content-title">
			<fmt:message key="empIns.TableName" />
		</div>
		<input type="text" class="input"
			placeholder="<fmt:message key='empIns.TableNamePH' />" name="name" />
		<div class="content-title">
			<fmt:message key="empIns.TablePhone" />
		</div>
		<input type="text" class="input"
			placeholder="<fmt:message key='empIns.TablePhonePH' />"
			maxlength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
			name="phone" />

		<div class="content-title">
			<fmt:message key="empIns.TableTitle" />
		</div>
		<select class="input" name="title">
			<option disabled selected>
				<fmt:message key="empIns.TableTitleSelectSentence" />
			</option>
			<option value="점장">
				<fmt:message key="empIns.TableTitleValueMaster" />
			</option>
			<option value="매니저">
				<fmt:message key="empIns.TableTitleValueManager" />
			</option>
			<option value="알바">
				<fmt:message key="empIns.TableTitleValueParttime" />
			</option>
		</select>


		<div class="content-title">
			<fmt:message key="empIns.TableSalary" />
		</div>
		<input type="text" class="input"
			placeholder="<fmt:message key='empIns.TableSalaryPH' />"
			name="salary" />


		<div class="button-group">
			<button type=reset class="btn-earn-pass">
				<fmt:message key="empIns.ButtonCancel" />
			</button>
			<button type="submit" class="btn-earn-points">
				<fmt:message key="empIns.ButtonSave" />
			</button>
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
