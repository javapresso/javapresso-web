<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/public/css/order/orderform1.css" />
<util:layout menuList="${sideMenus}">
<div class="big-category">Categories</div>

<div class="buttongroup big-category-group">
  <c:forEach var="cat" items="${bigCategories}">
    <form method="get" action="${pageContext.request.contextPath}/order/insert/menu" style="display:inline;">
      <input type="hidden" name="parent" value="${cat}" />
      <button type="submit" class="big-category-button ${cat eq selectedBig ? 'active' : ''}">
        ${cat}
      </button>
    </form>
  </c:forEach>
</div>

<div class="small-category">
  <div class="buttongroup small-category-group">
    <c:forEach var="cat" items="${smallCategories}">
      <form method="get" action="${pageContext.request.contextPath}/order/insert/menu" style="display:inline;">
        <input type="hidden" name="parent" value="${selectedBig}" />
        <input type="hidden" name="child" value="${cat}" />
        <button type="submit" class="small-category-button ${cat eq selectedSmall ? 'active' : ''}">
          ${cat}
        </button>
      </form>
    </c:forEach>
  </div>
</div>
<div class="selectcategory">
  <fmt:message key="ordNewMenu.selectedCategory" />: ${selectedBig} &gt; ${selectedSmall}
</div>

<div class="menu-list">
  <c:forEach var="menu" items="${menuList}">
    <form action="${pageContext.request.contextPath}/order/insert" method="get">
      <input type="hidden" name="menuName" value="${menu.menuName}" />
      <button type="submit" class="menu-card">
        <img class="menu-img" src="${pageContext.request.contextPath}/images/${menu.thumbnailPath}" id="menu-image"/>
        <div class="menu-text">
          <div class="menu-name">${menu.menuName}</div>
          <div class="menu-price">${menu.price}<fmt:message key="ordNewMenu.krw" /></div>
          <div class="menu-info">${menu.description}</div>
        </div>
      </button>
    </form>
  </c:forEach>
</div>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
