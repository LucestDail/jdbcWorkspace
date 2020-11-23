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
<%--
enctype multipart/form-datㅁ : 파일 업로드 위해서 사용

반드시 method = "post 여야만 합니다
request 객체를 직접 사용은 불가능하며,
multipartRequest 객체를 사용해야합니다.

 --%>

<form action = "upload.jsp" method = "post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>
				올린사람
			</th>
			<td>
				<input type = "text" name = "name">
			</td>
		</tr>
		<tr>
			<th>
				제목
			</th>
			<td>
				<input type = "text" name = "title">
			</td>
		</tr>
		<tr>
			<th>
				파일
			</th>
			<td>
				<input type = "file" name = "file1">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<input type = "submit" value = "전송">
			</td>
		</tr>
	</table>
</form>
</body>
</html>