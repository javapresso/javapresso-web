<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
  <div class="login-container">
    <div class="left-section">
      <img class="login-logo" src="${pageContext.request.contextPath}/images/logo.png" alt="Javapresso" />
      <span class="tagline"><fmt:message key="login.tagline" /></span>
    </div>
    <div class="right-section">
      <h2 class="login-title"><fmt:message key="login.title" /></h2>
      <form action="login/post" method="post">
        <div class="form-group">
          <div class="form-icon"></div>
          <input class="login-input" type="text" name="username" 
            placeholder="<fmt:message key='login.usernamePH' />" required />
        </div>
        <div class="form-group password">
          <div class="form-icon"></div>
          <input class="login-input" type="password" name="password"
            placeholder="<fmt:message key='login.passwordPH' />" required />
        </div>
        <button type="submit" class="login-button">
          <fmt:message key="login.button" />
        </button>
      </form>
    </div>
  </div>
</body>
</html>
