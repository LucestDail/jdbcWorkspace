<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ȭ �˻� ������</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
</head>
<body>
<table>
	<caption>Ȯ���ϰ� ���� ��ȭ�� ������ �Է��ϼ���!</caption>
	<tr>
		<td>
			<input type = "text" name = "moviekeyword"><br>
			<input type = "submit" value = "��ȭ ���� ����" class = "redbutton">
			<a href = "${path}/movie/board/list.do?board_type=0&&movie_selected=" class = "normalbutton">��ü ���� ����</a>
		</td>
	</tr>
	<tr>
		<td>
			�ϴ��� �ڽ����ǽ� ����
		</td>
		<td>
			�ִ��� �ڽ����ǽ� ����
		</td>
	</tr>
</table>
</body>
</html>