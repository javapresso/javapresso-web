<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/coupon_result.css" />
<util:layout menuList="${sideMenus}">

	<c:choose>
		<c:when test="${not empty point and not empty point.customerId}">
		
		
		
			<!-- 타이틀 -->
			<div class="order-result">
				<fmt:message key="ordCpRst.my" /> <strong><fmt:message key="ordCpRst.coupon" /></strong> <fmt:message key="ordCpRst.list" />
			</div>

			<!-- 카드 -->
			<div class="result-card">
				<div class="result-info">
					<strong>${point.customerId}</strong> <fmt:message key="ordCpRst.memberInfo" />
				</div>
				<div class="result-info"><fmt:message key="ordCpRst.welcomeMsg" /></div>

				<!-- 스탬프 시각화 -->
				<div class="result-info">
					<fmt:message key="ordCpRst.stampCnt" /> : <strong>${point.stamp}</strong>
				</div>
				<div class="stamp-container">
					<c:forEach var="i" begin="1" end="${point.stamp}">
						<img class="stamp-icon"
							src="${pageContext.request.contextPath}/public/images/stamp_${i <= point.stamp ? 'on' : 'off'}.png"
							alt="stamp" />
					</c:forEach>
				</div>

				<!-- 쿠폰 시각화 -->
				<div class="result-info">
					<fmt:message key="ordCpRst.coupon" /> : <strong>${point.coupon}</strong>
				</div>
				<div class="coupon-container">
					<c:forEach var="i" begin="1" end="${point.coupon}">
						<img class="coupon-icon"
							src="${pageContext.request.contextPath}/public/images/coupon.png"
							alt="coupon" />
					</c:forEach>
				</div>
			</div>
			
		</c:when>		
		
		<c:otherwise>
			<div class="result-card">
				<h2><fmt:message key="ordCpRst.cannotfind" /></h2>
				<p><fmt:message key="ordCpRst.happyJavaPresso" /></p>
			</div>
		</c:otherwise>
	</c:choose>
		
	<div class="button-group">
		<button class="check-button" onclick="location.href='${pageContext.request.contextPath}/order/insert/menu'"><fmt:message key="ordCpRst.insert" /></button>
	</div>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>