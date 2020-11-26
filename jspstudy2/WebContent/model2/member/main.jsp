<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<%--
	1. �α��� ���� ����
	�α��� ���� : ���� ȭ��
	�α����� admin �� ���� ȸ����� ���� �߰��ϱ�!
	�α׾ƿ� ���� : �α����ϼ���. �޽��� ��� �� loginForm.jsp �� ������ �̵��ϱ�
 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<table>
	<caption>Welcome!</caption>
	<tr>
		<th>${sessionScope.login} �α��� �Ǿ����ϴ�.</th>
	</tr>
	<tr>
		<td><a href = "logout.me">�α׾ƿ�</a></td>
	</tr>
	<tr>
		<td><a href = "info.me?id=${sessionScope.login}">ȸ����������</a></td>
	</tr>
	<core:if test = "${sessionScope.login=='admin'}">
	<tr>
		<td><a href = "list.me?id=${sessionScope.login}"> ȸ����� ����</a></td>
	</tr>
	</core:if>
</table>
</body>
</html>