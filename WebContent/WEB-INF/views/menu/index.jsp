<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<util:layout menuList="${menuList}">
		<h2>이곳은 메뉴의 홈입니다.</h2>
		<h2>메뉴의 리스트가 표 형태로 보여집니다.</h2>
	</util:layout>
</body>
</html>