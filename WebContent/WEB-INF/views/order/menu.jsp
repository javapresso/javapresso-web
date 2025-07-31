<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/menu.css" />
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />
<util:layout menuList="${sideMenus}">
  <header class="content_header">
    <img class="content_logo" src="${pageContext.request.contextPath}/public/images/menuboardimg.png" alt="메뉴판">
  </header>
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
          </tr>
        </thead>
        <c:forEach var="menu" items="${menuList}">
          <tbody>
            <tr>
              <td>${menu.parentName}</td>
              <td>${menu.categoryName}</td>
              <td>${menu.menuName}</td>
              <td><fmt:formatNumber value="${menu.price}" type="number" /></td>
              <td>${menu.description}</td>
            </tr>
          </tbody>
        </c:forEach>
      </table>
    </div>
  </section>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
