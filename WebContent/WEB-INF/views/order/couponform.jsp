<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/orderform1.css" />

<!-- 주문시 - 쿠폰이 있는 경우 가능하면 모달창으로 띄울거임 -->

<util:layout menuList="${sideMenus}">
  <h3>쿠폰 사용 여부 선택</h3>
  <p>회원님은 쿠폰 ${couponCount}장을 보유하고 있습니다.</p>
  <p>쿠폰을 사용하시겠습니까?</p>

  <form action="${pageContext.request.contextPath}/order/insert" method="post">
    <input type="hidden" name="phone" value="${customerId}" />
    <input type="hidden" name="menuName" value="${menuName}" />
    <input type="hidden" name="request" value="${requestText}" />
    <input type="hidden" name="ice" value="${isIce ? '1' : '0'}" />

    <button type="submit" name="coupon" value="1">쿠폰 사용</button>   <!-- 쿠폰사용하고 결제창으로 넘어가기  -->
    <button type="submit" name="coupon" value="0">쿠폰 사용 안함</button> <!-- 사용 안하고 결제창으로 넘어가기  -->
  </form>
</util:layout>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
