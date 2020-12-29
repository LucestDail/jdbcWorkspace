<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!-- movie write form -->
<core:if test = "${sessionScope.board_type == 0}">
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
		if(f.board_subject.value == ""){
			alert("제목을 입력하세요");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_d.focus();
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
	<input type = "hidden" name = "movie_id" value = "1">
	<input type = "hidden" name = "movie_subject" value = "1">
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
			<td>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		
		<tr>
			<td colspan = "2">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">공지 등록
				</core:if>
				<a href = "javascript:inputcheck()">[게시물 등록]</a>
				<input type = "submit" value = "게시물 등록"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
</core:if>



<!--  theater write form -->
<core:if test = "${sessionScope.board_type == 1}">
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
		if(f.board_subject.value == ""){
			alert("제목을 입력하세요");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_d.focus();
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
	<input type = "hidden" name = "something" value = "0">
	<table class="w3-table-all">
		<caption>영화세상 글쓰기</caption>
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
			<th>
				첨부파일
			</th>
			<td>
				<input type = "file" name = "board_attached_file">
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
</core:if>



<!--  information write form -->
<core:if test = "${sessionScope.board_type == 2}">
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
		if(f.board_subject.value == ""){
			alert("제목을 입력하세요");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_d.focus();
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
		<caption>정보 글쓰기</caption>
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
</core:if>



<!--  give write form -->
<core:if test = "${sessionScope.board_type == 3}">
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
		if(f.board_subject.value == ""){
			alert("제목을 입력하세요");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_d.focus();
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
	<input type = "hidden" name = "give_state" value = "0">
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
</core:if>



<!--  activity write form -->
<core:if test = "${sessionScope.board_type == 4}">
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
		if(f.board_subject.value == ""){
			alert("제목을 입력하세요");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("점수항목을 비울 수는 없습니다!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("하나의 항목 점수는 25점을 넘길 수 없습니다!!!");
			f.score_category_d.focus();
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
	<input type = "hidden" name = "activity_able" value = "0">
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
</core:if>