<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/order/menu.css" />
  <title>JavaPresso</title>

  <link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
  <link href="gmarket-sans.css" rel="stylesheet"> 
  
</head>
<body>
  <div class="container">
    <aside class="sidebar">
      <img src="${pageContext.request.contextPath}/public/images/logo.png" alt="JavaPresso" class="sidebar_logo" />

      <nav class="sidebar_menu">
        <button class="sidebar_item is-active" id="menuboard" onclick="menuboard()">메뉴판</button>
        <button class="sidebar_item" id="order"    onclick="order()"   >주문하기</button>
        <button class="sidebar_item" id="points"   onclick="points()"  >포인트 확인</button>
        <button class="sidebar_item" id="setting"  onclick="setting()" >관리자모드</button>
      </nav>
    </aside>

    <div class="content">

        <header class="content_header">
                <img src="${pageContext.request.contextPath}/public/images/menuboardimg.png"  class="content_logo" alt="메뉴판이미지">
        </header>

            <!-- 메뉴 리스트 -->
            <section class="content_categories">
            <div>
		<h2>메뉴판 페이지</h2>
		<table border="1">
			<tr>
				<th>parentName</th>
				<th>categoryName</th>
				<th>menuName</th>
				<th>price</th>
				<th>description</th>
				<th>isSoldout</th>
				<th>iceable</th>
			</tr>
			<c:forEach var="menu" items="${menuList}">
				<tr>
					<td>${menu.parentName}</td>
					<td>${menu.categoryName}</td>
					<td>${menu.menuName}</td>
					<td>${menu.price}</td>
					<td>${menu.description}</td>
					<td>${menu.isSoldout}</td>
					<td>${menu.iceable}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
<!--             <div class="categories_col"><h2>Coffee</h2></div>
                <div class="categories_col"><h2>Tea</h2></div>
                <div class="categories_col"><h2>Cake</h2></div>
                <div class="categories_col"><h2>Bread</h2></div> -->
            </section>
    </div>
  </div>
  

	  
  <script>
    document
      .querySelectorAll('.sidebar_item')
      .forEach(btn => btn.addEventListener('click', e => {
        document.querySelectorAll('.sidebar_item').forEach(b => b.classList.remove('is-active'));
        e.target.classList.add('is-active');
      }));
  </script>
</body>
</html>
