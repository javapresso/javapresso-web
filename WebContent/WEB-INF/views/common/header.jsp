<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>빠른 행복의 시작 JAVAPRESSO</title>
	<link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
	<link href="gmarket-sans.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/gmarket-sans.css" rel="stylesheet"> 
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
	<!-- employee styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/employee/select.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/employee/insert.css" />
	<!-- menu styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/menu/insert.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/menu/detail.css" />
	<!-- order styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/insert_result.css" />
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
      <ul class="menu-wrapper">
        <li>
          <a href="${pageContext.request.contextPath}/order/menuform">
            <fmt:message key="header.order" />
          </a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/menu/">
            <fmt:message key="header.menu" />
          </a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/employee/select?page=1">
            <fmt:message key="header.employee" />
          </a>
        </li>

        <c:if test="${not empty sessionScope.userId}">
          <button class="logout_button"
                  onclick="location.href='${pageContext.request.contextPath}/logout'">
            <fmt:message key="header.logout" />
          </button>
        </c:if>
      </ul>
    </nav>
  </header>
</div>
