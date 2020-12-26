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
<title>�Խù� �� ����</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
</head>
<body>
	<table>
		<tr>
			<th>�۾���</th>
			<td>${infoBoard.member_id}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.board_subject}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.board_content}</td>
		</tr>
		<tr>
			<th>÷������</th>
				<core:if test = "${empty infoBoard.board_attached_file}">
					<td><a href="#">÷������ ����</a></td>
				</core:if>
				<core:if test = "${!empty infoBoard.board_attached_file}">
					<td><a href="file/${infoBoard.board_attached_file}">${infoBoard.board_attached_file}</a></td>
				</core:if>
		</tr>
		<tr>
			<td colspan = "2">
				<a href = "updateForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[����]</a>
				<a href = "deleteForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[����]</a>
				<a href = "list.do?board_type=${sessionScope.board_type}">[���]</a>
			</td>
		</tr>
	</table>
</body>
</html>