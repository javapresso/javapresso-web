<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />
<util:layout menuList="${sideMenus}">
  <div class="order-result">
    <fmt:message key="ordInsertRst.title" />
  </div>
  <div class="result-card">
    <div class="result-info">
      <strong>${customerId}</strong> <fmt:message key="ordInsertRst.orderState" />
    </div>
    <div class="result-info">
      <fmt:message key="ordInsertRst.thkMsg" /><br /><br /><br />
    </div>
    <div class="result-info">
      <fmt:message key="ordInsertRst.stamp" /> :
      <strong>${point.stamp}</strong>
    </div>
    <div class="result-info">
      <fmt:message key="ordInsertRst.coupon" /> :
      <strong>${point.coupon}</strong>
    </div>
    <div class="rabbit-wrapper">
      <img class="rabbit-icon"
          src="${pageContext.request.contextPath}/images/rabbit.png"
          alt="rabbit" />
    </div>
  </div>
  <div class="button-group">
    <button class="check-button"
            onclick="location.href='${pageContext.request.contextPath}/order/selectform'">
      <fmt:message key="ordInsertRst.buttonConfirm" />
    </button>
  </div>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
