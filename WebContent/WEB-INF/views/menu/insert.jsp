<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<util:layout menuList="${menuList}">
	<h2 class="title">이곳은 메뉴 추가 페이지입니다.</h2>
	<div class="content-box">
		<div class="category-box">
			<p class="option-title">카테고리 설정하기</p>
			<div class="option-wrapper">
				<label class="option-title">대분류</label>
				<div class="option-box">
					<c:forEach var="menu" items="${parentMenus}">
					    <button type="button" class="option" data-id="${menu}">
				      		${menu}
					    </button>
			  		</c:forEach>
				</div>
			</div>
			<div class="option-wrapper">
				<label class="option-title">소분류</label>
				<div class="option-box">
					<c:forEach var="child" items="${childMenus}">
					    <button type="button" class="option" data-id="${category.id}">
				      		${category.name}
					    </button>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="input-wrapper">
			<div class="image-box">
				<p class="option-title">대표 이미지</p>
				<div class="image-area">
					<img src="/public/images/Image.png" class="default_image"/>
				</div>
				<div class="image-button-wrapper">
					<input type="button" class="image-button" value="업로드하기"/>
					<input type="button" class="image-button" value="삭제하기"/>
				</div>
			</div>
		</div>
	</div>
	<div class="button-wrapper">
		<button class="button" name="insert">등록 취소</button>
		<button class="button pink" name="cancel">등록 하기</button>
	</div>
</util:layout>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
