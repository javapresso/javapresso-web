<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/orderdelete.css" />

<util:layout menuList="${sideMenus}">
	<h1 class="insertemployee">주문내역 삭제</h1>
	<div class="content-title">최근 1시간 이내 주문내역입니다.</div>
	<table class="table">
		<thead>
			<tr>
				<th scope="col"></th>
				<th scope="col">주문ID</th>
				<th scope="col">메뉴명</th>
				<th scope="col">회원번호</th>
				<th scope="col">주문시간</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row"><input type="radio" name="deleteOrder" /></th>
				<td>01</td>
				<td>카케라떼</td>
				<td>01025684598</td>
				<td>2025-06-08-22222</td>
			</tr>
			<tr>
				<th scope="row"><input type="radio" name="deleteOrder" /></th>
				<td>02</td>
				<td>카케라떼</td>
				<td>01025684598</td>
				<td>2025-06-08-22222</td>
			</tr>
			<tr>
				<th scope="row"><input type="radio" name="deleteOrder" /></th>
				<td>03</td>
				<td>카케라떼</td>
				<td>01025684598</td>
				<td>2025-06-08-22222</td>
			</tr>
		</tbody>
	</table>

	<div class="button-group">
		<button class="btn-delete">주문삭제</button>
	</div>


	<!-- 삭제 확인 모달 -->
	<div class="delete-modal" id="deleteModal">
		<div class="delete-modal-content">
			<div class="modal-text">
				선택한 주문정보를<br />정말로 삭제하시겠습니까?
			</div>
			<div class="delete-modal-buttons">
				<button class="modal-btn cancel">취소</button>
				<button class="modal-btn confirm">확인</button>
			</div>
		</div>
	</div>
	<%-- 	<div>
		<h2>주문내역 ${action}</h2>
		<table border="1">
			<tr>
				<th>${action}</th>
				<th>orderId</th>
				<th>customerId</th>
				<th>menuName</th>
				<th>orderDate</th>
			</tr>
			<c:forEach var="order" items="${orderList}">
				<tr>
					<th>${action}</th>
					<td>${order.orderId}</td>
					<td>${order.customerId}</td>
					<td>${order.menuName}</td>
					<td>${order.orderDate}</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<button>${action}</button>
		</div>
	</div> --%>

</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>