<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login Page</title>
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
</head>
<body>
<div id = "centerPosition">
<form action="${path}/movie/member/login.me" method="post" name="f" onsubmit="return inputcheck(this)">
	<table class = "table" style = "text-align:center">
		<tr>
			<td align = "center" colspan = "4"><input type="text" name="id" onfocus="this.value=''" value = "���̵� �Է��ϼ���" class = "form-control"></td>
		</tr>
		<tr>
			<td align = "center" colspan = "4"><input type="password" name="password" onfocus="this.value=''" value = "��й�ȣ�� �Է��ϼ���" class="form-control"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" class="normalbutton" value="��  ��  ��" style = "width:100%;">
			</td>
			<td>
				<input type="button" class="redbutton" value="ȸ������" style = "width:100%;" onclick="location.href = '${path}/movie/member/joinForm.me'">
			</td>
			<td>
				<input type="button" class="normalbutton" value="���̵�ã��" style = "width:100%;" onclick="win_open('idForm')">
			</td>
			<td>
				<input type="button" class="normalbutton" value="��й�ȣã��" style = "width:100%;" onclick="win_open('pwForm')">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>