<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/couponform.css" />
<util:layout menuList="${sideMenus}">
	<h3 class="modal-title"><fmt:message key="ordCpForm.title" /></h3>
	<div class="modal-container">
		<div class="coupon-modal-card">
			<p class="coupon-info">
				<fmt:message key="ordCpForm.subTitle1" /> <strong>${couponCount}</strong><fmt:message key="ordCpForm.subTitle2" />
			</p>
			<p class="coupon-question"><fmt:message key="ordCpForm.question" /></p>
			<form action="${pageContext.request.contextPath}/order/insert.do" method="post" class="coupon-form">
				<input type="hidden" name="phone" value="${customerId}" /> 
				<input type="hidden" name="menuName" value="${menuName}" /> 
				<input type="hidden" name="request" value="${requestText}" /> 
				<input type="hidden" name="ice" value="${isIce ? '1' : '0'}" />
				<div class="button-group">
					<button type="submit" name="coupon" value="0" class="check-button secondary"><fmt:message key="ordCpForm.buttonUnUse" /></button>
					<button type="submit" name="coupon" value="1" class="check-button primary"><fmt:message key="ordCpForm.buttonUse" /></button>
				</div>
			</form>
		</div>
	</div>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
