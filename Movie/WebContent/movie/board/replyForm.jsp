<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- 
    1. ������ num�� �Ķ���ͷ� �޴´�.
    2. db���� num�� �Խù��� ��ȸ�Ͽ� ������ num, grp, grplevel, grpstep ������ ����
    3. �Է� ȭ�� ǥ��
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ��� ����</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<form action="reply.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "num" value = "${b.num}">
<input type = "hidden" name = "grp" value = "${b.grp}">
<input type = "hidden" name = "grplevel" value = "${b.grplevel}">
<input type = "hidden" name = "grpstep" value = "${b.grpstep}">
<input type = "hidden" name = "boardname" value = "${param.boardname}">
	<table class = "w3-table-all">
		<caption>�Խ��� ��� ���</caption>
		<tr>
			<th>
				�۾���
			</th>
			<td>
				<input type = "text" name = "name">
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
				<input type = "text" name = "subject" value = "RE:${b.subject}">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "content" id = "content1" class = "w3-input w3-border"></textarea>
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
			<td>
				<input type = "file" name = "file1">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<a href = "javascript:document.f.submit()">[�Խù� ���]</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>