<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
	<link href="gmarket-sans.css" rel="stylesheet"> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/global.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/layout.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/sidebar.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/insert.css" />
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<util:layout menuList="${menuList}">
		<p>parentMenus 타입: ${parentMenus.getClass().name}</p>
		<p>parentMenus 크기: ${parentMenus.size()}</p>
		<p>parentMenus 내용: ${parentMenus}</p>
		<h2 class="title">이곳은 메뉴 추가 페이지입니다.</h2>
		<div class="content-box">
			<div class="category-box">
				<p class="option-title">카테고리 설정하기</p>
				<div class="option-wrapper">
					<label class="option-title">대분류</label>
					<div class="option-box">
						<c:forEach var="menu" items="${parentMenus}">
							<script>console.log('parent menu: ${menu}');</script>
							<p>menu = ${menu}</p>
						    <button type="button" class="option" data-id="${menu}">
					      		<c:out value="${menu}"/>
						    </button>
				  		</c:forEach>
					</div>
				</div>
				<div class="option-wrapper">
					<label class="option-title">소분류</label>
					<div class="option-box">
						<c:forEach var="child" items="${childMenus}">
						    <button type="button" class="option" data-id="${category.id}">
					      		${category.name}
						    </button>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="input-wrapper">
				<div class="image-box">
					<p class="option-title">대표 이미지</p>
					<div class="image-area">
						<img src="/public/images/Image.png" class="default_image"/>
					</div>
					<div class="image-button-wrapper">
						<input type="button" class="image-button" value="업로드하기"/>
						<input type="button" class="image-button" value="삭제하기"/>
					</div>
				</div>
			</div>
		</div>
		<div class="button-wrapper">
			<button class="button" name="insert">등록 취소</button>
			<button class="button pink" name="cancel">등록 하기</button>
		</div>
	</util:layout>
	<script src="${pageContext.request.contextPath}/public/js/sidebar.js"></script>
</body>
</html>



