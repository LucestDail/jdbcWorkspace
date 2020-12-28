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
<script type = "text/javascript">
function inputcheck(f){
	if(f.comment_content.value == ''){
		alert("댓글내용을 입력하세요");
		f.comment_content.focus();
		return false;
	}
	return true;
}
</script>
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
		<!--  comment list start -->
		
		<core:forEach var="listComment" items="${listComment}">
		<tr>
			<td style = "text-align : left">
				${listComment.member_id}
			</td>
			
			<td>${listComment.comment_content}</td>
			
			<fmt:formatDate var = "rdate" value="${listComment.comment_regdate}" pattern = "yyyy-MM-dd"/>
			<core:if test = "${today == rdate}">
				<!-- 오늘일 경우 -->
				<td>
				<fmt:formatDate value = "${listComment.comment_regdate}" pattern = "HH:mm:ss"/>
				</td>
			</core:if>
			<core:if test = "${today != rdate}">
				<!--  오늘이 아닌 경우 -->
				<td>
				<fmt:formatDate value = "${listComment.comment_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
				</td>
			</core:if>
			<core:if test = "${listComment.member_id == sessionScope.login}">
				<!--  오늘이 아닌 경우 -->
				<td>
					<a href = "deleteCommentForm.do?comment_num=${listComment.comment_num}">댓글 삭제</a>
					<a href = "updateCommentForm.do?comment_num=${listComment.comment_num}&&comment_content=${listComment.comment_content}">댓글 수정</a>
				</td>
			</core:if>
		</tr>
		</core:forEach>
		
		<!--  comment list end -->
		<tr>
			<td>
				<form action="${path}/movie/board/commentwrite.do" method="post" name="f" onsubmit="return inputcheck(this)">
					<input type = "hidden" name = "board_num" value = "${infoBoard.board_num}">
					<input type = "hidden" name = "member_id" value = "${sessionScope.login}">
					<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
					<input type = "text" name = "comment_content" onfocus="this.value=''" value = "댓글을 입력하세요" >
					<input type = "submit" value = "댓글 작성">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>