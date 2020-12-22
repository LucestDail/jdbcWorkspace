<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
	
<core:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<link rel = "shortcut icon" href="#">
<link rel = "icon" href = "#" type = "image/x-icon">
<script type="text/javascript">
	function win_upload(){
		var op = "width = 500, height = 500, left = 50, top = 150";
		open("pictureForm.me","",op);
	}

</script>
<style>
   #centerPosition {  
     position:absolute;
     height:800px;
     width:550px;
     margin:-150px 0px 0px -200px;
     top: 50%;
     left: 50%;
     padding: 5px;
   }

</style>
</head>
<body>
<div id = "centerPosition">
<form action="join.me" name = "f" method="post">
	<input type = "hidden" name="picture" value ="">
	<table>
		<tr>
			<td rowspan = "8" valign = "middle" align = "center">
				<img src = ${path}/resource/assets/images/profileicon.png width="100" height="120" id="picture">
				<br>
				<font size="1">
					<a href = "javascript:win_upload()" class = "normalbutton">사진등록</a>
				</font>
			</td>
			<th>아이디</th>
			<td>
				<input type = "text" name = "id">
			</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type = "password" name = "pass"></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type = "text" name = "nickname"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type = "radio" name = "gender" value = "1" checked>남
				<input type = "radio" name = "gender" value = "2">여
			</td>
		</tr>
		<tr>
			<th>나이(만)</th>
			<td><input type = "text" name = "age"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type = "text" name = "email"></td>
		</tr>
		<tr>
			<th>대표 선호 장르</th>
			<td>
				<select name = "genre">
					<option value = "horror">코미디</option>
					<option value = "crime">범죄</option>
					<option value = "thriller">스릴러</option>
					<option value = "adventure">어드벤처</option>
					<option value = "sports">스포츠</option>
					<option value = "family">가족영화</option>
					<option value = "fantasy">판타지</option>
					<option value = "action">액션</option>
					<option value = "detective">수사물</option>
					<option value = "horror">공포</option>
					<option value = "romance">로맨스</option>
					<option value = "biograpy">자서전</option>
					<option value = "history">역사</option>
					<option value = "mystery">미스테리</option>
					<option value = "musical">뮤지컬</option>
					<option value = "drama">드라마</option>
					<option value = "scifi">공상과학</option>
					<option value = "war">전쟁</option>
					<option value = "animation">애니메이션</option>
					<option value = "western">서부</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>자기소개</th>
			<td>
				<textarea name = "introduction" style = "width:170px; height:100px;"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "3" align = "center">
				<input type = "submit" class = "redbutton" value = "회원가입">
				<a href = "${path}/movie/Movie/index.jsp" class = "graybutton">취소</a>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>