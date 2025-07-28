<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> --%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/order/orderselect.css" />
<util:layout menuList="${sideMenus}">
	<h1 class="insertemployee">주문내역 조회</h1>
	<div class="content-title">오늘의 주문내역입니다.</div>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">주문ID</th>
				<th scope="col">메뉴명</th>
				<th scope="col">회원번호</th>
				<th scope="col">주문시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${orderList}">
				<tr>
					<td>${order.orderId}</td>
					<td>${order.customerId}</td>
					<td>${order.menuName}</td>
					<td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<%-- <p>orderList size: ${fn:length(orderList)}</p> --%>


</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>