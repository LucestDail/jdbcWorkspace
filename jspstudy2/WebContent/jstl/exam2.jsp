<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form method = "post">
x : <input type = "text" name = "x" value = "${param.x }">
<input type = "submit" value = "���ڱ����� �� ���ϱ�">
</form>
<c:forEach var = "i" begin = "1" end = "${param.x}">
	<c:set var = "sum" value = "${sum + i}"/>
</c:forEach>
�հ� : ${sum}<br>
<h3>if �±׸� �̿��Ͽ� ¦��Ȧ�� ����ϱ�</h3>
<c:if test = "${sum % 2 == 0}">
${sum} �� ¦���Դϴ�.
</c:if>
<c:if test = "${sum % 2 == 1}">
${sum} �� Ȧ���Դϴ�.
</c:if>
<h3>choose when �±׸� �̿��Ͽ� ¦��Ȧ�� ����ϱ�</h3>
<c:choose>
	<c:when test = "${sum % 2 == 0}">
		${sum} �� ¦���Դϴ�.<br></c:when>
	<c:when test = "${sum % 2 == 1}">
		${sum} �� Ȧ���Դϴ�.<br></c:when>
</c:choose>
</body>
</html>