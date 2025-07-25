<%@ tag body-content="tagdependent" pageEncoding="utf-8" %>
<%@ attribute name="menuList" required="true" type="java.util.ArrayList" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>

<div class="container">
	<util:sidebar menuList="${menuList}"/>
	<main class="content">
		<jsp:doBody />
	</main>
</div>