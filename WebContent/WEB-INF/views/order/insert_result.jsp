<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/insert_result.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<util:layout menuList="${sideMenus}">

      <div class="order-result">주문완료</div>
      <div class="result-card">
        <div class="result-info"> <strong>${customerId}</strong> 주문이 완료되었습니다.</div>
        <div class="result-info">감사합니다.   빠르게 준비해드릴게요!<br/><br/><br/></div>
   <%--      <div class="result-info">
         	 주문하신 메뉴: ${menuName}
        </div> --%>
        <div class="result-info">
          	픽업 완료 후 스탬프 개수 : <strong>${point.stamp}</strong>
        </div>
        <div class="result-info">
          	픽업 완료 쿠폰 개수 : <strong>${point.coupon}</strong>
        </div>
        <div class="rabbit-wrapper">
		  <img class="rabbit-icon" src="${pageContext.request.contextPath}/public/images/rabbit.png" alt="rabbit" />
		</div>
      </div>


		
      <div class="button-group">
        <button class="check-button" onclick="location.href='${pageContext.request.contextPath}/order/selectform'">확인</button>
      </div>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
