<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<util:layout menuList="${sideMenus}">
	<h2 class="title">이곳은 메뉴 추가 페이지입니다.</h2>
	<form id="menuInsertForm" action="/menu/insert" method="post" enctype="multipart/form-data">
		<div class="content-box">
			<div class="category-box">
				<p class="option-title">카테고리 설정하기</p>
				<div class="option-wrapper">
					<label class="option-title">대분류</label>
					<div class="option-box" id="parent-category">
						<c:forEach var="menu" items="${parentMenus}">
						    <button type="button" class="option" data-id="${menu}">
					      		${menu}
						    </button>
				  		</c:forEach>
					</div>
				</div>
				<div class="option-wrapper">
					<label class="option-title">소분류</label>
					<div class="option-box" id="child-category">대분류를 선택해주세요</div>
				</div>
			</div>
			<div class="input-box">
				<div class="image-box">
					<p class="option-title">대표 이미지</p>
					<div class="image-area">
						<img src="/public/images/Image.png" class="default_image"/>
					</div>
					<div class="image-button-wrapper">
						<input type="file" name="imageFile" accept="image/*" style="display:none;" id="fileInput" />
						<input type="button" id="upload-button" class="image-button" value="업로드하기"/>
            <input type="button" class="image-button" value="삭제하기" onclick="deleteImage()" />
					</div>
				</div>
	      <div class="flex-column-wrapper">
	        <div class="input-line">
	          <div class="flex-column">
	            <label class="option-title" for="menu_name">메뉴 이름</label>
	            <input id="menu_name" class="input" name="menu_name" type="text" placeholder="메뉴를 입력해주세요.">       
	          </div>
	          <div class="flex-column">
	            <label class="option-title" for="menu_price">메뉴 가격</label>
	            <input id="menu_price" class="input" name="menu_price" type="number" placeholder="ex) 5000">       
	          </div>
	        </div>
	        <div class="flex-column">
	          <label class="option-title" for="description">메뉴 설명</label>
	          <input id="description" class="input" name="description" type="text" placeholder="40자 이내로 메뉴설명을 입력해주세요">       
	        </div>
	        <div class="flex-column">
	          <label class="option-title" for="icaable">아이스 ONLY</label>
	          <div class="radio-box">
		        <div class="radio-wrapper">
		            <input name="iceable" type="radio" value="true" id="ice_only">
		            <label class="option-title" for="ice_only">아이스만 가능</label>
		        </div>
		        <div class="radio-wrapper">
		            <input name="iceable" type="radio" value="false" id="hot_available" checked>
		            <label class="option-title" for="hot_available">핫 메뉴도 가능</label>
		        </div>
	          </div>
	         </div>
	      </div>
			</div>
		</div>
		<div class="button-wrapper">
			<button class="button" name="insert">등록 취소</button>
			<button class="button pink" name="cancel">등록 하기</button>
		</div>
	</form>
</util:layout>
<util:modal />

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
