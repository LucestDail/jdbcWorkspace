<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type = "text/javascript">
	function inputcheck(f){
		if(f.id.value == ''){
			alert("���̵� �Է��ϼ���");
			f.id.focus();
			return false;
		}
		if(f.id.value.length < 4){
			alert("���̵�� 4�ڸ� �̻� �Է��ϼ���");
			f.id.focus();
			return false;
		}
		if(f.pass.value == ''){
			alert("��й�ȣ�� �Է��ϼ���");
			f.pass.focus();
			return false;
		}
		return true;
	}
	function win_open(page){
		var op = "width = 500, height=350, left=50, top=150";
		open(page + ".me","",op);
	}
</script>
<style>
   #centerPosition {  
     position:absolute;
     height:100px;
     width:550px;
     margin:-150px 0px 0px -200px;
     top: 60%;
     left: 45%;
     padding: 5px;
   }

</style>
</head>
<body>
<div id = "centerPosition">
<form action = "login.me" method="post" name = "f" onsubmit = "return inputcheck(this)">
	<table>
		<tr>
			<td align = "center">
				<input type = "text" name = "id" onfocus="this.value=''" value = "���̵� �Է��ϼ���">
			</td>
			<td rowspan = "2">
				<input type = "submit" class = "normalbutton" value = "�α���">
			</td>
		</tr>
		<tr>
			<td align = "center">
				<input type = "password" name = "pass" onfocus="this.value=''" value = "��й�ȣ�� �Է��ϼ���">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<input type = "button" class = "redbutton" value = "ȸ������" onclick = "location.href = 'joinForm.me'">
				<input type = "button" class = "normalbutton" value = "���̵�ã��" onclick = "win_open('idForm')">
				<input type = "button" class = "normalbutton" value = "��й�ȣã��" onclick = "win_open('pwForm')">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>