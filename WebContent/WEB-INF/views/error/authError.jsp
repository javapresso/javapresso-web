<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <img src="${pageContext.request.contextPath}/images/warning.png" alt="<fmt:message key='authError.AltText' />" class="warning-icon" />
    <c:choose>
      <c:when test="${not empty error}">
        <h3 class="warning-title">${error}</h3>
      </c:when>
      <c:otherwise>
        <h3 class="warning-title">
          <fmt:message key="authError.UnknownMessage" />
        </h3>
      </c:otherwise>
    </c:choose>
    <div class="error-button-wrapper">
      <button class="button-main" onclick="location.href='/login' ">
        <fmt:message key="authError.ButtonLogin" />
      </button>
      <button class="button-main" onclick="location.href='/order' ">
        <fmt:message key="authError.ButtonOrder" />
      </button>
    </div>
  </div>
</body>
</html>