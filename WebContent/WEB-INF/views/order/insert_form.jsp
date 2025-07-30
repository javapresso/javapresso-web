<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/order/orderform2.css" />
<util:layout menuList="${sideMenus}">
<h3>
  <fmt:message key="ordInsertForm.option" /> - ${menu.menuName} : 
  <fmt:message key="ordInsertForm.optionPrice" />: ${menu.price}
  <fmt:message key="ordInsertForm.optionKRW" />
</h3>

<form action="${pageContext.request.contextPath}/order/insert.do" method="post">

  <input type="hidden" name="menuName" value="${menu.menuName}" />

  <h1 class="membership-title">
    <fmt:message key="ordInsertForm.title" />
  </h1>

  <p class="membership-desc">
    <fmt:message key="ordInsertForm.membership" />
  </p>

  <p class="membership-desc">
    <fmt:message key="ordInsertForm.desc1" />
    <%-- 원래 아래처럼 쪼개진 문장 조합이라면:
      음료 스탬프 <strong>10개</strong> 적립시 커피 <strong>무료 쿠폰</strong> 증정
      ordInsertForm.desc2 = 10개
      ordInsertForm.desc3 = 적립시 커피
      ordInsertForm.desc4 = 무료 쿠폰
      ordInsertForm.desc5 = 증정
    --%>
    <%-- 
    <fmt:message key="ordInsertForm.desc2" /> 
    <strong><fmt:message key="ordInsertForm.desc3" /></strong> 
    <strong><fmt:message key="ordInsertForm.desc4" /></strong> 
    <fmt:message key="ordInsertForm.desc5" />
    --%>
  </p>

  <div class="input-wrapper">
    <input type="text" class="phonenumber" name="phone"
      placeholder="<fmt:message key='ordInsertForm.phonePH' />"
      maxlength="11"
      onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" />

    <label class="checkbox-label">
      <input type="checkbox" name="ice" value="1" />
      <fmt:message key="ordInsertForm.orderIce" />
    </label>

    <label class="request-label">
      <fmt:message key="ordInsertForm.request" />:
      <input type="text" class="request-input" name="request"
        placeholder="<fmt:message key='ordInsertForm.requestPH' />" />
    </label>
  </div>

  <div class="button-wrapper">
    <button type="submit" class="btn-submit">
      <fmt:message key="ordInsertForm.order" />
    </button>
  </div>
</form>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
