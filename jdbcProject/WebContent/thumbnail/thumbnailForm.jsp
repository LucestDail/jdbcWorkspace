<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href = "../css/main.css">
</head>
<body>
<form action = "thumbnail.jsp" method = "post" enctype = "multipart/form-data">
<table><caption> ����� �̹��� �����</caption>
	<tr>
		<th>���� �̹���</th>
		<td>
			<input type = "file" name = "picture">
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<input type = "submit" value = "������̹�������">
		</td>
	</tr>
</table>
</form>
</body>
</html>