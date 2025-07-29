<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>빠른 행복의 시작 JAVAPRESSO</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
	<link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/gmarket-sans.css" rel="stylesheet"> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/global.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/layout.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/sidebar.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/insert.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/footer.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/modal.css" />
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
		        </ul>
		    </nav>
		</header>
	</div>
