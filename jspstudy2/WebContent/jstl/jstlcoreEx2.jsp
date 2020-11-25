<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>core 태그 : 조건문 예제(if, choose)</title>
</head>
<body>
<h3> conditional tag : if, choose</h3>
<c:if test = "${5 < 10}">
<h4>5 is smaller than 10</h4>
</c:if>
<%if (5<10){ %>
<h4>5 is smaller than 10</h4>
<%} %>
<c:if test="${6+3 != 9}">
<h4> 6+3 is not 9</h4>
</c:if>
<c:choose>
	<c:when test="${5+10 == 25}">
		<h4>5+10 is 25</h4>
	</c:when>
	<c:when test="${5+10 == 150}">
		<h4>5+10 is 150</h4>
	</c:when>
	<c:when test="${5+10 == 510}">
		<h4>5+10 is 510</h4>
	</c:when>
	<c:otherwise>
		<h4>5+10 is idk</h4>
	</c:otherwise>
</c:choose>
</body>
</html>