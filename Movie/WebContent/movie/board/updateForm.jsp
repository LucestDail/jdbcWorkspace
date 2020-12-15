<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ���� ȭ��</title>
<link rel = "stylesheet" href = "../../css/main.css">
<script>
	function file_delete(){
		document.f.file2.value = "";
		file_desc.style.display = "none";
	}
</script>
</head>
<body>
<form action="update.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "num" value = "${b.num}">
<input type = "hidden" name = "boardname" value = "${param.boardname}">
<input type = "hidden" name = "file2" value = "${b.file1}">
	<table class = "w3-table-all">
		<caption>�Խñ� ����</caption>
		<tr>
			<th>
				�۾���
			</th>
			<td>
				<input type = "text" name = "name" value = "${b.name}">
			</td>
		</tr>
		<tr>
			<th>
				��й�ȣ
			</th>
			<td>
				<input type = "password" name = "pass">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<input type = "text" name = "subject" value = "${b.subject}">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "content" id = "content1" class = "w3-input w3-border">${b.content}
				</textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("content1", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<th>
				÷������
			</th>
			<td style = "text-align:left">
			<core:if test = "${!empty b.file1}">
			<div id = "file_desc">${b.file1}
			<a href = "javascript:file_delete()">[÷������ ����]</a></div>
			</core:if>
				<input type = "file" name = "file1">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<a href = "javascript:document.f.submit()">[�Խù� ����]</a>
				<a href = "javascript:history.go(-1)">[�ڷΰ���]</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>