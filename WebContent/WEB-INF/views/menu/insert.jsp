<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<util:layout menuList="${sideMenus}">
	<h2 class="title">이곳은 메뉴 추가 페이지입니다.</h2>
	<form id="menuInsertForm" action="/menu/insert" method="post" enctype="multipart/form-data">
		<div class="content-box">
			<div class="flex-column-wrapper">
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
						<img class="default_image" src="${pageContext.request.contextPath}/images/default_image.png" id="menu-image" alt="메뉴 이미지" />
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
<script>
	const parentCategories = document.getElementById("parent-category");
	const childCategories = document.getElementById("child-category");
	
	const parentHandler = event => {
	  if (event.target.tagName === "BUTTON") {
	    const childOptions = [...parentCategories.children];
	
	    childOptions.forEach(btn => {
	      if (btn === event.target) {
	        event.target.classList.add("pink");
	      } else {
	        btn.classList.remove("pink");
	      }
	    });
	
	    const parentId = event.target.dataset.id;
	
	    axios.get(`/api/menu/subcategories`, {
	    	params: { parentId: parentId }
	    }).then(res => {
	        const subcategories = res.data;
	        console.log("subcategories", subcategories);
	        childCategories.innerHTML = "";
	
	        if (subcategories.length === 0) {
	          childCategories.textContent = "선택된 하위 메뉴가 없습니다.";
	          return;
	        }
	
	        subcategories.forEach(subCategory => {
	          const btn = document.createElement("button");
	          btn.type = "button";
	          btn.className = "option";
	          btn.dataset.id = subCategory;
	          btn.textContent = subCategory;
	          childCategories.appendChild(btn);
	        });
	
	        const hiddenInput = document.createElement("input");
	        hiddenInput.type = "hidden";
	        hiddenInput.name = "selectedCategory";
	        hiddenInput.id = "selectedCategory";
	        childCategories.appendChild(hiddenInput);
	      })
	      .catch(err => {
	        console.error("하위 메뉴 로딩 실패:", err);
	        childCategories.textContent = "하위 메뉴를 불러오는데 실패했습니다.";
	      });
	  }
	};
	
	const childHandler = event => {
	  console.log("event.target", event.target);
	  console.log("event.tagName", event.target.tagName);
	  if (event.target.tagName === "BUTTON") {
	    const childOptions = [...childCategories.children];
	
	    childOptions.forEach(btn => {
	      if (event.target === btn) {
	        event.target.classList.add("pink");
	      } else {
	        btn.classList.remove("pink");
	      }
	    });
	
	    const hiddenInput = document.getElementById("selectedCategory");
	    console.log("hiddenInput", hiddenInput);
	    console.log(
	      "event.target.getAttribute",
	      event.target.getAttribute("data-id")
	    );
	
	    if (hiddenInput) {
	      console.log("eventTargetInfo", event.target);
	      hiddenInput.value = event.target.getAttribute("data-id");
	    }
	
	    console.log("선택된 카테고리:", event.target.textContent.trim());
	    console.log("선택된 ID:", event.target.getAttribute("data-id"));
	  }
	};
	
	parentCategories.addEventListener("click", parentHandler);
	childCategories.addEventListener("click", childHandler);

	const insertForm = document.getElementById("menuInsertForm");
	const insertFormHandler = e => {
	  e.preventDefault();

	  const formData = new FormData(e.target);

	  let message = "";

	  formData.forEach((value, key) => {
	    if (MENU_INPUT_NAME[key]) {
	    	message += (MENU_INPUT_NAME[key] + " : " + value + "<br>");
	    }
	  });

	  message += "입력하신 정보로 메뉴를 등록 할까요?";

	  const buttons = [
	    { name: "등록 하기", action: "submitForm", formid: "menuInsertForm" },
	    { name: "취소 하기", action: "closeModal" },
	  ];

	  showModal(message, buttons);
	};

	insertForm.addEventListener("submit", insertFormHandler);

	const MENU_INPUT_NAME = {
	  "child-category": "메뉴 분류",
	  menu_name: "메뉴 이름",
	  menu_price: "메뉴 가격",
	  description: "메뉴 설명",
	  iceable: "얼음 가능여부",
	};

	const uploadBtn = document.getElementById("upload-button");
	const fileInput = document.getElementById("fileInput");
	const imgPreview = document.querySelector(".default_image");

	uploadBtn.addEventListener("click", () => {
	  fileInput.click();
	});

	fileInput.addEventListener("change", () => {
	  const file = fileInput.files[0];
	  if (file) {
	    const reader = new FileReader();
	    reader.onload = e => {
	      imgPreview.src = e.target.result;
	    };
	    reader.readAsDataURL(file);
	  }
	});

	window.deleteImage = () => {
	  imgPreview.src = "/images/default_image.png";
	  fileInput.value = null;
	};
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
