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
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script>
	function file_delete(){
		document.f.board_attached_file_temp.value = "";
		file_desc.style.display = "none";
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
<!-- movie update form -->
<core:if test = "${sessionScope.board_type == 0}">
<form action="update.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "board_num" value = "${b.board_num}">
<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
<input type = "hidden" name = "board_attached_file_temp" value = "${b.board_attached_file}">
<input type = "hidden" name = "board_notice_able" value = "0">
	<table class = "w3-table-all">
	<!--  movie info -->
	
		<caption>게시글 수정</caption>
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
			<td colspan = "2">
			배우 점수 : <input type = "text" name = "score_category_a" style = "width:30px">
			내용 점수 : <input type = "text" name = "score_category_b" style = "width:30px">
			영상 점수 : <input type = "text" name = "score_category_c" style = "width:30px">
			기타 점수 : <input type = "text" name = "score_category_d" style = "width:30px">
			</td>
		</tr>
		<tr>
			<th>
				첨부파일
			</th>
			<td style = "text-align:left">
			<core:if test = "${!empty b.board_attached_file}">
			<div id = "file_desc">${b.board_attached_file}
			<a href = "javascript:file_delete()">[첨부파일 삭제]</a></div>
			</core:if>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">공지 등록
				</core:if>
				<a href = "javascript:document.f.submit()">[게시물 수정]</a>
				<a href = "javascript:history.go(-1)">[뒤로가기]</a>
			</td>
		</tr>
	</table>
</form>
</core:if>









<!-- theater update form -->
<core:if test = "${sessionScope.board_type == 1}">
<form action="update.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "board_num" value = "${b.board_num}">
<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
<input type = "hidden" name = "board_attached_file_temp" value = "${b.board_attached_file}">
<input type = "hidden" name = "board_notice_able" value = "0">
	<table class = "w3-table-all">
	<!--  movie info -->
	
		<caption>게시글 수정</caption>
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
			<td>
				지도 표시
			</td>
			<td>
				지도
				<input type = "hidden" name = "area_xpoint" value = "0">
				<input type = "hidden" name = "area_ypoint" value = "0">
			</td>
		</tr>
		<tr>
			<td>
				지역 명칭 : 
			<select name="area_name">
                <option  value="전체보기">전체보기</option>
                <option  value="서울/경기">서울/경기</option>
                <option  value="인천/부천">인천/부천</option>
                <option  value="춘천/강원">춘천/강원</option>
                <option  value="부산/울산/경남">부산/울산/경남</option>
                <option  value="대구/경북">대구/경북</option>
                <option  value="전주/전북">전주/전북</option>
                <option  value="광주/전남">광주/전남</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="대전/충남">대전/충남</option>
                <option  value="제주">제주</option>
            </select>
			</td>
			<td>
				극장 명칭 : <input type = "text" name = "area_name_specific">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
			접객 점수 : <input type = "text" name = "score_category_a" style = "width:30px">
			환경 점수 : <input type = "text" name = "score_category_b" style = "width:30px">
			먹거리 점수 : <input type = "text" name = "score_category_c" style = "width:30px">
			기타 점수 : <input type = "text" name = "score_category_d" style = "width:30px">
			</td>
		</tr>
		<tr>
			<th>
				첨부파일
			</th>
			<td style = "text-align:left">
			<core:if test = "${!empty b.board_attached_file}">
			<div id = "file_desc">${b.board_attached_file}
			<a href = "javascript:file_delete()">[첨부파일 삭제]</a></div>
			</core:if>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">공지 등록
				</core:if>
				<a href = "javascript:document.f.submit()">[게시물 수정]</a>
				<a href = "javascript:history.go(-1)">[뒤로가기]</a>
			</td>
		</tr>
	</table>
</form>
</core:if>









<!-- information update form -->
<core:if test = "${sessionScope.board_type == 2}">
<form action="update.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "board_num" value = "${b.board_num}">
<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
<input type = "hidden" name = "board_attached_file_temp" value = "${b.board_attached_file}">
<input type = "hidden" name = "board_notice_able" value = "0">
	<table class = "w3-table-all">
	<!--  movie info -->
	
		<caption>게시글 수정</caption>
		<tr>
			<td>
				정보 종류
			</td>
			<td>
				<select name="information_type">
                <option  value="0">일반정보</option>
                <option  value="1">이벤트</option>
                <option  value="2">시사회</option>
                <option  value="3">기타</option>
            </select>
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
			<td>
				지도 표시
			</td>
			<td>
				지도
				<input type = "hidden" name = "area_xpoint" value = "0">
				<input type = "hidden" name = "area_ypoint" value = "0">
			</td>
		</tr>
		<tr>
			<td>
				지역 명칭 : 
			<select name="area_name">
                <option  value="전체보기">전체보기</option>
                <option  value="서울/경기">서울/경기</option>
                <option  value="인천/부천">인천/부천</option>
                <option  value="춘천/강원">춘천/강원</option>
                <option  value="부산/울산/경남">부산/울산/경남</option>
                <option  value="대구/경북">대구/경북</option>
                <option  value="전주/전북">전주/전북</option>
                <option  value="광주/전남">광주/전남</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="대전/충남">대전/충남</option>
                <option  value="제주">제주</option>
            </select>
			</td>
			<td>
				이벤트 지역 상세 : <input type = "text" name = "area_name_specific">
			</td>
		</tr>
		<tr>
			<th>
				첨부파일
			</th>
			<td style = "text-align:left">
			<core:if test = "${!empty b.board_attached_file}">
			<div id = "file_desc">${b.board_attached_file}
			<a href = "javascript:file_delete()">[첨부파일 삭제]</a></div>
			</core:if>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">공지 등록
				</core:if>
				<a href = "javascript:document.f.submit()">[게시물 수정]</a>
				<a href = "javascript:history.go(-1)">[뒤로가기]</a>
			</td>
		</tr>
	</table>
</form>
</core:if>









<!-- give update form -->
<core:if test = "${sessionScope.board_type == 3}">
<form action="update.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "board_num" value = "${b.board_num}">
<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
<input type = "hidden" name = "board_attached_file_temp" value = "${b.board_attached_file}">
<input type = "hidden" name = "board_notice_able" value = "0">
	<table class = "w3-table-all">
	<!--  movie info -->
	
		<caption>게시글 수정</caption>
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
			<td>
				지역 명칭 : 
			<select name="area_name">
                <option  value="전체보기">전체보기</option>
                <option  value="서울/경기">서울/경기</option>
                <option  value="인천/부천">인천/부천</option>
                <option  value="춘천/강원">춘천/강원</option>
                <option  value="부산/울산/경남">부산/울산/경남</option>
                <option  value="대구/경북">대구/경북</option>
                <option  value="전주/전북">전주/전북</option>
                <option  value="광주/전남">광주/전남</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="대전/충남">대전/충남</option>
                <option  value="제주">제주</option>
            </select>
			</td>
			<td>
				나눔 종류 : <select name="give_type">
                <option  value="0">영화 티켓</option>
                <option  value="1">굿즈</option>
                <option  value="2">기념품</option>
                <option  value="3">기타</option>
            </select>
			</td>
		</tr>
		<tr>
			<td>
				나눔 시작 : <input type="date" id="date_start_date" name="date_start_date" value="2020-01-01">
			</td>
			<td>
				나눔 종료 : <input type="date" id="date_end_date" name="date_end_date" value="2020-01-01">
			</td>
		</tr>
		<tr>
			<th>
				첨부파일
			</th>
			<td style = "text-align:left">
			<core:if test = "${!empty b.board_attached_file}">
			<div id = "file_desc">${b.board_attached_file}
			<a href = "javascript:file_delete()">[첨부파일 삭제]</a></div>
			</core:if>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">공지 등록
				</core:if>
				<a href = "javascript:document.f.submit()">[게시물 수정]</a>
				<a href = "javascript:history.go(-1)">[뒤로가기]</a>
			</td>
		</tr>
	</table>
</form>
</core:if>









<!-- activity update form -->
<core:if test = "${sessionScope.board_type == 4}">
<form action="update.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "board_num" value = "${b.board_num}">
<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
<input type = "hidden" name = "board_attached_file_temp" value = "${b.board_attached_file}">
<input type = "hidden" name = "board_notice_able" value = "0">
	<table class = "w3-table-all">
	<!--  movie info -->
	
		<caption>게시글 수정</caption>
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
			<td>
				지역 명칭 : 
			<select name="area_name">
                <option  value="전체보기">전체보기</option>
                <option  value="서울/경기">서울/경기</option>
                <option  value="인천/부천">인천/부천</option>
                <option  value="춘천/강원">춘천/강원</option>
                <option  value="부산/울산/경남">부산/울산/경남</option>
                <option  value="대구/경북">대구/경북</option>
                <option  value="전주/전북">전주/전북</option>
                <option  value="광주/전남">광주/전남</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="청주/충북">청주/충북</option>
                <option  value="대전/충남">대전/충남</option>
                <option  value="제주">제주</option>
            </select>
			</td>
			<td>
				활동 종류 : <input type = "text" name = "activity_type">
			</td>
		</tr>
		<tr>
			<td>
				활동 시작 : <input type="date" id="date_start_date" name="date_start_date" value="2020-01-01">
			</td>
			<td>
				활동 종료 : <input type="date" id="date_end_date" name="date_end_date" value="2020-01-01">
			</td>
		</tr>
		<tr>
			<th>
				첨부파일
			</th>
			<td style = "text-align:left">
			<core:if test = "${!empty b.board_attached_file}">
			<div id = "file_desc">${b.board_attached_file}
			<a href = "javascript:file_delete()">[첨부파일 삭제]</a></div>
			</core:if>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">공지 등록
				</core:if>
				<a href = "javascript:document.f.submit()">[게시물 수정]</a>
				<a href = "javascript:history.go(-1)">[뒤로가기]</a>
			</td>
		</tr>
	</table>
</form>
</core:if>
</body>
</html>