<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/orderform2.css" />
<util:layout menuList="${sideMenus}">
	<h3>옵션 선택 - ${menu.menuName} : 가격: ${menu.price}원</h3>
	
	
	<form action="${pageContext.request.contextPath}/order/insert.do" method="post">
		<input type="hidden" name="menuName" value="${menu.menuName}" />
		<p>멤버십 전화번호를 입력하세요.</p>
		<label>전화번호:<input type="text" name="phone" required/></label><br>
		<label> ICE로 주문할까요? <input type="checkbox" name="ice" value="1" /></label><br>
		<label> 쿠폰 사용: <input type="checkbox" name="coupon" value="1" /></label><br> 
		<label> 요청사항: <input type="text" name="request" /></label><br>
		<button type="submit">주문하기</button>
	</form>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>