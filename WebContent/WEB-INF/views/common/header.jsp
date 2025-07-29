<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>빠른 행복의 시작 JAVAPRESSO</title>
	<link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/ungveloper/web-fonts/GmarketSans/font-face.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/ungveloper/web-fonts/GmarketSans/font-family.css" />
	<!-- common styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/global.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/layout.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/sidebar.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/footer.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/modal.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/login.css" />
	<!-- menu styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/insert.css" />
	<!-- order styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/menu.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/orderform1.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/orderform2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/orderdelete.css" />
</head>
<body>
	<div class="header-container">
		<header class="site-header">
		    <div class="logo">
		        <a href="${pageContext.request.contextPath}/">
		            <img src="${pageContext.request.contextPath}/public/images/logo.png" alt="Javapresso" />
		        </a>
		    </div>
		    <nav class="main-nav">
		        <ul>
		            <li><a href="${pageContext.request.contextPath}/menu/">메뉴 조회</a></li>
		            <li><a href="${pageContext.request.contextPath}/member/">직원관리</a></li>
		            <li><a href="${pageContext.request.contextPath}/order/menuform">주문관리</a></li>
		            <c:if test="${not empty sessionScope.userId}">
					    <button class="logout_button" onclick="location.href='${pageContext.request.contextPath}/logout'">로그아웃</button>
					</c:if>
		        </ul>
		    </nav>
		</header>
	</div>
