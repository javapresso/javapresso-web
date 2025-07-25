<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<util:layout menuList="${menuList}">
		<h2>이곳은 메뉴 추가 페이지입니다.</h2>
		
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
</body>
</html>