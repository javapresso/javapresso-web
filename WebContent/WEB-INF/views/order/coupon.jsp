<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/couponcheck.css" />

<!-- 쿠폰확인페이지 -->

<util:layout menuList="${sideMenus}">
<div class="coupon_check">
      <h1 class="membership-title">쿠폰 확인</h1>
        <p class="membership-desc">회원번호를 입력하고 적립된 쿠폰과 스탬프 개수를 확인하세요.</p>
        <p class="membership-desc">음료 스탬프 <strong>10개</strong> 적립시 커피 <strong>무료 쿠폰</strong> 증정</p>     
    <form action="${pageContext.request.contextPath}/order/coupon" method="get">
  <div class="phone-input-wrapper">
    <input type="text" name="id" class="phonenumber" placeholder="전화번호를 입력하세요"
           maxlength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required />
  </div>
  
  <div class="button-group">
    <input class="btn-earn-points" type="submit" value="확인하기" />
  </div>
</form>
</div>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>