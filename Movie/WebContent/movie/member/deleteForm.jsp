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
			alert("��й�ȣ�� �Է��ϼ���...");
			f.pass.focus();
			return false;
		}
		return true;
	}
</script>
<form action="delete.me" method="post" onsubmit = "return inputcheck(this)">
<input type="hidden" name="id" value="${param.id}">
<table>
	<caption>ȸ����й�ȣ �Է�</caption>
	<tr>
		<th>��й�ȣ</th>
		<td><input type = "password" name = "pass">
	</tr>
	<tr>
		<td colspan = "2"><input type = "submit" value = "Ż���ϱ�"></td>
	</tr>
</table>
</form>
</body>
</html>