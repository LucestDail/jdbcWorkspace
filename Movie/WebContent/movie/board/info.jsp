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
	<!--  movie info -->
	<core:if test = "${sessionScope.board_type == 0}">
		<tr>
			<th>영화</th>
			<td>${infoBoard.movie_subject}</td>
		</tr>
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
			<td>
				배우점수 : ${infoBoard.score_category_a},
				내용점수 : ${infoBoard.score_category_b},
				영상점수 : ${infoBoard.score_category_c},
				기타점수 : ${infoBoard.score_category_d}
			</td>
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
		<core:if test = "${!empty sessionScope.login}">
		<tr>
			<td>
				<a href = "recommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">추천</a>
				<a href = "notRecommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">비추천</a>
				<a href = "alert.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">신고</a>
			</td>
		</tr>
		</core:if>
		<core:if test = "${infoBoard.member_id == sessionScope.login}">
		<tr>
			<td colspan = "2">
				<a href = "updateForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[수정]</a>
				<a href = "deleteForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[삭제]</a>
				<a href = "list.do?board_type=${sessionScope.board_type}">[목록]</a>
			</td>
		</tr>
		</core:if>
	</core:if>
	
		<!--  theater info -->
	<core:if test = "${sessionScope.board_type == 1}">

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
			<td>
				지도 표시
			</td>
			<td>
				지도
				${infoBoard.area_xpoint}, ${infoBoard.area_xpoint}
			</td>
		</tr>
		<tr>
			<td>
				지역 명칭 : 
				${infoBoard.area_name}
			</td>
			<td>
				극장명칭 : 
				${infoBoard.area_name_specific}
			</td>
		</tr>
		<tr>
			<td>
				접객점수 : ${infoBoard.score_category_a},
				환경점수 : ${infoBoard.score_category_b},
				먹거리점수 : ${infoBoard.score_category_c},
				기타점수 : ${infoBoard.score_category_d}
			</td>
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
		<core:if test = "${!empty sessionScope.login}">
		<tr>
			<td>
				<a href = "recommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">추천</a>
				<a href = "notRecommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">비추천</a>
				<a href = "alert.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">신고</a>
			</td>
		</tr>
		</core:if>
		<core:if test = "${infoBoard.member_id == sessionScope.login}">
		<tr>
			<td colspan = "2">
				<a href = "updateForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[수정]</a>
				<a href = "deleteForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[삭제]</a>
				<a href = "list.do?board_type=${sessionScope.board_type}">[목록]</a>
			</td>
		</tr>
		</core:if>
	</core:if>
	
		<!--  information info -->
	<core:if test = "${sessionScope.board_type == 2}">
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
			<td>
				지도 표시
			</td>
			<td>
				지도
				${infoBoard.area_xpoint}, ${infoBoard.area_xpoint}
			</td>
		</tr>
		<tr>
			<td>
			지역 명칭
				${infoBoard.area_name}
			</td>
			<td>
			정보 지역 상세
				${infoBoard.area_name_specific}
			</td>
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
		<core:if test = "${!empty sessionScope.login}">
		<tr>
			<td>
				<a href = "recommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">추천</a>
				<a href = "notRecommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">비추천</a>
				<a href = "alert.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">신고</a>
			</td>
		</tr>
		</core:if>
		<core:if test = "${infoBoard.member_id == sessionScope.login}">
		<tr>
			<td colspan = "2">
				<a href = "updateForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[수정]</a>
				<a href = "deleteForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[삭제]</a>
				<a href = "list.do?board_type=${sessionScope.board_type}">[목록]</a>
			</td>
		</tr>
		</core:if>
	</core:if>
	
		<!--  give info -->
	<core:if test = "${sessionScope.board_type == 3}">

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
			<td>
			지역
				${infoBoard.area_name}
			</td>
			<td>
			나눔 종류
				${infoBoard.give_type}
			</td>
		</tr>
		<tr>
			<td>
				나눔 시작 : ${infoBoard.date_start_date}
			</td>
			<td>
				나눔 종료 : ${infoBoard.date_start_date}
			</td>
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
		<core:if test = "${!empty sessionScope.login}">
		<tr>
			<td>
				<a href = "recommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">추천</a>
				<a href = "notRecommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">비추천</a>
				<a href = "alert.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">신고</a>
			</td>
		</tr>
		</core:if>
		<core:if test = "${infoBoard.member_id == sessionScope.login}">
		<tr>
			<td colspan = "2">
				<a href = "updateForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[수정]</a>
				<a href = "deleteForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[삭제]</a>
				<a href = "list.do?board_type=${sessionScope.board_type}">[목록]</a>
			</td>
		</tr>
		</core:if>
	</core:if>
	
		<!--  activity info -->
	<core:if test = "${sessionScope.board_type == 4}">

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
			<td>
			활동 지역
				${infoBoard.area_name}
			</td>
			<td>
			활동 상세
				${infoBoard.activity_type}
			</td>
		</tr>
		<tr>
			<td>
				활동 시작 : ${infoBoard.date_start_date}
			</td>
			<td>
				활동 종료 : ${infoBoard.date_start_date}
			</td>
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
		<core:if test = "${!empty sessionScope.login}">
		<tr>
			<td>
				<a href = "recommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">추천</a>
				<a href = "notRecommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">비추천</a>
				<a href = "alert.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">신고</a>
			</td>
		</tr>
		</core:if>
		<core:if test = "${infoBoard.member_id == sessionScope.login}">
		<tr>
			<td colspan = "2">
				<a href = "updateForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[수정]</a>
				<a href = "deleteForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[삭제]</a>
				<a href = "list.do?board_type=${sessionScope.board_type}">[목록]</a>
			</td>
		</tr>
		</core:if>
	</core:if>
		<!--  comment list start -->
		
		<core:forEach var="listComment" items="${listComment}">
		<tr>
			<td style = "text-align : left">
				${listComment.member_id}
			</td>
			
			<td style = "text-align : center">${listComment.comment_content}</td>
			<td style = "text-align : center">${listComment.recommand_count}</td>
			<td style = "text-align : center">${listComment.not_recommand_count }</td>
			<fmt:formatDate var = "rdate" value="${listComment.comment_regdate}" pattern = "yyyy-MM-dd"/>
			<core:if test = "${today == rdate}">
				<!-- 오늘일 경우 -->
				<td style = "text-align : center">
				<fmt:formatDate value = "${listComment.comment_regdate}" pattern = "HH:mm:ss"/>
				</td>
			</core:if>
			<core:if test = "${today != rdate}">
				<!--  오늘이 아닌 경우 -->
				<td style = "text-align : center">
				<fmt:formatDate value = "${listComment.comment_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
				</td>
			</core:if>
			<core:if test = "${listComment.member_id == sessionScope.login}">
				<!--  오늘이 아닌 경우 -->
				<td style = "text-align : center">
					<a href = "deleteCommentForm.do?comment_num=${listComment.comment_num}">댓글 삭제</a>
					<a href = "updateCommentForm.do?comment_num=${listComment.comment_num}&&comment_content=${listComment.comment_content}">댓글 수정</a>
				</td>
			</core:if>
			<core:if test = "${!empty sessionScope.login}">
				<td>
					<a href = "recommandComment.do?comment_num=${listComment.comment_num}">추천</a>
					<a href = "notRecommandComment.do?comment_num=${listComment.comment_num}">비추천</a>
					<a href = "alertComment.do?comment_num=${listComment.comment_num}">신고</a>
				</td>
			</core:if>
		</tr>
		</core:forEach>
		
		<!--  comment list end -->
		<core:if test = "${!empty sessionScope.login}">
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
		</core:if>
		<core:if test = "${empty sessionScope.login}">
			<td>
				댓글작성은 로그인 후 가능합니다...
			</td>
		</core:if>
	</table>
</body>
</html>