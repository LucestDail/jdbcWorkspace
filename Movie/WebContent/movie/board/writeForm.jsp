<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href = "../../css/main.css">
<script type = "text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.name.value == ""){
			alert("�۾��̸� �Է��ϼ���...");
			f.name.focus();
			return;
		}
		if(f.pass.value == ""){
			alert("��й�ȣ�� �Է��ϼ���");
			f.pass.focus();
			return;
		}
		if(f.subject.value == ""){
			alert("������ �Է��ϼ���");
			f.subject.focus();
			return;
		}
		//if(f.content.value == ""){
		//	alert("������ �Է��ϼ���");
		//	f.content.focus();
		//	return;
		//}
		f.submit();
	}
</script>
</head>
<body>
<form action = "write.do" method = "post" enctype = "multipart/form-data" name = "f">
	<input type = "hidden" name = "boardname" value = "${param.boardname}">
	<table class="w3-table-all">
		<caption>�Խ��� �۾���</caption>
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
				<input type = "text" name = "subject">
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
				<input type = "checkbox" name = "notice" value = "1">�̱��� ������!
				<a href = "javascript:inputcheck()">[�Խù� ���]</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>