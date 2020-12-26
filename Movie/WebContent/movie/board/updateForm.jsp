<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 수정 화면</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script>
	function file_delete(){
		document.f.file2.value = "";
		file_desc.style.display = "none";
	}
</script>
</head>
<body>
<form action="update.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "num" value = "${b.board_num}">
<input type = "hidden" name = "boardname" value = "${sessionScope.board_type}">
<input type = "hidden" name = "file2" value = "${b.board_attached_file}">
	<table class = "w3-table-all">
		<caption>게시글 수정</caption>
		<tr>
			<th>
				글쓴이
			</th>
			<td>
				<input type = "text" name = "member_id" value = "${b.member_id}">
			</td>
		</tr>
		<tr>
			<th>
				제목
			</th>
			<td>
				<input type = "text" name = "board_subject" value = "${b.board_subject}">
			</td>
		</tr>
		<tr>
			<th>
				내용
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "content1" class = "w3-input w3-border">${b.board_content}
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
				첨부파일
			</th>
			<td style = "text-align:left">
			<core:if test = "${!empty b.board_attached_file}">
			<div id = "file_desc">${b.board_attached_file}
			<a href = "javascript:file_delete()">[첨부파일 삭제]</a></div>
			</core:if>
				<input type = "file" name = "file1">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<a href = "javascript:document.f.submit()">[게시물 수정]</a>
				<a href = "javascript:history.go(-1)">[뒤로가기]</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>