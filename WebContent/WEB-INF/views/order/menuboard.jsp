<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.ArrayList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<util:layout menuList="${orderList}">
	메뉴판 - 주문하기의 홈
	</util:layout>
</body>
</html>