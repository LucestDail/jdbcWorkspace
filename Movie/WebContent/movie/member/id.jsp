<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵�ã���ٲ���</title>
<link rel = "stylesheet" href = "../../css/main.css">
<script type = "text/javascript">
	function idsend(id){
		opener.document.f.id.value = id;
		self.close();
	}
</script>
</head>
<body>
<table>
	<tr>
		<td>
			${id}
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<input type = "button" value = "���̵�����" onclick = "idsend('${id}')">
		</td>
	</tr>
</table>
</body>
</html>