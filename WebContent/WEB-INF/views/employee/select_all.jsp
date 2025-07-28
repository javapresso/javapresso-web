<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2>직원 ${action}</h2>
		<table border="1">
			<tr>
				<th>${action}</th>
				<th>ID</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>직책</th>
				<th>연봉</th>
				<th>관리자 ID</th>
			</tr>
			<c:forEach var="emp" items="${empList}">
				<tr>
					<th>${action}</th>
					<td>${emp.employeeId}</td>
					<td>${emp.employeeName}</td>
					<td>${emp.phoneNumber}</td>
					<td>${emp.title}</td>
					<td>${emp.salary}</td>
					<td>${emp.managerId}</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<button>${action}</button>
		</div>
	</div>
</body>
</html>