<%@page import="java.util.List"%>
<%@page import="osh.model.MemberDao"%>
<%@page import="osh.model.Member"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "euc-kr">
	<title>회원 목록</title>
	<link rel = "stylesheet" href="../../css/main.css">
	<script type="text/javascript">
		function allchkbox(chk){
			var allchk = chk.checked // 전체 석택 값, true, false
			//getElementsByName(name) : name 속성 값이 mailchk 인 태그들
			//input name = "mailchk"
			document.getElementsByName("mailchk").forEach(function(item,index){
				//item : name = "mailchk" 인 태그 한개
				if(allchk){ // 전체 선택 값이 true 인 경우
					item.setAttribute("checked",true);
				}else{// 전체 선택이 안된 경우(false 인 경우)
					item.removeAttribute("checked");
				}
			})
		}
	</script>
</head>
<body>
<form action = "mailform.me" method = "post" name = "f">
<table class="w3-table-all w3-border">
	<caption>회원 목록</caption>
		<tr>
			<th>아이디</th>
			<th>사진</th>
			<th>이름</th>
			<th>성별</th>
			<th>전화</th>
			<th>회원관리</th>
			<th>이메일</th>
			<th><input type = "checkbox" name = "allchk" onchange = "allchkbox(this)"></th>
		</tr>
		<core:forEach var = "member" items = "${list}">
		<tr>
			<td>
				<a href = "info.me?id=${member.id}"> ${member.id}</a>
			</td>
			<td>
				<img src = "picture/sm_${member.picture}" width="20" height="30">
			</td>
			<td>${member.name }</td>
			<td>${member.gender==1?"남":"여"}</td>
			<td>${member.tel }</td>
			<td><a href = "updateForm.me?id=${member.id}">[수정]</a>
			<core:if test = "${member.id != 'admin'}">
			<a href = "deleteForm.me?id=${member.id}">[강제탈퇴]</a>
			</core:if>
			</td>
			<td>${member.email}</td>
			<td><input type="checkbox" name="mailchk" value="${member.email}" onchange = "clickit(this)"></td>
		</tr>
		</core:forEach>
		<tr>
			<td colspan = "6" class = "w3-center">
				<input type = "button" value = "돌아가기" onclick="location.href='main.me'">
			</td>
			<td colspan = "2" class = "w3-center">
				<input type = "submit" value = "메일전송">
			</td>
		</tr>
</table>
</form>
</body>
</html>