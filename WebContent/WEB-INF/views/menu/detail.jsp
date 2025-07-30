<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<util:layout menuList="${sideMenus}">
	<div class="header-wrapper">
		<h2>이곳은 메뉴 상세 조회 페이지입니다.</h2>
		<div class="action-buttons">
			<button type="button" class="action-btn edit-btn" onclick="enableEditMode()">수정하기</button>
			<button type="button" class="action-btn delete-btn" onclick="deleteMenu()">삭제하기</button>
			<button type="button" class="action-btn cancel-btn" style="display:none;" onclick="cancelEdit()">수정취소</button>
		</div>
	</div>
	<form id="menuUpdateForm" action="/menu/update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="menu_id" value="${targetMenu.menuName}" />
		<div class="content-box">
			<div class="flex-column-wrapper">
				<p class="option-title">카테고리 정보</p>
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
			<div class="input-box">
				<div class="image-box">
					<p class="option-title">대표 이미지</p>
					<div class="image-area">
						<img src="${targetMenu.thumbnailPath}" id="menu-image" />
					</div>
					<div class="image-button-wrapper edit-mode-only" style="display:none;">
						<input type="file" name="imageFile" accept="image/*" style="display:none;" id="fileInput" />
						<input type="button" id="upload-button" class="image-button" value="업로드하기" disabled/>
						<input type="button" class="image-button" value="삭제하기" onclick="deleteImage()" disabled/>
					</div>
				</div>
				<div class="flex-column-wrapper">
					<div class="input-line">
						<div class="flex-column">
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
	//원본 데이터 저장 (수정 취소 시 복원용)
	const originalData = {
		price: '${targetMenu.price}',
		iceable: '${targetMenu.iceable}',
		menuName: '${targetMenu.menuName}',
		description: '${targetMenu.description}',
		imagePath: '${targetMenu.thumbnailPath}'
	};
	
	// 수정 모드 활성화
	function enableEditMode() {
		// 버튼 토글
		document.querySelector('.edit-btn').style.display = 'none';
		document.querySelector('.delete-btn').style.display = 'none';
		document.querySelector('.cancel-btn').style.display = 'inline-block';
		document.querySelector('.save-btn').style.display = 'inline-block';
		
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
	
	// 메뉴 삭제
	function deleteMenu() {
		// 모달 표시
		if (confirm('정말로 이 메뉴를 삭제하시겠습니까?')) { location.href = '/menu/delete/${targetMenu.menu_id}' }
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
		document.getElementById('menu-image').src = '/public/images/Image.png';
		document.getElementById('fileInput').value = '';
	}
	
	const updateForm = document.getElementById('menuUpdateForm');
	const updateFormHandler = e => {
		e.preventDefault();
		
		const formData = new FormData(this);
		
		axios.post('/menu/update', formData, { headers: { 'Content-Type': 'multipart/form-data' }})
			.then(response => {
			    const data = response.data; // axios는 자동으로 JSON 파싱됨!
			    if (data.success) {
			        alert('메뉴가 수정되었습니다.');
			        originalData.menuName = document.getElementById('menu_name').value;
			        originalData.price = document.getElementById('menu_price').value;
			        originalData.description = document.getElementById('description').value;
			        originalData.iceable = document.getElementById('ice_only').checked;
			        cancelEdit();
			    } else {
			        alert('수정 중 오류가 발생했습니다.');
			    }
			})
			.catch(error => {
			    console.error('Error:', error);
			    alert('수정 중 오류가 발생했습니다.');
			});
	};
	updateForm.addEventListener('submit', updateFormHandler);
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>