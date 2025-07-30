<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />

<util:layout menuList="${sideMenus}">
	<c:if test="${action eq 'select'}">
		<h1 class="insertemployee">
			<fmt:message key="empSel.TitleSelect" />
		</h1>
		<div class="content-title">
			<fmt:message key="empSel.SubTitleSelect" />
		</div>
	</c:if>
	<c:if test="${action eq 'update'}">
		<h1 class="insertemployee">
			<fmt:message key="empSel.TitleUpdate" />
		</h1>
		<div class="content-title">
			<fmt:message key="empSel.SubTitleUpdate" />
		</div>
	</c:if>
	<c:if test="${action eq 'delete'}">
		<h1 class="insertemployee">
			<fmt:message key="empSel.TitleDelete" />
		</h1>
		<div class="content-title">
			<fmt:message key="empSel.SubTitleDelete" />
		</div>
	</c:if>
	<table class="table">
		<thead>
			<tr>
				<c:if test="${action ne 'select'}">
					<th scope="col"></th>
				</c:if>
				<th scope="col"><fmt:message key="empSel.TableId" /></th>
				<th scope="col"><fmt:message key="empSel.TableName" /></th>
				<th scope="col"><fmt:message key="empSel.TablePhone" /></th>
				<th scope="col"><fmt:message key="empSel.TableTitle" /></th>
				<th scope="col"><fmt:message key="empSel.TableSalary" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="emp" items="${empList}">
				<tr>
					<c:if test="${action ne 'select'}">
						<th scope="row"><input type="radio" name="employeeId"
							value="${emp.employeeId}" /></th>
					</c:if>
					<td>${emp.employeeId}</td>
					<td>${emp.employeeName}</td>
					<td>${emp.phoneNumber}</td>
					<td>${emp.title}</td>
					<td>${emp.salary}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<c:if test="${action eq 'update'}">
		<div class="button-group">
			<button type="button" class="btn-update" onclick="updateHandler()">
				<fmt:message key="empSel.ButtonUpdate" />
			</button>
		</div>
	</c:if>
	<c:if test="${action eq 'delete'}">
		<form id="deleteForm" method="post"
			action="${pageContext.request.contextPath}/employee/delete.do">
			<input type="hidden" name="id" id="deleteId" />
			<div class="button-group">
				<button type="button" class="btn-update" onclick="deleteHandler()">
					<fmt:message key="empSel.ButtonDelete" />
				</button>
			</div>
		</form>
	</c:if>
</util:layout>
<script>
	function updateHandler() {
		const selected = document.querySelector('input[name="employeeId"]:checked');
		if (!selected) {
			alert('수정할 직원을 선택해주세요.');
			return;
		}
		const id = selected.value;
		// contextPath 포함해서 이동
		location.href = '${pageContext.request.contextPath}/employee/select_id?id=' + id;
	}
	
	function deleteHandler() {
		const selected = document.querySelector('input[name="employeeId"]:checked');
		if (!selected) {
			alert('삭제할 직원을 선택해주세요.');
			return;
		}
		document.getElementById('deleteId').value = selected.value;
		document.getElementById('deleteForm').submit();
	}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
