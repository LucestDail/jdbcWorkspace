<%@page import="osh.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	MemberDao dao = new MemberDao();
	String pass = dao.pwSearch(id,email,tel);
	if(pass != null){ //id 찾았다!
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호찾아줄께영</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<table>
	<tr>
		<td>
			<%="**" + pass.substring(pass.length()-2,pass.length()) %>
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<input type = "button" value = "닫기" onclick = "self.close()">
		</td>
	</tr>
</table>
</body>
</html>
<% } else { %>
<script type="text/javascript">
	alert("정보에 맞는 password를 찾을 수 없습니다...");
	location.href = "pwForm.jsp";
</script>
<%}%>