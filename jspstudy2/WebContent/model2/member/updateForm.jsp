<%@page import="osh.model.MemberDao"%>
<%@page import="osh.model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<link rel = "stylesheet" href="../../css/main.css">
</head>
<body>
<script type = "text/javascript">
function back(){
	history.go(-1);
}
function inputcheck(f){
	if(f.pass.value == ''){
		alert("��й�ȣ�� �Է��ϼ���");
		f.pass.focus();
		return false;	
	}
	return true;
}
function win_upload(){
	var op = "width = 500, height = 150, left = 50, top = 150";
	open("pictureForm.me","",op);
}
function win_passchg(){
	var op = "width = 500, height=250, left=50, top=150";
	open("passwordForm.me","",op);
}
</script>
<form action="update.me" name = "f" method="post" onsubmit="return inputcheck(this)">
	<input type = "hidden" name="picture" value ="${member.picture}">
	<input type = "hidden" name="kbn">
	<input type = "hidden" name = "id" value = "${param.id}">
	<table><caption>ȸ������ ����</caption>
		<tr>
			<td rowspan = "4" valign = "bottom">
				<img src = "picture/${member.picture}" width="100" height="120" id="picture"><br>
				<font size="1"><a href = "javascript:win_upload()">�������</a></font>
			</td><th>���̵�</th><td><input type = "text" name = "id" readonly value = "${member.id}"></td></tr>
			<tr><th>��й�ȣ</th><td><input type = "password" name = "pass"></td></tr>
			<tr><th>�̸�</th><td><input type = "text" name = "name" value = "${member.name}"></td></tr>
			<tr><th>����</th>
				<td>
					<input type = "radio" name = "gender" value = "1" ${member.gender==1?"checked":""}>��
					<input type = "radio" name = "gender" value = "2" ${member.gender==2?"checked":""}>��
				</td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td colspan="2"><input type = "text" name = "tel" value = "${member.tel }"></td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td colspan="2"><input type = "text" name = "email" value = "${member.email}"></td>
			</tr>
			<tr>
				<td colspan = "3">
					<input type = "submit" value = "ȸ������">
					<core:if test = "${sessionScope.login != 'admin' || param.id == 'admin' }">
						<input type = "button" value = "��й�ȣ����" onclick="win_passchg()">
					</core:if>
					<input type = "button" value = "���ư���" onclick="back()">
				</td>
			</tr>
	</table>
</form>
</body>
</html>