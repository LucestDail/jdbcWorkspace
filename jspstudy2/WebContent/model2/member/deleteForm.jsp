<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<script>
	function inputcheck(f){
		if(f.pass.value == ""){
			alert("비밀번호를 입력하세요...");
			f.pass.focus();
			return false;
		}
		return true;
	}
</script>
<form action="delete.me" method="post" onsubmit = "return inputcheck(this)">
<input type="hidden" name="id" value="${param.id}">
<table>
	<caption>회원비밀번호 입력</caption>
	<tr>
		<th>비밀번호</th>
		<td><input type = "password" name = "pass">
	</tr>
	<tr>
		<td colspan = "2"><input type = "submit" value = "탈퇴하기"></td>
	</tr>
</table>
</form>
</body>
</html>