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
			alert("글쓴이를 입력하세요...");
			f.name.focus();
			return;
		}
		if(f.pass.value == ""){
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return;
		}
		if(f.subject.value == ""){
			alert("제목을 입력하세요");
			f.subject.focus();
			return;
		}
		//if(f.content.value == ""){
		//	alert("내용을 입력하세요");
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
		<caption>게시판 글쓰기</caption>
		<tr>
			<th>
				글쓴이
			</th>
			<td>
				<input type = "text" name = "name">
			</td>
		</tr>
		<tr>
			<th>
				비밀번호
			</th>
			<td>
				<input type = "password" name = "pass">
			</td>
		</tr>
		<tr>
			<th>
				제목
			</th>
			<td>
				<input type = "text" name = "subject">
			</td>
		</tr>
		<tr>
			<th>
				내용
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
				첨부파일
			</th>
			<td>
				<input type = "file" name = "file1">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<input type = "checkbox" name = "notice" value = "1">이글을 공지로!
				<a href = "javascript:inputcheck()">[게시물 등록]</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>