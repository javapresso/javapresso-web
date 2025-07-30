<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<util:layout menuList="${sideMenus}">
	<div class="header-wrapper">
		<h2>이곳은 메뉴 상세 조회 페이지입니다.</h2>
		<div class="action-buttons">
			<button type="button" class="action-btn edit-btn" onclick="enableEditMode()">수정하기</button>
			<form id="deleteForm" action="/menu/delete" method="post" style="display:none;">
			    <input type="hidden" name="menu_id" value="${targetMenu.menuName}" />
			</form>
			<button type="button" class="action-btn delete-btn" onclick="deleteMenu()">삭제하기</button>
			<button type="button" class="action-btn cancel-btn" style="display:none;" onclick="cancelEdit()">수정취소</button>
		</div>
	</div>
	<form id="menuUpdateForm" action="/menu/update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="menu_id" value="${targetMenu.menuName}" />
		<div class="content-box">
			<div class="flex-column-wrapper">
				<p class="option-title">카테고리 정보</p>
				<div class="view-mode-category">
					<div class="option-wrapper">
						<label class="option-title">대분류</label>
						<div class="option-box readonly-field">
							${targetMenu.parentName}
						</div>
					</div>
					<div class="option-wrapper">
						<label class="option-title">소분류</label>
						<div class="option-box readonly-field">
							${targetMenu.categoryName}
						</div>
					</div>
				</div>
				<div class="edit-mode-category" style="display:none;">
			        <div class="option-wrapper">
			            <label class="option-title">대분류</label>
			            <div class="option-box" id="parent-category">
			                <c:forEach var="menu" items="${parentMenus}">
			                    <button type="button" class="option ${menu == targetMenu.parentName ? 'pink' : ''}" 
			                            data-id="${menu}" disabled>
			                        ${menu}
			                    </button>
			                </c:forEach>
			            </div>
			        </div>
			        <div class="option-wrapper">
			            <label class="option-title">소분류</label>
			            <div class="option-box" id="child-category">
			                <!-- 초기 로딩 시 현재 선택된 부모의 자식 카테고리들을 표시 -->
			                <c:forEach var="subMenu" items="${currentSubMenus}">
			                    <button type="button" class="option ${subMenu == targetMenu.categoryName ? 'pink' : ''}" 
			                            data-id="${subMenu}" disabled>
			                        ${subMenu}
			                    </button>
			                </c:forEach>
			            </div>
			        </div>
			        <!-- 선택된 카테고리를 전송할 hidden input -->
			        <input type="hidden" name="selectedCategory" id="selectedCategory" value="${targetMenu.categoryName}" />
			    </div>
			</div>
			<div class="input-box">
				<div class="image-box">
					<p class="option-title">대표 이미지</p>
					<div class="image-area">
						<img src="${pageContext.request.contextPath}/images/${targetMenu.thumbnailPath}" id="menu-image" alt="메뉴 이미지" />
					</div>
					<div class="image-button-wrapper edit-mode-only" style="display:none;">
						<input type="hidden" name="origin_path" value="${targetMenu.thumbnailPath}" />
						<input type="file" name="imageFile" accept="image/*" style="display:none;" id="fileInput" />
						<input type="button" id="upload-button" class="image-button" value="업로드하기" disabled/>
						<input type="button" class="image-button" value="삭제하기" onclick="deleteImage()" disabled/>
					</div>
				</div>
				<div class="flex-column-wrapper">
					<div class="input-line">
						<div class="flex-column">
							<input type="hidden" name="origin_name" value="${targetMenu.menuName}" />
							<label class="option-title" for="menu_name">메뉴 이름</label>
							<input id="menu_name" class="input" name="menu_name" type="text" 
								value="${targetMenu.menuName}" disabled>       
						</div>
						<div class="flex-column">
							<label class="option-title" for="menu_price">메뉴 가격</label>
							<input id="menu_price" class="input" name="menu_price" type="number" 
								value="${targetMenu.price}" disabled>       
						</div>
					</div>
					<div class="flex-column">
						<label class="option-title" for="description">메뉴 설명</label>
						<input id="description" class="input" name="description" type="text" 
							value="${targetMenu.description}" disabled>       
					</div>
					<div class="flex-column">
						<label class="option-title">아이스 ONLY</label>
						<div class="radio-box">
							<div class="radio-wrapper">
								<input name="iceable" type="radio" value="true" id="ice_only" 
									${targetMenu.iceable == 1 ? 'checked' : ''} disabled>
								<label class="option-title" for="ice_only">아이스만 가능</label>
							</div>
							<div class="radio-wrapper">
								<input name="iceable" type="radio" value="false" id="hot_available" 
									${targetMenu.iceable == 0 ? 'checked' : ''} disabled>
								<label class="option-title" for="hot_available">핫 메뉴도 가능</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="button-wrapper">
			<button type="button" class="button" onclick="goBack()">목록으로</button>
			<button type="submit" class="button pink save-btn" style="display:none;">저장하기</button>
		</div>
	</form>
