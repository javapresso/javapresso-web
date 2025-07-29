<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/orderfinish.css" />
  <title>JavaPresso</title>

  <link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/public/css/gmarket-sans.css" rel="stylesheet" />
</head>
<body>
  <div class="container">
    <aside class="sidebar">
      <img src="${pageContext.request.contextPath}/public/images/logo.png" alt="JavaPresso" class="sidebar_logo" />

      <nav class="sidebar_menu">
        <button class="sidebar_item" id="menuboard" onclick="location.href='${pageContext.request.contextPath}/order/menu'">메뉴판</button>
        <button class="sidebar_item is-active" id="order" onclick="location.href='${pageContext.request.contextPath}/order/insert'">주문하기</button>
        <button class="sidebar_item" id="points" onclick="location.href='${pageContext.request.contextPath}/points'">포인트 확인</button>
        <button class="sidebar_item" id="setting" onclick="location.href='${pageContext.request.contextPath}/admin'">관리자모드</button>
      </nav>
    </aside>

    <div class="content">
      <div class="order-result">주문상태</div>

      <div class="result-card">
        <div class="result-info">감사합니다.<br/></div>
        <div class="result-info">주문이 완료되었습니다.</div>
        <div class="result-info">
          <strong>${orderId}</strong> 번호로 알려드릴게요.
        </div>
        <div class="result-info">
          픽업 완료 후 스탬프 개수 <strong>${stampCount}</strong>
        </div>
        <div class="result-info">
          현재 쿠폰 개수 <strong>${couponCount}</strong>
        </div>
      </div>

      <div class="button-group">
        <button class="check-button" onclick="location.href='${pageContext.request.contextPath}/order/menu'">확인</button>
      </div>
    </div>
  </div>

  <script>
    document.querySelectorAll('.sidebar_item').forEach(btn =>
      btn.addEventListener('click', e => {
        document.querySelectorAll('.sidebar_item').forEach(b => b.classList.remove('is-active'));
        e.target.classList.add('is-active');
      })
    );
  </script>

</body>
</html>
