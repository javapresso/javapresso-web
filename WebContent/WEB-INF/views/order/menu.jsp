<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/order/menu.css" />
<util:layout menuList="${sideMenus}">
<header class="content_header">
  <img
    src="${pageContext.request.contextPath}/public/images/menuboardimg.png"
    class="content_logo" alt="메뉴판이미지">
</header>

<!-- 메뉴 리스트 -->
<section class="content_categories">
  <div>
    <table class="table">
      <thead>
        <tr>
          <th scope="col"><fmt:message key="ordMenu.category" /></th>
          <th scope="col"><fmt:message key="ordMenu.subCategory" /></th>
          <th scope="col"><fmt:message key="ordMenu.name" /></th>
          <th scope="col"><fmt:message key="ordMenu.price" /></th>
          <th scope="col"><fmt:message key="ordMenu.desc" /></th>
          <%-- <th scope="col">솔드아웃</th> --%>
          <%-- <th scope="col">iceable</th> --%>
        </tr>
      </thead>

      <c:forEach var="menu" items="${menuList}">
        <tbody>
          <tr>
            <td>${menu.parentName}</td>
            <td>${menu.categoryName}</td>
            <td>${menu.menuName}</td>
            <td>${menu.price}</td>
            <td>${menu.description}</td>
            <%-- <td>${menu.isSoldout}</td> --%>
            <%-- <td>${menu.iceable}</td> --%>
          </tr>
        </tbody>
      </c:forEach>
    </table>
  </div>
</section>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
