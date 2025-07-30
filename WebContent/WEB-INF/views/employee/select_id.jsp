<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />

<util:layout menuList="${sideMenus}">
	<h1 class="insertemployee">
		<fmt:message key="empSelId.Title" />
	</h1>
	<div class="content-title" id="employeeTitle">
		<fmt:message key="empSelId.SubTitle" />
	</div>
	<div class="content-list">
		<table>
			<tbody>
				<tr id="row">
					<td><input type="radio" name="editField" value="name"
						id="editName" /> <label for="editName"> <fmt:message
								key="empSelId.TableName" />
					</label></td>
					<td id="fieldName">${emp.employeeName}</td>
				</tr>
				<tr id="row">
					<td><input type="radio" name="editField" value="phone"
						id="editPhone" /> <label for="editPhone"> <fmt:message
								key="empSelId.TablePhone" />
					</label></td>
					<td id="fieldPhone">${emp.phoneNumber}</td>
				</tr>
				<tr id="row">
					<td><input type="radio" name="editField" value="title"
						id="editPosition" /> <label for="editPosition"> <fmt:message
								key="empSelId.TableTitle" />
					</label></td>
					<td id="fieldPosition">${emp.title}</td>
				</tr>
				<tr id="row">
					<td><input type="radio" name="editField" value="salary"
						id="editSalary" /> <label for="editSalary"> <fmt:message
								key="empSelId.TableSalary" />
					</label></td>
					<td id="fieldSalary">${emp.salary}</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div id="editInputArea" style="margin-top: 20px;"></div>

	<form id="updateForm" method="post"
		action="${pageContext.request.contextPath}/employee/update.do">
			<input type="hidden" name="id" id="inputId" value="${emp.employeeId}" />
			<input type="hidden" name="target" id="inputTarget" />
			<input type="hidden" name="value" id="inputValue" />

		<div class="button-group" style="margin-top: 20px;">
			<button id="btnCancel" class="btn-earn-pass">
				<fmt:message key="empSelId.ButtonBack" />
			</button>
			<button id="btnSave" class="btn-earn-points" type="button">
				<fmt:message key="empSelId.ButtonSave" />
			</button>
		</div>
	</form>
</util:layout>
<script>
	const employeeData = {
		name: "${emp.employeeName}",
		phone: "${emp.phoneNumber}",
		title: "${emp.title}",
		salary: "${emp.salary}"
	};

	const editInputArea = document.getElementById('editInputArea');

	function clearEditInput() {
		editInputArea.innerHTML = '';
	}

	function createInput(field, value) {
		clearEditInput();
		const input = document.createElement('input');
		input.type = 'text';
		input.id = 'inputEditField';
		input.value = value;
		input.style.width = '300px';
		input.style.padding = '8px';
		input.style.fontSize = '16px';
		input.setAttribute('data-field', field);
		editInputArea.appendChild(input);
		input.focus();
	}

	// 라디오 선택 시 입력창 생성
	document.querySelectorAll('input[name="editField"]').forEach(radio => {
		radio.addEventListener('change', e => {
		    const field = e.target.value;
		    createInput(field, employeeData[field]);
		    document.getElementById("inputTarget").value = field;
		});
	});

	// 저장 버튼 눌렀을 때
	document.getElementById("btnSave").addEventListener("click", function () {
		const input = document.getElementById("inputEditField");
		if (!input) {
			alert("수정할 항목을 선택하세요.");
			return;
		}

		const newValue = input.value.trim();
		if (newValue === "") {
			alert("빈 값은 저장할 수 없습니다.");
		    return;
		}

		// hidden에 값 넣기
		document.getElementById("inputValue").value = newValue;

		// submit
		document.getElementById("updateForm").submit();
	});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
