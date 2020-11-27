<%@page import="java.util.List"%>
<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "euc-kr">
	<title>회원 목록</title>
	<link rel = "stylesheet" href="../../css/main.css">
</head>
<body>
<table>
	<caption>회원 목록</caption>
		<tr>
			<th>아이디</th>
			<th>사진</th>
			<th>이름</th>
			<th>성별</th>
			<th>전화</th>
			<th>&nbsp;</th>
		</tr>
		<core:forEach var = "member" items = "${list}">
		<tr>
			<td>
				<a href = "info.me?id=${member.id}"> ${member.id}</a>
			</td>
			<td>
				<img src = "picture/sm_${member.picture}" width="20" height="30">
			</td>
			<td>${member.name }</td>
			<td>${member.gender==1?"남":"여"}</td>
			<td>${member.tel }</td>
			<td><a href = "updateForm.me?id=${member.id}">[수정]</a>
			<core:if test = "${member.id != 'admin'}">
			<a href = "deleteForm.me?id=${member.id}">[강제탈퇴]</a>
			</core:if>
			</td>
		</tr>
		</core:forEach>
		<tr>
			<td colspan = "6">
				<input type = "button" value = "돌아가기" onclick="location.href='main.me'">
			</td>
		</tr>
</table>
</body>
</html>