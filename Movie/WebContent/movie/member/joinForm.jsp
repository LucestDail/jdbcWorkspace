<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<core:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<link rel = "shortcut icon" href="#">
<link rel = "icon" href = "#" type = "image/x-icon">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script type="text/javascript">
	function win_upload(){
		var op = "width = 500, height = 500, left = 50, top = 150";
		open("pictureForm.me","",op);
	}
$(function(){
	
	if($("#emailcheck").prop("checked")){
		$("#emailreceive").val("1");
	}else{
		$("#emailreceive").val("0");
	}
	
	$("#idcheck").click(function(){
		var param = {id:$("#id").val()};
		$.ajax({
			url : "idcheck.jsp",
			type : "POST",
			data : param,
			success : function(data){
				console.log(data);
				$("#idchecker").html(data);
				if($("h1").is(".find")){
					$("#id").val("");
					alert("�ߺ��Ǵ� ���̵� �ֽ��ϴ�!");
				}else{
					alert($("#id").val() + " ��� �����մϴ�!");
					$("#idcheckconfirm").val("1");
					$("#id").attr("readonly",true);
				}
			},
			error : function(e){
				console.log(e);
				alert("���� ���� : " + e.status);
			}
		})
	})
})

</script>
</head>
<body>
<div id = "centerPosition">
<form action="join.me" name = "f" method="post">
	<input type = "hidden" name="picture" value ="">
	<input type = "hidden" id = "idcheckconfirm" value = "0">
	<input type = "hidden" name = "emailreceive" id = "emailreceive" value = "0">
	<div id = "idchecker"></div>
	<table class = "table table-bordered">
		<tr>
			<td rowspan = "8" valign = "middle" align = "center">
				<img src = ${path}/resource/assets/images/profileicon.png width="100" height="120" id="picture">
				<br>
				<font size="1">
					<a href = "javascript:win_upload()" class = "normalbutton">�������</a>
				</font>
			</td>
			<th>���̵�</th>
			<td align = "center">
				<input type = "text" name = "id" id = "id" class="form-control"><br>
				<input type = "button" id = "idcheck" value = "���̵� �ߺ� üũ" class = "normalbutton">
			</td>
		</tr>
		
		<tr>
			<th>��й�ȣ</th>
			<td><input type = "password" name = "password" class="form-control"></td>
		</tr>
		<tr>
			<th>�г���</th>
			<td>
				<input type = "text" name = "nickname" id = "nickname" class="form-control">
			</td>
		</tr>
		<tr>
			<th>����</th>
			<td align = "center">
				<input type = "radio" name = "gender" value = "1" checked>��
				<input type = "radio" name = "gender" value = "2">��
			</td>
		</tr>
		<tr>
			<th>����(��)</th>
			<td><input type = "text" name = "age" class="form-control"></td>
		</tr>
		<tr>
			<th>�̸���</th>
			<td align = "center">
			<input type = "text" name = "email" class="form-control"><br>
			�̸��� ������ ������ �ʽ��ϴ� &nbsp;&nbsp;&nbsp;<input type = "checkbox" id = "emailcheckbox">
			</td>
		</tr>
		<tr>
			<th>��ǥ ��ȣ �帣</th>
			<td>
				<select name = "genre" class="form-control">
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
				<textarea name = "introduction" class="form-control" rows="3"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "3" align = "center">
				<input type = "submit" class = "redbutton" value = "ȸ������">
				<a href = "${path}/movie/Movie/index.jsp" class = "normalbutton">���</a>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>