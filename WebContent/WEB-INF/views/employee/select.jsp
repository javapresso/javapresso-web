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
		<h2>직원 정보 수정</h2>
		<div>${emp.employeeId}</div>
		<div>${emp.employeeName}</div>
		<div>${emp.phoneNumber}</div>
		<div>${emp.title}</div>
		<div>${emp.salary}</div>
		<div>${emp.managerId}</div>
	</div>
</body>
</html>