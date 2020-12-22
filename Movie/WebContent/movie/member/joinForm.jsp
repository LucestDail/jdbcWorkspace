<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
	
<core:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<link rel = "shortcut icon" href="#">
<link rel = "icon" href = "#" type = "image/x-icon">
<script type="text/javascript">
	function win_upload(){
		var op = "width = 500, height = 500, left = 50, top = 150";
		open("pictureForm.me","",op);
	}

</script>
<style>
   #centerPosition {  
     position:absolute;
     height:800px;
     width:550px;
     margin:-150px 0px 0px -200px;
     top: 50%;
     left: 50%;
     padding: 5px;
   }

</style>
</head>
<body>
<div id = "centerPosition">
<form action="join.me" name = "f" method="post">
	<input type = "hidden" name="picture" value ="">
	<table>
		<tr>
			<td rowspan = "8" valign = "middle" align = "center">
				<img src = ${path}/resource/assets/images/profileicon.png width="100" height="120" id="picture">
				<br>
				<font size="1">
					<a href = "javascript:win_upload()" class = "normalbutton">�������</a>
				</font>
			</td>
			<th>���̵�</th>
			<td>
				<input type = "text" name = "id">
			</td>
		</tr>
		
		<tr>
			<th>��й�ȣ</th>
			<td><input type = "password" name = "pass"></td>
		</tr>
		<tr>
			<th>�г���</th>
			<td><input type = "text" name = "nickname"></td>
		</tr>
		<tr>
			<th>����</th>
			<td>
				<input type = "radio" name = "gender" value = "1" checked>��
				<input type = "radio" name = "gender" value = "2">��
			</td>
		</tr>
		<tr>
			<th>����(��)</th>
			<td><input type = "text" name = "age"></td>
		</tr>
		<tr>
			<th>�̸���</th>
			<td><input type = "text" name = "email"></td>
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
				<textarea name = "introduction" style = "width:170px; height:100px;"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "3" align = "center">
				<input type = "submit" class = "redbutton" value = "ȸ������">
				<a href = "${path}/movie/Movie/index.jsp" class = "graybutton">���</a>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>