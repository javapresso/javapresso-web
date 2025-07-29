<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />

<div class="footer-container">
	<footer class="footer">
		<p>&copy; <fmt:message key="footer.title" /></p>
		<p>
			GitHub:
			<a href="https://github.com/javapresso" target="_blank" rel="noopener noreferrer">
				https://github.com/javapresso
			</a>
		</p>
	</footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath}/public/js/sidebar.js"></script>
<script src="${pageContext.request.contextPath}/public/js/menu.js"></script>
<script src="${pageContext.request.contextPath}/public/js/modal.js"></script>
</body>
</html>
