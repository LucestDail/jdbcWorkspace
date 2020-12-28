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
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script type = "text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.subject.value == ""){
			alert("제목을 입력하세요");
			f.subject.focus();
			return;
		}
		f.submit();
	}
	$(function(){
		if($("#board_notice_able_checker").prop("checked")){
			$("#board_notice_able").val("1");
		}else{
			$("#board_notice_able").val("0");
		}
	})
</script>
</head>
<body>
<form action = "write.do" method = "post" enctype = "multipart/form-data" name = "f">
	<input type = "hidden" name = "board_notice_able" value = "0">
	<table class="w3-table-all">
		<caption>게시판 글쓰기</caption>
		<tr>
			<th>
				제목
			</th>
			<td>
				<input type = "text" name = "board_subject">
			</td>
		</tr>
		<tr>
			<th>
				내용
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "board_content" class = "w3-input w3-border"></textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("board_content", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<th>
				첨부파일
			</th>
			<td>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">공지 등록
				<a href = "javascript:inputcheck()">[게시물 등록]</a>
				<input type = "submit" value = "게시물 등록"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>