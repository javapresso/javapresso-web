<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/public/css/order/orderform1.css" />

<util:layout menuList="${sideMenus}">

  <div class="big-category">Categories</div>
  <div class="buttongroup big-category-group">
    <c:forEach var="parentCategory" items="${parentNameList}">
      <form method="get" action="order.do">
        <input type="hidden" name="parent" value="${parentCategory}" />
        <button type="submit"
          class="big-category-button ${parentCategory eq selectedBig ? 'active' : ''}">
          ${parentCategory}
        </button>
      </form>
    </c:forEach>
  </div>

  <c:if test="${not empty selectedBig}">
    <div class="small-category">
      <div class="buttongroup small-category-group">
        <c:forEach var="child" items="${categoryNameList}">
          <form method="get" action="order.do">
            <input type="hidden" name="parent" value="${selectedBig}" />
            <input type="hidden" name="child" value="${child}" />
            <button type="submit"
              class="small-category-button ${child eq selectedSmall ? 'active' : ''}">
              ${child}
            </button>
          </form>
        </c:forEach>
      </div>
    </div>
  </c:if>

  <div class="selectcategory">
    선택된 카테고리:
    <c:out value="${selectedBig}" /> 
    <c:if test="${not empty selectedSmall}">
      > <c:out value="${selectedSmall}" />
    </c:if>
  </div>

  <div class="menu-list">
    <c:forEach var="menu" items="${menuList}">
      <div class="menu-card">
        <div class="menu-img">이미지</div>
        <div class="menu-text">
          <div class="menu-name">${menu.menuName}</div>
          <div class="menu-price">${menu.price}원</div>
          <div class="menu-info">${menu.description}</div>
        </div>
      </div>
    </c:forEach>
    <c:if test="${empty menuList}">
      <p style="padding: 20px;">해당 카테고리에 메뉴가 없습니다.</p>
    </c:if>
  </div>

</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
