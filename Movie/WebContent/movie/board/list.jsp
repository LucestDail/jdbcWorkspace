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
<title>게시물 목록 출력</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type = "text/javascript">
	function listdo(page){
		f = document.sf;
		f.pageNum.value = page;
		f.submit();
	}
</script>
</head>
<body>
<table>
	<caption>게시글 목록</caption>
		<core:if test = "${boardcount == 0}">
		<tr>
			<td colspan = "5"> 등록된 게시글이 없습니다...
			</td>
		</tr>
		</core:if>
		
		
		<core:if test = "${boardcount > 0}">
		
		
		<tr>
			<td colspan = "5" style = "text-align:right"> 글개수:${boardcount}
			</td>
		</tr>

		<!--  movie board type selected start-->
		<core:if test = "${param.board_type == 0}">
		<tr>
			<td>영화 포스터
			</td>
			<td>영화 정보
			</td>
			<td>영화 관련 상호작용
			<table>
				<tr>
					<td>
						좋아요
					</td>
				</tr>
				<tr>
					<td>
						봤어요
					</td>
				</tr>
				<tr>
					<td>
						기대되요
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<th width = "5%">글 번호</th>
			<th width = "40%"> 리뷰 제목</th>
			<th width = "10%"> 작성자</th>
			<th width = "10%">평점</th>
			<th width = "10%"> 작성일자</th>
			<th width = "10%">조회수</th>
			<th width = "10%">추천</th>
			<th width = "10%">비추천</th>	
		</tr>
		<core:forEach var="board" items="${list}">
		<tr>
			<!--  글번호 -->
			<td>${boardnum}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			<!-- 글 제목 -->
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num}&&board_type=${param.board_type}">${board.board_subject}(${board.counter})</a>
			</td>
			<!--  작성자 -->
			<td>${board.member_id}</td>
			<!--  평점 -->
			<td>${board.score_category_a + board.score_category_b + board.score_category_c + board.score_category_d}</td>
			<!--  작성일자 -->
			<fmt:formatDate var = "rdate" value="${board.board_regdate}" pattern = "yyyy-MM-dd"/>
			<core:if test = "${today == rdate}">
				<!-- 오늘일 경우 -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "HH:mm:ss"/>
				</td>
			</core:if>
			<core:if test = "${today != rdate}">
				<!--  오늘이 아닌 경우 -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
				</td>
			</core:if>
			<!--  조회수-->
			<td>${board.board_readcnt}</td>
			<!--  추천 -->
			<td>${board.recommand_count}</td>
			<!--  추천 -->
			<td>${board.not_recommand_count}</td>
		</tr>
		</core:forEach>
		</core:if>
		<!--  movie board type end -->
		
		
		
		<!--  theater board type start-->
		<core:if test = "${param.board_type == 1}">
		<tr>
			<th width = "5%">글 번호</th>
			<th width = "10%"> 지역 명칭</th>
			<th width = "10%"> 극장 명칭</th>
			<th width = "30%"> 제목</th>
			<th width = "10%"> 작성자</th>
			<th width = "5%">평점</th>
			<th width = "10%"> 작성일자</th>
			<th width = "5%">조회수</th>
			<th width = "5%">추천</th>
			<th width = "5%">비추천</th>	
		</tr>
		
		<core:forEach var="board" items="${list}">
		<tr>
			<td>${boardnum}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			
			<td>${board.area_name}</td>
			<td>${board.area_name_specific}</td>
			
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num }&&board_type=${param.board_type}">${board.board_subject}(${board.counter})</a>
			</td>
			
			<td>${board.member_id}</td>
			
			<!--  평점 -->
			<td>${board.score_category_a + board.score_category_b + board.score_category_c + board.score_category_d}</td>
			<fmt:formatDate var = "rdate" value="${board.board_regdate}" pattern = "yyyy-MM-dd"/>
			<core:if test = "${today == rdate}">
				<!-- 오늘일 경우 -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "HH:mm:ss"/>
				</td>
			</core:if>
			<core:if test = "${today != rdate}">
				<!--  오늘이 아닌 경우 -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
				</td>
			</core:if>
			<!--  조회수-->
			<td>${board.board_readcnt}</td>
			<!--  추천 -->
			<td>${board.recommand_count}</td>
			<!--  추천 -->
			<td>${board.not_recommand_count}</td>
		</tr>
		</core:forEach>
		</core:if>
		<!--  theater board type end -->
		
		
		
		<!--  information board type start-->
		<core:if test = "${param.board_type == 2}">
		<tr>
			<th width = "5%"> 번호</th>
			<th width = "5%"> 분류</th>
			<th width = "30%"> 제목</th>
			<th width = "5%"> 작성자</th>
			<th width = "20%"> 작성일자</th>
			<th width = "5%"> 조회수</th>
			<th width = "5%">추천</th>
			<th width = "5%">비추천</th>
		</tr>
		
		<core:forEach var="board" items="${list}">
		<tr>
			<td>${boardnum}</td>
			<td>${board.information_type}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num }&&board_type=${param.board_type}">${board.board_subject}(${board.counter})</a>
			</td>
			<td>${board.member_id}</td>
			<fmt:formatDate var = "rdate" value="${board.board_regdate}" pattern = "yyyy-MM-dd"/>
			<core:if test = "${today == rdate}">
				<!-- 오늘일 경우 -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "HH:mm:ss"/>
				</td>
			</core:if>
			<core:if test = "${today != rdate}">
				<!--  오늘이 아닌 경우 -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
				</td>
			</core:if>
			<td>${board.board_readcnt}</td>
						<!--  추천 -->
			<td>${board.recommand_count}</td>
			<!--  추천 -->
			<td>${board.not_recommand_count}</td>
		</tr>
		</core:forEach>
		</core:if>
		<!--  information board type end -->
		
		
		
		<!--  give board type start-->
		<core:if test = "${param.board_type == 3}">
		<tr>
			<th width = "5%"> 번호</th>
			<th width = "5%"> 분류</th>
			<th width = "30%"> 제목</th>
			<th width = "10%"> 작성자</th>
			<th width = "10%"> 작성일자</th>
			<th width = "15%"> 나눔기한</th>
			<th width = "10%"> 조회수</th>
			<th width = "5%"> 상태 </th>
			<th width = "5%">추천</th>
			<th width = "5%">비추천</th>
		</tr>
		
		<core:forEach var="board" items="${list}">
		<tr>
			<td>${boardnum}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			
			<td>${board.give_information_type}</td>
			
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num }&&board_type=${param.board_type}">${board.board_subject}(${board.counter})</a>
			</td>
			
			<td>${board.member_id}</td>
			
			<fmt:formatDate var = "rdate" value="${board.board_regdate}" pattern = "yyyy-MM-dd"/>
			<core:if test = "${today == rdate}">
				<!-- 오늘일 경우 -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "HH:mm:ss"/>
				</td>
			</core:if>
			<core:if test = "${today != rdate}">
				<!--  오늘이 아닌 경우 -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
				
				</td>
			</core:if>
			
			<td><fmt:formatDate value = "${board.date_start_date}" pattern = "yyyy-MM-dd"/> ~ <fmt:formatDate value = "${board.date_end_date}" pattern = "yyyy-MM-dd"/></td>
			
			<td>${board.board_readcnt}</td>
			
			<td>${board. give_state }</td>
						<!--  추천 -->
			<td>${board.recommand_count}</td>
			<!--  추천 -->
			<td>${board.not_recommand_count}</td>
		</tr>
		</core:forEach>
		</core:if>
		<!--  give board type end -->
		
		
		
		<!--  activity board type start-->
		<core:if test = "${param.board_type == 4}">
		활동페이지 게시판 세팅
		<tr>
			<th width = "5%"> 번호</th>
			<th width = "5%"> 지역</th>
			<th width = "5%"> 분류</th>
			<th width = "20%"> 제목</th>
			<th width = "10%"> 작성자</th>
			<th width = "10%"> 작성일자</th>
			<th width = "15%"> 활동기간</th>
			<th width = "5%"> 참여수</th>
			<th width = "5%"> 상태</th>
			<th width = "5%"> 조회수</th>
			<th width = "5%">추천</th>
			<th width = "5%">비추천</th>
		</tr>
		
		<core:forEach var="board" items="${list}">
		<tr>
			<td>${boardnum}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			
			<td>${board.area_name}</td>
			
			<td>${board.activity_type}</td>
			
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num }&&board_type=${param.board_type}">${board.board_subject}(${board.counter})</a>
			</td>
			
			<td>${board.member_id}</td>
			
			<fmt:formatDate var = "rdate" value="${board.board_regdate}" pattern = "yyyy-MM-dd"/>
			<core:if test = "${today == rdate}">
				<!-- 오늘일 경우 -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "HH:mm:ss"/>
				</td>
			</core:if>
			<core:if test = "${today != rdate}">
				<!--  오늘이 아닌 경우 -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
				</td>
			</core:if>
			
			<td><fmt:formatDate value = "${board.date_start_date}" pattern = "yyyy-MM-dd"/> ~ <fmt:formatDate value = "${board.date_end_date}" pattern = "yyyy-MM-dd"/></td>
			<td>참여인수</td>
			<td>${board.activity_able}</td>
			<td>${board.board_readcnt}</td>
						<!--  추천 -->
			<td>${board.recommand_count}</td>
			<!--  추천 -->
			<td>${board.not_recommand_count}</td>
		</tr>
		</core:forEach>
		</core:if>
		<!--  activity board type end -->
		
		<tr>
			<td colspan = "5">
				<core:if test = "${pageNum <= 1}">
					[이전]
				</core:if>
				<core:if test = "${pageNum > 1}">
					<a href = "javascript:listdo(${pageNum - 1 })">[이전]</a>
				</core:if>
				<core:forEach var = "a" begin = "${startpage}" end = "${endpage}">
					<core:if test = "${a == pageNum}">
						[${a }]
					</core:if>
					<core:if test = "${a != pageNum}">
						<a href = "javascript:listdo(${a })">[${a }]</a>
					</core:if>
				</core:forEach>
				<core:if test = "${pageNum >= maxpage}">
					[다음]
				</core:if>
				<core:if test = "${pageNum < maxpage}">
					<a href = "javascript:listdo(${pageNum + 1 })">[다음]</a>
				</core:if>
			</td>
		</tr>
		
		
		</core:if>
		<tr>
			<core:if test = "${!empty sessionScope.login}">
			<td colspan = "5" style = "text-align:right">
				<a href = "writeForm.do?board_type=${sessionScope.board_type}">[글쓰기]</a>
			</td>
			</core:if>
			<core:if test = "${empty sessionScope.login}">
			<td colspan = "5" style = "text-align:right">
				글작성은 로그인 후 가능합니다...
			</td>
			</core:if>
		</tr>
	</table>
	<form action = "list.do" method = "post" name = "sf">
		<div style = "display : flex; justify-content : center;">
			<input type = "hidden" name = "pageNum" value = "1">
			<input type = "hidden" name = "Paramfind" value = "${find}">
			<input type = "hidden" name = "Paramcolumn" value = "${column}">
			<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
				<select name = "column">
					<option value = ""> 선택하세요</option>
					<option value = "board_subject"> 제목</option>
					<option value = "member_id"> 작성자</option>
					<option value = "board_content"> 내용</option>
					<option value = "board_subject, member_id"> 제목 + 작성자</option>
					<option value = "board_subject, board_content"> 제목 + 내용</option>
					<option value = "member_id, board_content"> 작성자 + 내용</option>
					<option value = "board_subject, member_id, board_content"> 제목 + 작성자 + 내용</option>
				</select>
				<script>
					document.sf.column.value = "${param.column}";
				</script>
				<input type = "text" name = "find" value = "${param.find}" style = "width:50%;">
				<input type = "submit" value = "검색">
		</div>
	</form>
	
</body>
</html>