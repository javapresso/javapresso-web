<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/couponcheck.css" />

<util:layout menuList="${sideMenus}">

	<div>회원번호 : ${point.customerId}</div>
	<div>스탬프 개수 : ${point.stamp}</div>
	<div>사용가능 쿠폰 개수 : ${point.coupon}</div>
	<div>지금까지 받은 쿠폰 개수 : ${point.expectedCoupon}</div>
	</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>