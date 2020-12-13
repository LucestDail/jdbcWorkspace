<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ����</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<form name = "f" method="post">
<input type = "hidden" name ="picture" value = "">
<table>
	<caption>ȸ�� ���� ����</caption>
	<tr>
		<td rowspan = "6">
				<img src = "picture/${member.picture}" width="200" height="300" id="picture">
		</td>
		<th> ���̵�</th>
		<td>${member.id}</td>
	</tr>
	<tr>
		<th> �̸�</th>
		<td>${member.name}</td>
	</tr>
	<tr>
		<th> ����</th>
		<td>${member.gender==1?"��":"��"}</td>
	</tr>
	<tr>
		<th> ��ȭ</th>
		<td>${member.tel}</td>
	</tr>
	<tr>
		<th> �̸���</th>
		<td>${member.email }</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href = "updateForm.me?id=${member.id}">[����]</a>
			<core:if test="${param.id != 'admin' && sessionScope.login != 'admin' }">
			<a href = "deleteForm.me?id=${member.id}">[Ż��]</a>
			</core:if>
			<a href = "main.me">[���ư���]</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>