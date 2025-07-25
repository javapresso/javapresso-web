<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" />
	</head>
	<body>
		<util:layout  menuList="${menuList}">
			<h2>이곳은 메뉴 상세조회 페이지입니다.</h2>
			<div>
			<label>대분류</label>
			  <c:forEach var="category" items="${topCategories}">
			    <button type="button" class="top-category-btn" data-id="${category.id}" onclick="loadSubCategories(this)">
			      ${category.name}
			    </button>
			  </c:forEach>
			</div>
			<div>
				<label>소분류</label>
				  <c:forEach var="category" items="${topCategories}">
				    <button type="button" class="top-category-btn" data-id="${category.id}" onclick="loadSubCategories(this)">
				      ${category.name}
				    </button>
				  </c:forEach>
			</div>
		</util:layout>
		<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>
	</body>
</html>