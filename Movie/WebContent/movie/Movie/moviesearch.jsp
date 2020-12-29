<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화 검색 페이지</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
</head>
<body>
<table>
	<caption>확인하고 싶은 영화의 제목을 입력하세요!</caption>
	<tr>
		<td>
			<input type = "text" name = "moviekeyword"><br>
			<input type = "submit" value = "영화 리뷰 보기" class = "redbutton">
			<a href = "${path}/movie/board/list.do?board_type=0&&movie_selected=" class = "normalbutton">전체 리뷰 보기</a>
		</td>
	</tr>
	<tr>
		<td>
			일단위 박스오피스 순위
		</td>
		<td>
			주단위 박스오피스 순위
		</td>
	</tr>
</table>
</body>
</html>