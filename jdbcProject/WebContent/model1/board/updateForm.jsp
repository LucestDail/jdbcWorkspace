<%@page import="osh.model.BoardDao"%>
<%@page import="osh.model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String num = request.getParameter("num");
	Board b = new BoardDao().selectOne(num);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 수정 화면</title>
<link rel = "stylesheet" href = "../../css/main.css">
<script>
	function file_delete(){
		document.f.file2.value = "";
		file_desc.style.display = "none";
	}
</script>
</head>
<body>
<form action="update.jsp" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "num" value = "<%=b.getNum()%>">
<input type = "hidden" name = "file2" value = "<%= b.getFile1()==null ? "" : b.getFile1()%>">
	<table>
		<caption>게시글 수정</caption>
		<tr>
			<th>
				글쓴이
			</th>
			<td>
				<input type = "text" name = "name" value = "<%=b.getName()%>">
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
				<input type = "text" name = "subject" value = "<%=b.getSubject()%>">
			</td>
		</tr>
		<tr>
			<th>
				내용
			</th>
			<td>
				<textarea rows = "15" name = "content"><%=b.getContent()%>
				</textarea>
			</td>
		</tr>
		<tr>
			<th>
				첨부파일
			</th>
			<td style = "text-align:left">
			<% if(b.getFile1() != null && (!b.getFile1().equals(""))){ %>
			<div id = "file_desc"> <%=b.getFile1() %>
			<a href = "javascript:file_delete()">[첨부파일 삭제]</a></div>
			<%} %>
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