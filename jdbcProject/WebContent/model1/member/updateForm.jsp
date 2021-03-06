<%@page import="osh.model.MemberDao"%>
<%@page import="osh.model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href="../../css/main.css">
</head>
<body>
<script>
<%
request.setCharacterEncoding("euc-kr");
String parameterId = request.getParameter("id");
String sessionId = (String)session.getAttribute("login");
if(sessionId == null){%>
	alert("로그인 하세용...");
	location.href('loginForm.jsp');
<%
}
Member mem = new MemberDao().selectOne(parameterId);
String id = null;
String name = null;
String gender = null;
String tel = null;
String email = null;
String picture = null;
String pass = null;
Member sMem = new MemberDao().selectOne(sessionId);
String sPass = sMem.getPass();
if(mem != null){
	id = mem.getId();
	name = mem.getName();
	gender = (mem.getGender() == 1) ? "남" : "여";
	tel = mem.getTel();
	email = mem.getEmail();
	picture = mem.getPicture();
	pass = mem.getPass();
}
boolean owner = false;
if(!sessionId.equals(parameterId) && !sessionId.equals("admin")){
	%>
	alert("내 정보만 조회 가능합니다......")
	location.href = "main.jsp";
	<%
}

%>
function back(){
	history.go(-1);
}
function inputcheck(f){
	if(f.pass.value == ''){
		alert("비밀번호를 입력하세요");
		f.pass.focus();
		return false;	
	}
	return true;
}
function win_upload(){
	var op = "width = 500, height = 150, left = 50, top = 150";
	open("pictureForm.jsp","",op);
}
function win_passchg(){
	var op = "width = 500, height=250, left=50, top=150";
	open("passwordForm.jsp","",op);
}
</script>
<form action="update.jsp" name = "f" method="post" onsubmit="return inputcheck(this)">
	<input type = "hidden" name="picture" value ="<%=mem.getPicture()%>">
	<input type = "hidden" name="kbn">
	<input type = "hidden" name = "id" value = <%=parameterId%>>
	<table><caption>회원정보 수정</caption>
		<tr>
			<td rowspan = "4" valign = "bottom">
				<img src = "picture/<%= mem.getPicture()%>" width="100" height="120" id="picture"><br>
				<font size="1"><a href = "javascript:win_upload()">사진등록</a></font>
			</td><th>아이디</th><td><input type = "text" name = "id" readonly value = "<%=id %>"></td></tr>
			<tr><th>비밀번호</th><td><input type = "password" name = "pass"></td></tr>
			<tr><th>이름</th><td><input type = "text" name = "name" value = "<%=name %>"></td></tr>
			<tr><th>성별</th>
			<%
			if(gender.equals("남")){
				%>
				<td>
					<input type = "radio" name = "gender" value = "1">남
					<input type = "radio" name = "gender" value = "2" checked>여
				</td>
				<%
			}else{
				%>
				<td>
					<input type = "radio" name = "gender" value = "1" checked>남
					<input type = "radio" name = "gender" value = "2">여
				</td>
				<%
			}
			%>
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="2"><input type = "text" name = "tel" value = "<%=tel %>"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="2"><input type = "text" name = "email" value = "<%=email %>"></td>
			</tr>
			<tr>
				<td colspan = "3">
						<input type = "submit" value = "회원수정">
					<% if(sessionId.equals("admin") || !parameterId.equals("admin")){%>
						<input type = "submit" value = "비밀번호수정" onclick="win_passchg()">
					<% } %>
						<input type = "button" value = "돌아가기" onclick="back()">
				</td>
			</tr>
	</table>
</form>
</body>
</html>