<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/orderresult.css" />
<util:layout menuList="${sideMenus}">
        <div class="order-result">주문상태</div>
          <div class="result-card">
                  <div class="result-info">감사합니다.<br/></div>
                  <div class="result-info">주문이 완료되었습니다.</div>
                  <div class="result-info"><strong>num</strong>번호로 알려드릴게요.</div>
                  <div class="result-info">픽업 완료 후 스탬프 개수 <strong>num</strong></div>
          </div>
          <div class="button-group">
            <button class="check-button">확인</button>
        </div>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
