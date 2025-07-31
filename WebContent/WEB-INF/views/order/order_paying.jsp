<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/orderpaying.css" />

<util:layout menuList="${sideMenus}">
  <div class="order-result">결제 진행</div>
  <div class="result-info">결제가 완료전까지 카드를 빼지 마세요.</div>
    <div class="result-card">
      <div class="result-info2">${menuName}</div> 
      <div class="result-info2">${price}</div>
    </div> 
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>