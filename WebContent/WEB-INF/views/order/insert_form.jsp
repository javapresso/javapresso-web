<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<util:layout menuList="${sideMenus}">
	<h3>옵션 선택 - ${menu.menuName} : 가격: ${menu.price}원</h3>
	<form action="${pageContext.request.contextPath}/order/insert.do" method="post">

		<input type="hidden" name="menuName" value="${menu.menuName}" />
		<h1 class="membership-title">멤버십 전화번호를 입력하세요.</h1>
		<p class="membership-desc">별도의 앱 가입 없이 휴대폰 번호만으로 적립 가능 !</p>
		<p class="membership-desc">
			음료 스탬프 <strong>10개</strong> 적립시 커피 <strong>무료 쿠폰</strong> 증정
		</p>

		<div class="input-wrapper">
			<input type="text" class="phonenumber" name="phone"
				placeholder="전화번호를 입력하세요" maxlength="11"
				onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" /> <label
				class="checkbox-label"> <input type="checkbox" name="ice"
				value="1" /> ICE로 주문하기
			</label> <label class="request-label"> 요청사항: <input type="text"
				class="request-input" name="request" placeholder="요청사항을 입력하세요" />
			</label>
		</div>

		<div class="button-wrapper">
			<button type="submit" class="btn-submit">주문하기</button>
		</div>
	</form>
</div>
</util:layout>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>