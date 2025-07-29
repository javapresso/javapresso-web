<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/couponform.css" />
<util:layout menuList="${sideMenus}">

	<h3 class="modal-title">쿠폰 사용 여부 선택</h3>
	<div class="modal-container">
		<div class="coupon-modal-card">
			<p class="coupon-info">
				회원님은 쿠폰 <strong>${couponCount}</strong>장을 보유하고 있습니다.
			</p>
			<p class="coupon-question">쿠폰을 사용하시겠습니까?</p>

			<form action="${pageContext.request.contextPath}/order/insert.do"
				method="post" class="coupon-form">
				<input type="hidden" name="phone" value="${customerId}" /> 
				<input type="hidden" name="menuName" value="${menuName}" /> 
				<input type="hidden" name="request" value="${requestText}" /> 
				<input type="hidden" name="ice" value="${isIce ? '1' : '0'}" />
				<div class="button-group">
					<button type="submit" name="coupon" value="0" class="check-button secondary">쿠폰 사용 안함</button>
					<button type="submit" name="coupon" value="1" class="check-button primary">쿠폰 사용</button>
				</div>
			</form>
		</div>
	</div>
	
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
