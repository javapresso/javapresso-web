<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/error.css" />
	<title>JavaPresso</title>
	  <link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
	  <link href="gmarket-sans.css" rel="stylesheet"> 
	</head>
<body>
  <div class="error-container">
    <img src="${pageContext.request.contextPath}/public/images/404error.png" 
        alt="<fmt:message key='error404.AltText' />" class="sidebar_logo" />
    <button class="button-main" onclick="location.href='/' ">
      <fmt:message key="error404.ButtonHome" />
    </button>
  </div>
</body>
</html>