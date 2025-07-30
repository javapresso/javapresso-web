<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<util:layout menuList="${sideMenus}">
		<section class="content_categories">
		<div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">큰 카테고리</th>
						<th scope="col">작은 카테고리</th>
						<th scope="col">가격</th>
						<th scope="col">매뉴설명</th>
						<th scope="col">아이스가능</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="menu" items="${menuList}">
						<tr id="${menu.menuName}" class="menu_row">
							<td>${menu.categoryName}</td>
							<td>${menu.menuName}</td>
							<td><fmt:formatNumber value="${menu.price}" type="number" /></td>
							<td>${menu.description}</td>
							<td><c:choose>
							    <c:when test="${menu.iceable == 1}">가능</c:when>
							    <c:otherwise>불가능</c:otherwise>
							  </c:choose>
						  	</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
</util:layout>
<script>
	const menuItems = document.querySelectorAll(".menu_row");
	console.log("menuItems", menuItems);
	const menuClickHandler = (event) => {
		const menuId = event.currentTarget.id;
		
		console.log("menuId from index.jsp: ", menuId);
		
		if (menuId) {
			location.href = '<c:url value="/menu/detail"/>' + '?menuId=' + encodeURIComponent(menuId);
		}
	}
	
	menuItems.forEach(item => item.addEventListener("click", menuClickHandler));
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>