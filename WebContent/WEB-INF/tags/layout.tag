<%@ tag body-content="tagdependent" pageEncoding="utf-8" %>
<%@ attribute name="menuList" required="true" type="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>

<link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
<link href="gmarket-sans.css" rel="stylesheet"> 

<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/global.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/sidebar.css" />

<div class="container">
	<util:sidebar menuList="${menuList}"/>
	<main class="content">
		<jsp:doBody />
	</main>
</div>
<script src="${pageContext.request.contextPath}/public/js/sidebar.js"></script>