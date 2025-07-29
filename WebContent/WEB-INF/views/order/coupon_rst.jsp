<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/coupon_result.css" />
<util:layout menuList="${sideMenus}">

	<c:choose>
		<c:when test="${not empty point and not empty point.customerId}">
		
		
		
			<!-- 타이틀 -->
			<div class="order-result">
				나의 <strong>쿠폰</strong> 적립내역
			</div>

			<!-- 카드 -->
			<div class="result-card">
				<div class="result-info">
					<strong>${point.customerId}</strong> 님의 적립 정보입니다.
				</div>
				<div class="result-info">방문해주셔서 감사합니다. 지금 바로 주문을 진행해보세요!</div>

				<!-- 스탬프 시각화 -->
				<div class="result-info">
					스탬프 개수 : <strong>${point.stamp}</strong>
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
					사용가능 쿠폰 : <strong>${point.coupon}</strong>
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
				<h2>회원 정보를 찾을 수 없습니다.</h2>
				<p>행복의 시작 자바 프레소에서 주문을 시작해보세요.</p>
			</div>
		</c:otherwise>
	</c:choose>
		
	<div class="button-group">
		<button class="check-button" onclick="location.href='${pageContext.request.contextPath}/order/insert/menu'">주문하러가기</button>
	</div>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>