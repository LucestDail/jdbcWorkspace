<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl을 이용한 간단한 연산</title>
</head>
<body>
<form method = "post" name = "f">
X:<input type = "text" name = "x" size = "5">
	<select name = "op">
		<option>+</option>
		<option>-</option>
		<option>*</option>
		<option>/</option>
	</select>
Y:<input type = "text" name = "y" size = "5">
<input type = "submit" value = "="><br>
<core:choose>
	<core:when test="${param.op == '+'}">
		<core:set var = "result" value = "${param.x + param.y }"/>
	</core:when>
	<core:when test="${param.op == '-'}">
		<core:set var = "result" value = "${param.x - param.y }"/>
	</core:when>
	<core:when test="${param.op == '*'}">
		<core:set var = "result" value = "${param.x * param.y }"/>
	</core:when>
	<core:when test="${param.op == '/'}">
		<core:set var = "result" value = "${param.x / param.y }"/>
	</core:when>
</core:choose>
<h3>${param.x} ${param.op} ${param.y } = <core:out value = "${result }"/></h3>
</form>
</body>
</html>