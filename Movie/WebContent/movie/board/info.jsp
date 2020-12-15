<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
	<table>
		<tr>
			<th>�۾���</th>
			<td>${infoBoard.name }</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.subject }</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.content }</td>
		</tr>
		<tr>
			<th>÷������</th>
				<core:if test = "${empty infoBoard.file1}">
					<td><a href="#">÷������ ����</a></td>
				</core:if>
				<core:if test = "${!empty infoBoard.file1}">
					<td><a href="file/${infoBoard.file1 }">${infoBoard.file1}</a></td>
				</core:if>
		</tr>
		<tr>
			<td colspan = "2">
				<a href = "replyForm.do?num=${infoBoard.num}&&boardname=${param.boardname}">[�亯]</a>
				<a href = "updateForm.do?num=${infoBoard.num}&&boardname=${param.boardname}">[����]</a>
				<a href = "deleteForm.do?num=${infoBoard.num}&&boardname=${param.boardname}">[����]</a>
				<a href = "list.do?boardname=${param.boardname}">[���]</a>
			</td>
		</tr>
	</table>
</body>
</html>