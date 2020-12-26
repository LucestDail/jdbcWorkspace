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
<title>게시물 상세 보기</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
</head>
<body>
	<table>
		<tr>
			<th>글쓴이</th>
			<td>${infoBoard.member_id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${infoBoard.board_subject}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${infoBoard.board_content}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
				<core:if test = "${empty infoBoard.board_attached_file}">
					<td><a href="#">첨부파일 없음</a></td>
				</core:if>
				<core:if test = "${!empty infoBoard.board_attached_file}">
					<td><a href="file/${infoBoard.board_attached_file}">${infoBoard.board_attached_file}</a></td>
				</core:if>
		</tr>
		<tr>
			<td colspan = "2">
				<a href = "updateForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[수정]</a>
				<a href = "deleteForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[삭제]</a>
				<a href = "list.do?board_type=${sessionScope.board_type}">[목록]</a>
			</td>
		</tr>
	</table>
</body>
</html>