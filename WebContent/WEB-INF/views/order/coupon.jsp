<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/couponcheck.css" />

<!-- 쿠폰확인페이지 -->

<util:layout menuList="${sideMenus}">
<div class="coupon_check">
      <h1 class="membership-title"><fmt:message key="ordCp.title" /></h1>
        <p class="membership-desc"><fmt:message key="ordCp.subTitle" /></p>
        <p class="membership-desc"><fmt:message key="ordCp.desc" /></p>
    <form action="${pageContext.request.contextPath}/order/coupon" method="get">
  <div class="phone-input-wrapper">
    <input type="text" name="id" class="phonenumber" 
    placeholder="<fmt:message key='ordCp.phonePH' />"
    maxlength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required />
  </div>
  
  <div class="button-group">
    <input class="btn-earn-points" type="submit" value="<fmt:message key='ordCp.confirm' />" />
  </div>
</form>
</div>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