</util:layout>
<util:modal />
<script>
	const parentCategories = document.getElementById("parent-category");
	const childCategories = document.getElementById("child-category");
	const viewModeCategory = document.querySelector('.view-mode-category');
	const editModeCategory = document.querySelector('.edit-mode-category');
	//원본 데이터 저장 (수정 취소 시 복원용)
	const originalData = {
	    parentName: '${targetMenu.parentName}',
	    categoryName: '${targetMenu.categoryName}',
		menuName: '${targetMenu.menuName}',
		price: '${targetMenu.price}',
		description: '${targetMenu.description}',
		iceable: '${targetMenu.iceable}',
		imagePath: '${targetMenu.thumbnailPath}'
	};
	
	// 수정 모드 활성화
	function enableEditMode() {
		// 버튼 토글
		document.querySelector('.edit-btn').style.display = 'none';
		document.querySelector('.delete-btn').style.display = 'none';
		document.querySelector('.cancel-btn').style.display = 'inline-block';
		document.querySelector('.save-btn').style.display = 'inline-block';
		
	  	viewModeCategory.style.display = 'none';
	    editModeCategory.style.display = 'block';
		
	    document.querySelectorAll('#parent-category button').forEach(btn => {
	        btn.disabled = false;
	    });
	    document.querySelectorAll('#child-category button').forEach(btn => {
	        btn.disabled = false;
	    });
	    
		// 이미지 업로드 버튼 표시
		document.querySelector('.edit-mode-only').style.display = 'block';
		
		// 입력 필드 활성화
		document.getElementById('menu_name').disabled = false;
		document.getElementById('menu_price').disabled = false;
		document.getElementById('description').disabled = false;
		document.querySelectorAll('input[name="iceable"]').forEach(radio => {
			radio.disabled = false;
		});
		document.getElementById('upload-button').disabled = false;
		document.querySelector('.image-button[value="삭제하기"]').disabled = false;
		
		// 읽기 전용 스타일 제거
		document.querySelectorAll('.readonly-field').forEach(field => {
			field.style.backgroundColor = 'white';
		});
	}
	
	// 수정 취소
	function cancelEdit() {
		// 버튼 토글
		document.querySelector('.edit-btn').style.display = 'inline-block';
		document.querySelector('.delete-btn').style.display = 'inline-block';
		document.querySelector('.cancel-btn').style.display = 'none';
		document.querySelector('.save-btn').style.display = 'none';
		
	    // 카테고리 모드 전환
	    viewModeCategory.style.display = 'block';
	    editModeCategory.style.display = 'none';
	    restoreOriginalCategories();
		// 이미지 업로드 버튼 숨김
		document.querySelector('.edit-mode-only').style.display = 'none';
		
		// 입력 필드 비활성화 및 원본 데이터 복원
		document.getElementById('menu_name').value = originalData.menuName;
		document.getElementById('menu_name').disabled = true;
		
		document.getElementById('menu_price').value = originalData.price;
		document.getElementById('menu_price').disabled = true;
		
		document.getElementById('description').value = originalData.description;
		document.getElementById('description').disabled = true;
		
		// 라디오 버튼 복원
		if (originalData.iceable) {
			document.getElementById('ice_only').checked = true;
		} else {
			document.getElementById('hot_available').checked = true;
		}
		document.querySelectorAll('input[name="iceable"]').forEach(radio => {
			radio.disabled = true;
		});
		
		// 이미지 복원
		document.getElementById('menu-image').src = originalData.imagePath;
		
		// 읽기 전용 스타일 복원
		document.querySelectorAll('.readonly-field').forEach(field => {
			field.style.backgroundColor = '#f5f5f5';
		});
	}
	
	function restoreOriginalCategories() {
	    // 부모 카테고리 복원
	    document.querySelectorAll('#parent-category button').forEach(btn => {
	        btn.classList.remove('pink');
	        if (btn.dataset.id === originalData.parentName) {
	            btn.classList.add('pink');
	        }
	        btn.disabled = true;
	    });
	    
	    // 자식 카테고리 복원 - AJAX로 원본 부모의 자식들을 다시 로드
	    axios.get(`/api/menu/subcategories`, { 
	        params: { parentId: originalData.parentName } 
	    })
	    .then(res => {
	        const subcategories = res.data;
	        childCategories.innerHTML = "";
	        
	        subcategories.forEach(subCategory => {
	            const btn = document.createElement("button");
	            btn.type = "button";
	            btn.className = "option";
	            if (subCategory === originalData.categoryName) {
	                btn.classList.add('pink');
	            }
	            btn.dataset.id = subCategory;
	            btn.textContent = subCategory;
	            btn.disabled = true;
	            childCategories.appendChild(btn);
	        });
	    });
	}
	
	function parentHandler (event) {
	    if (event.target.tagName === "BUTTON" && !event.target.disabled) {
	        const buttons = parentCategories.querySelectorAll('button');
	        buttons.forEach(btn => {
	            btn.classList.remove('pink');
	        });
	        event.target.classList.add('pink');
	        
	        const parentId = event.target.dataset.id;
	        
	        // 자식 카테고리 로드
	        axios.get(`/api/menu/subcategories`, { 
	            params: { parentId: parentId } 
	        }).then(res => {
	            const subcategories = res.data;
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
	            
	            // hidden input 초기화
	            document.getElementById('selectedCategory').value = "";
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
	
	// 메뉴 삭제
	function deleteMenu() {
		if (confirm('정말로 이 메뉴를 삭제하시겠습니까?')) {
			document.getElementById('deleteForm').submit();
		}
	}
	
	// 목록으로 돌아가기
	function goBack() {
		window.location.href = '/menu';
	}
	
	// 이미지 업로드
	document.getElementById('upload-button').addEventListener('click', function() {
		document.getElementById('fileInput').click();
	});
	
	document.getElementById('fileInput').addEventListener('change', function(e) {
		const file = e.target.files[0];
		if (file) {
			const reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('menu-image').src = e.target.result;
			};
			reader.readAsDataURL(file);
		}
	});
	
	// 이미지 삭제
	function deleteImage() {
		document.getElementById('menu-image').src = '/images/default_image.png';
		document.getElementById('fileInput').value = '';
	}
	
	const UPDATE_MENU = {
		selectedCategory: "카테고리",
	  	menu_name : "메뉴 이름",
	  	description: "메뉴 설명",
	  	menu_price: "메뉴 가격",
	  	iceable: "아이스 가능",
	};
	
	const updateForm = document.getElementById('menuUpdateForm');
	const updateFormHandler = e => {
		e.preventDefault();
		console.log("update form 실행");
		const formData = new FormData(e.target);
		
		let message = "";

		console.log("formData", formData);
	  	formData.forEach((value, key) => {
		    if (UPDATE_MENU[key]) {
		    	console.log("UPDATE_MENU[key]", UPDATE_MENU[key]);
		    	console.log("value",value);

	      		message += (UPDATE_MENU[key] + " : " + value + "<br>");
	    	}
	  	});
		  
	  	const buttons = [
		    { name: "수정 하기", action: "submitForm", formid: "menuUpdateForm" },
		    { name: "취소 하기", action: "closeModal" },
	  	];
	  	
	  	showModal(message, buttons);
	};
	
	function submitUpdateForm() {
  		updateForm.submit(); // 진짜 제출
	}
	
	updateForm.addEventListener('submit', updateFormHandler);
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>