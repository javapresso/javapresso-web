<%@ tag pageEncoding="UTF-8" body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="menuList" required="true" type="java.util.ArrayList" %>

<aside class="sidebar">
	<nav class="sidebar_menu">
		<c:forEach var="menu" items="${menuList}">
			<button class="sidebar_item" onclick="location.href='${menu.url}'">${menu.name}</button>
		</c:forEach>
	</nav>
</aside>