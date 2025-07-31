<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/index.css" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>빠른 행복의 시작 JAVAPRESSO</title>
</head>
<body>
<div class="index-container">
    <div class="section-area">
        <!-- 왼쪽 섹션 -->
        <div class="index-left">
            <div class="logo-area">
                <img src="${pageContext.request.contextPath}/images/logo.png"
                     alt="<fmt:message key='index.LogoAlt' />"
                     class="index-logo">
            </div>
            <div class="left-image-area">
                <img src="${pageContext.request.contextPath}/images/logo2.png"
                     alt="<fmt:message key='index.LeftImageAlt' />"
                     class="left-image">
            </div>
        </div>
        <div class="index-right">
            <div class="character-area">
                <img src="${pageContext.request.contextPath}/images/logo3.png"
                     alt="<fmt:message key='index.CharacterAlt' />"
                     class="character-image">
            </div>
        </div>
    </div>
    <div class="touch-area blinking" onclick="handleTouch()">
        <img src="${pageContext.request.contextPath}/images/touch.png"
             alt="<fmt:message key='index.TouchAlt' />"
             class="touch-icon">
        <span class="touch-text">
            <fmt:message key="index.TouchText" />
        </span>
    </div>
</div>
    <script>
        function handleTouch() {
        	location.href = '/order/menuform';
        }

        // 터치 영역 깜빡임 효과 제어 (선택사항)
        const touchArea = document.querySelector('.touch-area');
        
        // 마우스 오버 시 깜빡임 중지
        touchArea.addEventListener('mouseenter', function() {
            this.classList.remove('blinking');
        });

        // 마우스 아웃 시 깜빡임 재시작
        touchArea.addEventListener('mouseleave', function() {
            this.classList.add('blinking');
        });
    </script>
</body>
</html>