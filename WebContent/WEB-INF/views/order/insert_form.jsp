<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/orderform2.css" />
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />
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
