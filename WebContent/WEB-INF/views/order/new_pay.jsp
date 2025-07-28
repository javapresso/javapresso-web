<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/orderpay.css" />

<util:layout menuList="${sideMenus}">
        <h2 class="payment-title">결제 수단을 선택해 주세요.</h2>

        <form class="payment-options">
            <label class="payment-option">
            <input type="radio" name="payment" value="card" checked />
            <span class="custom-radio"></span>
            <span class="label-text">카드결제</span>
            </label>

            <label class="payment-option">
            <input type="radio" name="payment" value="kakaopay" />
            <span class="custom-radio"></span>
            <span class="label-text">카카오페이</span>
            </label>

            <label class="payment-option">
            <input type="radio" name="payment" value="naverpay" />
            <span class="custom-radio"></span>
            <span class="label-text">네이버페이</span>
            </label>

            <label class="payment-option">
            <input type="radio" name="payment" value="coupon" />
            <span class="custom-radio"></span>
            <span class="label-text">제휴사/이벤트 쿠폰</span>
            </label>
        </form>
        <div class="button-group ">
            <button class="btn-cancel">주문취소</button>
            <button class="btn-confirm">주문확인</button>
        </div>
        
</util:layout>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>