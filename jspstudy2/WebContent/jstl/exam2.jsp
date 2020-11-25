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
<input type = "submit" value = "숫자까지의 합 구하기">
</form>
<c:forEach var = "i" begin = "1" end = "${param.x}">
	<c:set var = "sum" value = "${sum + i}"/>
</c:forEach>
합계 : ${sum}<br>
<h3>if 태그를 이용하여 짝수홀수 출력하기</h3>
<c:if test = "${sum % 2 == 0}">
${sum} 는 짝수입니다.
</c:if>
<c:if test = "${sum % 2 == 1}">
${sum} 는 홀수입니다.
</c:if>
<h3>choose when 태그를 이용하여 짝수홀수 출력하기</h3>
<c:choose>
	<c:when test = "${sum % 2 == 0}">
		${sum} 는 짝수입니다.<br></c:when>
	<c:when test = "${sum % 2 == 1}">
		${sum} 는 홀수입니다.<br></c:when>
</c:choose>
</body>
</html>