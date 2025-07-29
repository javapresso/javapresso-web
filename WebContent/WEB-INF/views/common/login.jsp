<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="login-container">
    <div class="left-section">
    	<img class="login-logo" src="${pageContext.request.contextPath}/public/images/logo.png" alt="Javapresso" />
        <span class="tagline">빠른 행복의 시작 자바프레소</span>
    </div>
    <div class="right-section">
        <h2 class="login-title">관리자 로그인</h2>
        <form action="login/post" method="post">
            <div class="form-group">
                <div class="form-icon"></div>
                <input class="login-input" type="text" name="username" placeholder="아이디" required>
            </div>
            <div class="form-group password">
                <div class="form-icon"></div>
                <input class="login-input" type="password" name="password" placeholder="비밀번호" required>
            </div>
            <button type="submit" class="login-button">로그인 하기</button>
        </form>
    </div>
</div>
</body>
</html>