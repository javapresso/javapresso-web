<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/order/orderform1.css" />

<util:layout menuList="${sideMenus}">

	<!DOCTYPE html>
	<html lang="ko">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/employee/select.css" />
<link href="https://fonts.googleapis.com/css2?family=Itim&display=swap"
	rel="stylesheet" />
<link href="gmarket-sans.css" rel="stylesheet" />
<title>JavaPresso</title>
</head>

<body>
	<div class="container">
		<div class="content">
			<c:if test="${action eq 'select'}">
				<h1 class="insertemployee">직원 정보 조회</h1>
				<div class="content-title"></div>
			</c:if>
			<c:if test="${action eq 'update'}">
				<h1 class="insertemployee">직원 정보 수정</h1>
				<div class="content-title">수정할 직원을 선택해주세요.</div>
			</c:if>
			<c:if test="${action eq 'delete'}">
				<h1 class="insertemployee">직원 정보 삭제</h1>
				<div class="content-title">삭제할 직원을 선택해주세요.</div>
			</c:if>
			<table class="table">
				<thead>
					<tr>
						<c:if test="${action ne 'select'}">
							<th scope="col"></th>
						</c:if>
						<th scope="col">직원ID</th>
						<th scope="col">이름</th>
						<th scope="col">전화번호</th>
						<th scope="col">직급</th>
						<th scope="col">급여</th>
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
					<button type="button" class="btn-update" onclick="updateHandler()">수정하기</button>
				</div>
			</c:if>
			<c:if test="${action eq 'delete'}">
				<form id="deleteForm" method="post"
					action="${pageContext.request.contextPath}/employee/delete.do">
					<input type="hidden" name="id" id="deleteId" />
					<div class="button-group">
						<button type="button" class="btn-update" onclick="deleteHandler()">삭제하기</button>
					</div>
				</form>
			</c:if>
		</div>
	</div>

	<script>
    	document
    		.querySelectorAll('.sidebar_item')
    		.forEach(btn => btn.addEventListener('click', e => {
    			document.querySelectorAll('.sidebar_item').forEach(b => b.classList.remove('is-active'));
    			e.target.classList.add('is-active');
   			}));
    	
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
</body>
	</html>

</util:layout>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>