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

	<form id="updateForm" method="post"
		action="${pageContext.request.contextPath}/employee/update.do">
		<div id="editInputArea" style="margin-top: 20px;">
			<input type="hidden" name="id" id="inputId" value="${emp.employeeId}" />
			<input type="hidden" name="target" id="inputTarget" /> <input
				type="hidden" name="value" id="inputValue" />
		</div>

		<div class="button-group" style="margin-top: 20px;">
			<button id="btnCancel" class="btn-earn-pass">
				<fmt:message key="empSelId.ButtonBack" />
			</button>
			<button id="btnSave" class="btn-earn-points" onclick="updateHandler">
				<fmt:message key="empSelId.ButtonSave" />
			</button>
		</div>
	</form>
</util:layout>
<script>
// 직원 초기 데이터 (예시 - 실제는 JSP에서 동적 세팅)
const employeeData = {

  name: "홍길동",
  phone: "01025684598",
  title: "알바",
  salary: "500,000"
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
  });
});

// 입력취소 버튼
document.getElementById('btnCancel').addEventListener('click', () => {
  clearEditInput();
  document.querySelectorAll('input[name="editField"]').forEach(radio => radio.checked = false);
});

// 저장 버튼 (임시 alert)
document.getElementById('btnSave').addEventListener('click', () => {
  const input = document.getElementById('inputEditField');
  if (!input) {
    alert('수정할 항목을 선택하세요.');
    return;
  }
  const field = input.getAttribute('data-field');
  const newValue = input.value.trim();
  if (!newValue) {
    alert('값을 입력하세요.');
    input.focus();
    return;
  }

  // 데이터 업데이트 (실제는 서버 전송 후 반영)
  employeeData[field] = newValue;

  // 화면에 바로 반영
  document.getElementById('field' + field.charAt(0).toUpperCase() + field.slice(1)).textContent = newValue;

  alert(`${field}이(가) 수정되었습니다.`);

  clearEditInput();
  document.querySelectorAll('input[name="editField"]').forEach(radio => radio.checked = false);
});

function updateHandler() {
  const selectTarget = document.querySelector('input[name="editField"]:checked');
  if (!selectTarget) {
    alert('수정할 영역을 선택해주세요.');
    return;
  }

  const edit_input = document.querySelector('input[name="inputEditField"]');
  if (!edit_input) {
    alert('값을 입력해주세요.');
    return;
  }

  document.getElementById('inputTarget').value = selectTarget.value;
  document.getElementById('inputValue').value = edit_input.value;
  document.getElementById('updateForm').submit();
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
