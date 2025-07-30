<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.selectedLocale}" />
<fmt:setBundle basename="messages" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/orderdelete.css" />

<util:layout menuList="${sideMenus}">
<h1 class="insertemployee"><fmt:message key="ordDelete.title" /></h1>
<div class="content-title"><fmt:message key="ordDelete.subTitle" /></div>

<form action="${pageContext.request.contextPath}/order/delete" method="get">
  <table class="table">
    <thead>
      <tr>
        <th scope="col"></th>
        <th scope="col"><fmt:message key="ordDelete.orderId" /></th>
        <th scope="col"><fmt:message key="ordDelete.menuName" /></th>
        <th scope="col"><fmt:message key="ordDelete.MemberNum" /></th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="order" items="${orderList}">
        <tr>
          <th scope="row"><input type="radio" name="deleteOrder" value="${order.orderId}" /></th>
          <td>${order.orderId}</td>
          <td>${order.menuName}</td>
          <td>${order.customerId}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <div class="button-group">
    <input class="btn-delete" type="submit" value="<fmt:message key='ordDelete.title' />">
  </div>
</form>

<!-- 삭제 확인 모달 -->
<div class="delete-modal" id="deleteModal">
  <div class="delete-modal-content">
    <div class="modal-text">
      <fmt:message key="ordDelete.modalTextFront" /><br />
      <fmt:message key="ordDelete.modalTextBack" />
    </div>
    <div class="delete-modal-buttons">
      <button class="modal-btn cancel"><fmt:message key="ordDelete.cancel" /></button>
      <button class="modal-btn confirm"><fmt:message key="ordDelete.confirm" /></button>
    </div>
  </div>
</div>
	
	
	<script>
	  document.addEventListener("DOMContentLoaded", function () {
	    const form = document.querySelector("form");
	    const modal = document.getElementById("deleteModal");
	    const confirmBtn = document.querySelector(".modal-btn.confirm");
	    const cancelBtn = document.querySelector(".modal-btn.cancel");
	
	    const deleteBtn = document.querySelector(".btn-delete");
	
	    deleteBtn.addEventListener("click", function (e) {
	      e.preventDefault(); // 기본 form 제출 막기
	
	      // 라디오 버튼 선택 여부 확인
	      const selectedRadio = document.querySelector("input[name='deleteOrder']:checked");
	      if (!selectedRadio) {
	        alert("삭제할 주문을 선택해주세요.");
	        return;
	      }
	      // 모달 보여주기
	      modal.style.display = "flex";
	    });
	
	    cancelBtn.addEventListener("click", function () {
	      modal.style.display = "none";
	    });
	
	    confirmBtn.addEventListener("click", function () {
	      modal.style.display = "none";
	      form.submit(); // 진짜 form 제출
	    });
	
	    window.addEventListener("click", function (e) {
	      if (e.target === modal) {
	        modal.style.display = "none";
	      }
	    });
	  });
	</script>
	
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
