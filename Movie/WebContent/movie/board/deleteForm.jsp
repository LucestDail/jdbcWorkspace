<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ���� ȭ��</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<form action="delete.do" method="post" name = "f">
<input type = "hidden" name = "num" value = "${b.num}">
<input type = "hidden" name = "boardname" value = "${param.boardname}">
	<table>
		<caption>�Խñ� ���� ȭ��</caption>
		<tr>
			<th>
				�Խñ� ��й�ȣ
			</th>
			<td>
				<input type = "password" name = "pass">
			</td>
		</tr>
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