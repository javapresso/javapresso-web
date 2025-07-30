<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html>
	<head>
	  <meta charset="UTF-8" />
	  <meta name="viewport" content="width=device-width, initial-scale=1" />
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/error.css" />
	  <link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
	  <link href="gmarket-sans.css" rel="stylesheet"> 
  	  <title>JavaPresso</title>
	</head>
	<body>
		<div class="error-container">
			<img src="${pageContext.request.contextPath}/public/images/warning.png" alt="Authorization Error" class="warning-icon" />
			<c:choose>
			    <c:when test="${not empty error}">
			        <h3 class="warning-title">${error}</h3>
			    </c:when>
			    <c:otherwise>
			        <h3 class="warning-title">런타임 오류가 발생했습니다.</h3>
			    </c:otherwise>
			</c:choose>
			<button class="button-main" onclick="location.href='/order/menuform' ">주문 페이지로</button>
		</div>
	</body>
</html>


