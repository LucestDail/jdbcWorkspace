<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 삭제 화면</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<form action="delete.do" method="post" name = "f">
<input type = "hidden" name = "num" value = "${b.num}">
<input type = "hidden" name = "boardname" value = "${param.boardname}">
	<table>
		<caption>게시글 삭제 화면</caption>
		<tr>
			<th>
				게시글 비밀번호
			</th>
			<td>
				<input type = "password" name = "pass">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<a href = "javascript:document.f.submit()">[게시물 삭제]</a>
				<a href = "javascript:history.go(-1)">[뒤로가기]</a>
			</td>
		</tr>
	</table>
</form>

</body>
</html>