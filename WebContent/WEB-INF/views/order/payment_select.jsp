<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<util:layout menuList="${sideMenus}">
        <h2 class="payment-title">결제 수단을 선택해 주세요.</h2>

        <form action="${pageContext.request.contextPath}/order/payment/confirm" method="post" class="payment-options">
            <label class="payment-option">
              <input type="radio" name="paymentMethod" value="card" checked />
              <span class="custom-radio"></span>
              <span class="label-text">카드결제</span>
            </label>

            <label class="payment-option">
              <input type="radio" name="paymentMethod" value="kakaopay" />
              <span class="custom-radio"></span>
              <span class="label-text">카카오페이</span>
            </label>

            <label class="payment-option">
              <input type="radio" name="paymentMethod" value="naverpay" />
              <span class="custom-radio"></span>
              <span class="label-text">네이버페이</span>
            </label>

            <label class="payment-option">
              <input type="radio" name="paymentMethod" value="coupon" />
              <span class="custom-radio"></span>
              <span class="label-text">제휴사/이벤트 쿠폰</span>
            </label>

            <div class="button-group">
              <button type="button" class="btn-cancel" onclick="history.back()">주문취소</button>
              <button type="submit" class="btn-confirm">주문확인</button>
            </div>
        </form>
        </util:layout>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
