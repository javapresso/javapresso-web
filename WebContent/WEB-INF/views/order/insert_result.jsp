<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<util:layout menuList="${sideMenus}">

<h2>주문 완료</h2>
<p>주문하신 메뉴: ${menuName}</p>
<p>전화번호: ${customerId}</p>
<p>ice 선택여부: ${isIce}</p>
<p>쿠폰 사용 여부: ${couponCount}</p>
<p>요청사항: ${requestText}</p>


</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
