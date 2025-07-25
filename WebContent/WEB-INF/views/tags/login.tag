<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty userid}">
<h1>로그인 폼</h1>
<form action="/member/login.do" method="post">
	아이디: <input type="text" name="userid"><br>
	비밀번호: <input type="password" name="password"><br>
	<input type="submit" value="로그인">
	<input type="reset" value="취  소">
</form>
</c:if>
<c:if test="${not empty userid}">
  <!-- 로그인 한 사용자일 경우 -->
  <%= session.getAttribute("userid") %>님 환영합니다.<br>
  <a href="/member/logout.do">로그아웃</a>
  <a href="/member/select.do">회원정보 조회</a>
  <a href="/member/deleteform.do">회원정보 삭제</a>
</c:if>
