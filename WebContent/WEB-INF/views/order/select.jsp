<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
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
	</div>
</body>
</html>