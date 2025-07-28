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
		<h2>메뉴판 페이지</h2>
		<table border="1">
			<tr>
				<th>parentName</th>
				<th>categoryName</th>
				<th>menuName</th>
				<th>price</th>
				<th>description</th>
				<th>isSoldout</th>
				<th>iceable</th>
			</tr>
			<c:forEach var="menu" items="${menuList}">
				<tr>
					<td>${menu.parentName}</td>
					<td>${menu.categoryName}</td>
					<td>${menu.menuName}</td>
					<td>${menu.price}</td>
					<td>${menu.description}</td>
					<td>${menu.isSoldout}</td>
					<td>${menu.iceable}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
