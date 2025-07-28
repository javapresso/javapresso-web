<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/order/neworder1.css" />
<title>JavaPresso</title>

<link href="https://fonts.googleapis.com/css2?family=Itim&display=swap"
	rel="stylesheet">
<link href="gmarket-sans.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<aside class="sidebar">
			<img src="${pageContext.request.contextPath}/public/images/logo.png" alt="JavaPresso" class="sidebar_logo" />

			<nav class="sidebar_menu">
				<button class="sidebar_item" id="menuboard" onclick="menuboard()">메뉴판</button>
				<button class="sidebar_item  is-active" id="order" onclick="order()">주문하기</button>
				<button class="sidebar_item" id="points" onclick="points()">쿠폰 확인</button>
				<button class="sidebar_item" id="points" onclick="points()">주문내역 조회</button>
				<button class="sidebar_item" id="points" onclick="points()">주문 삭제</button>
			</nav>
		</aside>

		<div class="content">
			<div class="big-category">Categories</div>
			<div class="buttongroup big-category-group">
				<c:forEach var="parentCategory" items="${parentName}">
					<form method="get" action="order.do">
						<input type="hidden" name="parent" value="${parentName}" />
						<button type="submit"
							class="big-category-button ${parentName eq selectedBig ? 'active' : ''}">
							${parentName}</button>
					</form>
				</c:forEach>
			</div>

			<div class="small-category">
				<div class="buttongroup small-category-group">
					<c:forEach var="child" items="${categoryName}">
						<form method="get" action="order.do">
							<input type="hidden" name="parent" value="${selectedBig}" /> <input
								type="hidden" name="child" value="${categoryName}" />
							<button type="submit"
								class="small-category-button ${categoryName eq selectedSmall ? 'active' : ''}">
								${categoryName}</button>
						</form>
					</c:forEach>
				</div>
			</div>

			<div class="selectcategory">선택된 카테고리: ${parentName} >
				${categoryName}</div>

			<div class="menu-list">
				<c:forEach var="menu" items="${menuList}">
					<div class="menu-card">
						<div class="menu-img">이미지</div>
						<div class="menu-text">
							<div class="menu-name">${menu.menuName}</div>
							<div class="menu-price">${menu.price}원</div>
							<div class="menu-info">${menu.description}</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
	</div>

	<!-- <script>
    // 샘플 데이터 (실제로는 DB에서 받아와야 함)
    const categoriesData = {
      Drink: ['Coffee', 'Tea', 'Juice'],
      Desert: ['Cake', 'Ice Cream', 'Pie']
    };

    // 샘플 메뉴 데이터
    const menuData = {
      Drink: {
        Coffee: [
          { name: '아메리카노', price: '2500원', info: '진한 커피 맛' },
          { name: '카페라떼', price: '3000원', info: '부드러운 우유와 커피' },
        ],
        Tea: [
          { name: '녹차', price: '2000원', info: '신선한 녹차' },
          { name: '홍차', price: '2200원', info: '진한 홍차' },
        ],
        Juice: [
          { name: '오렌지 주스', price: '3500원', info: '신선한 오렌지' },
          { name: '사과 주스', price: '3300원', info: '달콤한 사과' },
        ]
      },
      Desert: {
        Cake: [
          { name: '치즈케이크', price: '4000원', info: '부드러운 치즈 맛' },
          { name: '초코케이크', price: '4200원', info: '진한 초콜릿' },
        ],
        'Ice Cream': [
          { name: '바닐라', price: '3000원', info: '고소한 바닐라' },
          { name: '초콜릿', price: '3200원', info: '진한 초콜릿' },
        ],
        Pie: [
          { name: '애플파이', price: '3500원', info: '달콤한 사과' },
          { name: '체리파이', price: '3700원', info: '상큼한 체리' },
        ]
      }
    };

    const bigCategoryButtons = document.querySelectorAll('.big-category-button');
    const smallCategoryGroup = document.querySelector('.small-category-group');
    const selectCategoryDisplay = document.querySelector('.selectcategory');
    const menuList = document.querySelector('.menu-list');

    let selectedBigCategory = 'parentName';
    let selectedSmallCategory = '';

    // 작은 카테고리 버튼 생성 및 초기화
    function updateSmallCategories(parentName) {
      smallCategoryGroup.innerHTML = '';
      const smallCats = categoriesData[parentName] || [];
      smallCats.forEach((parentCategory, i) => {
        const btn = document.createElement('button');
        btn.classList.add('small-category-button');
        btn.textContent = parentCategory;
        if (i === 0) btn.classList.add('active');
        btn.addEventListener('click', () => {
          document.querySelectorAll('.small-category-button').forEach(b => b.classList.remove('active'));
          btn.classList.add('active');
          selectedSmallCategory = parentCategory;
          updateSelectedCategoryText();
          updateMenuList(selectedBigCategory, selectedSmallCategory);
        });
        smallCategoryGroup.appendChild(btn);
      });
      selectedSmallCategory = smallCats[0] || '';
      updateSelectedCategoryText();
      updateMenuList(bigCategory, selectedSmallCategory);
    }

    // 선택된 카테고리 텍스트 업데이트
    function updateSelectedCategoryText() {
      selectCategoryDisplay.textContent = `선택된 카테고리: ${parentName} > ${categoryName}`;
    }

    // 메뉴 리스트 업데이트
    function updateMenuList(bigCat, smallCat) {
      menuList.innerHTML = '';
      if (!menuData[bigCat] || !menuData[bigCat][smallCat]) return;

      menuData[bigCat][smallCat].forEach(item => {
        const card = document.createElement('div');
        card.classList.add('menu-card');

        const imgDiv = document.createElement('div');
        imgDiv.classList.add('menu-img');
        imgDiv.textContent = '이미지';

        const textDiv = document.createElement('div');
        textDiv.classList.add('menu-text');

        const nameDiv = document.createElement('div');
        nameDiv.classList.add('menu-name');
        nameDiv.textContent = item.name;

        const priceDiv = document.createElement('div');
        priceDiv.classList.add('menu-price');
        priceDiv.textContent = item.price;

        const infoDiv = document.createElement('div');
        infoDiv.classList.add('menu-info');
        infoDiv.textContent = item.info;

        textDiv.appendChild(nameDiv);
        textDiv.appendChild(priceDiv);
        textDiv.appendChild(infoDiv);

        card.appendChild(imgDiv);
        card.appendChild(textDiv);

        menuList.appendChild(card);
      });
    }

    // 큰 카테고리 버튼 클릭 이벤트
    bigCategoryButtons.forEach(btn => {
      btn.addEventListener('click', () => {
        bigCategoryButtons.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        selectedBigCategory = btn.textContent;
        updateSmallCategories(selectedBigCategory);
      });
    });

    // 초기화
    updateSmallCategories(selectedBigCategory);
  </script> -->
</body>