<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
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
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
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
$(function(){
	if($("#emailcheck").prop("checked")){
		$("#emailreceive").val("1");
	}else{
		$("#emailreceive").val("0");
	}
})
</script>
<div id = "centerPosition">
<form action="update.me" name = "f" method="post" onsubmit="return inputcheck(this)">
	<input type = "hidden" name="picture" value ="${member.member_picture}">
	<input type = "hidden" name="kbn">
	<input type = "hidden" name = "emailreceive" id = "emailreceive" value = "0">
	<table style = "height:800px"><caption>ȸ������ ����</caption>
		<tr>
			<td rowspan = "10" valign = "middle">
				<img src = "picture/${member.member_picture}" width="100" height="120" id="picture"><br>
				<font size="1"><a href = "javascript:win_upload()" class = "normalbutton">�������</a></font>
			</td>
				<th>���̵�</th>
				<td>
					<input type = "text" name = "id" readonly value = "${member.member_id}">
				</td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td>
					<input type = "password" name = "password">
				</td>
			</tr>
			<tr>
				<th>�г���</th>
				<td>
					<input type = "text" name = "nickname" value = "${member.member_nickname}">
				</td>
			</tr>
			<tr>
				<th>����</th>
				<td>
					<input type = "radio" name = "gender" value = "1" ${member.member_gender==1?"checked":""}>��
					<input type = "radio" name = "gender" value = "2" ${member.member_gender==2?"checked":""}>��
				</td>
			</tr>
			<tr>
				<th>
					����(��)
				</th>
				<td>
					<input type = "text" name = "age" value = "${member.member_age}">
				</td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td colspan="2"><input type = "text" name = "email" value = "${member.member_email}">
				<input type = "checkbox" id = "emailcheckbox"></td>
			</tr>
			<tr>
			<th>��ǥ ��ȣ �帣</th>
			<td>
				<select name = "genre">
					<option value = "horror">�ڹ̵�</option>
					<option value = "crime">����</option>
					<option value = "thriller">������</option>
					<option value = "adventure">��庥ó</option>
					<option value = "sports">������</option>
					<option value = "family">������ȭ</option>
					<option value = "fantasy">��Ÿ��</option>
					<option value = "action">�׼�</option>
					<option value = "detective">���繰</option>
					<option value = "horror">����</option>
					<option value = "romance">�θǽ�</option>
					<option value = "biograpy">�ڼ���</option>
					<option value = "history">����</option>
					<option value = "mystery">�̽��׸�</option>
					<option value = "musical">������</option>
					<option value = "drama">���</option>
					<option value = "scifi">�������</option>
					<option value = "war">����</option>
					<option value = "animation">�ִϸ��̼�</option>
					<option value = "western">����</option>
				</select>
			</td>
			</tr>
			<tr>
			<th>�ڱ�Ұ�</th>
			<td>
				<textarea name = "introduction" style = "width:170px; height:100px;">${member.member_introduction}</textarea>
			</td>
			</tr>
			<tr>
				<td colspan = "3">
					<input type = "submit" value = "ȸ������" class = "redbutton">
					<core:if test = "${sessionScope.login != 'admin' || param.id == 'admin' }">
						<input type = "button" value = "��й�ȣ����" onclick="win_passchg()" class = "normalbutton">
					</core:if>
					<input type = "button" value = "���ư���" class = "normalbutton" onclick="back()">
				</td>
			</tr>
	</table>
</form>
</div>
</body>
</html>