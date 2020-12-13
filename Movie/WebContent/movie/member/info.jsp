<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 보기</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<form name = "f" method="post">
<input type = "hidden" name ="picture" value = "">
<table>
	<caption>회원 정보 보기</caption>
	<tr>
		<td rowspan = "6">
				<img src = "picture/${member.picture}" width="200" height="300" id="picture">
		</td>
		<th> 아이디</th>
		<td>${member.id}</td>
	</tr>
	<tr>
		<th> 이름</th>
		<td>${member.name}</td>
	</tr>
	<tr>
		<th> 성별</th>
		<td>${member.gender==1?"남":"여"}</td>
	</tr>
	<tr>
		<th> 전화</th>
		<td>${member.tel}</td>
	</tr>
	<tr>
		<th> 이메일</th>
		<td>${member.email }</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href = "updateForm.me?id=${member.id}">[수정]</a>
			<core:if test="${param.id != 'admin' && sessionScope.login != 'admin' }">
			<a href = "deleteForm.me?id=${member.id}">[탈퇴]</a>
			</core:if>
			<a href = "main.me">[돌아가기]</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>