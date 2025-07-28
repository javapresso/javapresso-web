<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/order/orderform1.css" />
<util:layout menuList="${sideMenus}">
<div class="big-category">Categories</div>

<!-- 상위 카테고리 버튼 -->
<div class="buttongroup big-category-group">
  <c:forEach var="cat" items="${bigCategories}">
    <form method="get" action="${pageContext.request.contextPath}/order/new_menu">
      <input type="hidden" name="parent" value="${cat}" />
      <button type="submit"
        class="big-category-button ${cat eq selectedBig ? 'active' : ''}">
        ${cat}
      </button>
    </form>
  </c:forEach>
</div>

<!-- 하위 카테고리 버튼 -->
<div class="small-category">
  <div class="buttongroup small-category-group">
    <c:forEach var="cat" items="${smallCategories}">
      <form method="get" action="${pageContext.request.contextPath}/order/new_menu">
        <input type="hidden" name="parent" value="${selectedBig}" />
        <input type="hidden" name="child" value="${cat}" />
        <button type="submit"
          class="small-category-button ${cat eq selectedSmall ? 'active' : ''}">
          ${cat}
        </button>
      </form>
    </c:forEach>
  </div>
</div>

<!-- 선택된 카테고리 표시 -->
<div class="selectcategory">선택된 카테고리: ${selectedBig} &gt; ${selectedSmall}</div>

<!-- 메뉴 리스트 -->
<div class="menu-list">
<c:forEach var="menu" items="${menuList}">
  <form action="${pageContext.request.contextPath}/order/insert" method="get">
   <%--  <input type="hidden" name="menuId" value="${menu.menuId}" /> --%>
    <button type="submit" class="menu-card-button">
      <div class="menu-card">
        <div class="menu-img">이미지</div>
        <div class="menu-text">
          <div class="menu-name">${menu.menuName}</div>
          <div class="menu-price">${menu.price}원</div>
          <div class="menu-info">${menu.description}</div>
        </div>
      </div>
    </button>
  </form>
</c:forEach>

<%--   <c:forEach var="menu" items="${menuList}">
    <div class="menu-card">
      <div class="menu-img">이미지</div>
      <div class="menu-text">
        <div class="menu-name">${menu.menuName}</div>
        <div class="menu-price">${menu.price}원</div>
        <div class="menu-info">${menu.description}</div>
      </div>
    </div>
  </c:forEach> --%>
</div>

<script>

const bigCategoryButtons = document.querySelectorAll('.big-category-button');
const smallCategoryGroup = document.querySelector('.small-category-group');
const selectCategoryDisplay = document.querySelector('.selectcategory');
const menuList = document.querySelector('.menu-list');

let selectedBigCategory = 'Drink';
let selectedSmallCategory = '';

// 작은 카테고리 버튼 생성 및 초기화
function updateSmallCategories(bigCategory) {
  smallCategoryGroup.innerHTML = '';
  const smallCats = categoriesData[bigCategory] || [];
  smallCats.forEach((cat, i) => {
    const btn = document.createElement('button');
    btn.classList.add('small-category-button');
    btn.textContent = cat;
    if (i === 0) btn.classList.add('active');
    btn.addEventListener('click', () => {
      document.querySelectorAll('.small-category-button').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      selectedSmallCategory = cat;
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
  selectCategoryDisplay.textContent = `선택된 카테고리: ${selectedBigCategory} > ${selectedSmallCategory}`;
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
</script>

</util:layout>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>