<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ���� ȭ��</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
</head>
<body>
<form action="delete.do" method="post" name = "f">
<input type = "hidden" name = "board_num" value = "${b.board_num}">
<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
	<table>
		<caption>�Խñ� ���� ȭ��</caption>
		<tr>
			<td colspan = "2">
				<a href = "javascript:document.f.submit()">[�Խù� ����]</a>
				<a href = "javascript:history.go(-1)">[�ڷΰ���]</a>
			</td>
		</tr>
	</table>
</form>

</body>
</html>