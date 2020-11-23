<%@page import="java.util.List"%>
<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String sessionId = (String)session.getAttribute("login");
	String parameterId = request.getParameter("id");
	if(sessionId == null){%>
	<script>
		alert("로그인 하세용...");
		location.href = 'loginForm.jsp';
	</script>
	<%
	}else if(!sessionId.equals("admin")){
		%>
		<script>
		alert("관리자만 사용할 수 있습니다...")
		location.href = "main.jsp";
		</script>
		<%
	} else{
		List<Member> list = new MemberDao().list();
		%>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "euc-kr">
	<title>회원 목록</title>
	<link rel = "stylesheet" href="../../css/main.css">
</head>
<body>
<table>
	<caption>회원 목록</caption>
		<tr>
			<th>아이디</th>
			<th>사진</th>
			<th>이름</th>
			<th>성별</th>
			<th>전화</th>
			<th>&nbsp;</th>
		</tr>
		<% for(Member m : list){%>
		<tr>
			<td>
				<a href = "info.jsp?id=<%=m.getId()%>"> <%=m.getId()%></a>
			</td>
			<td>
				<img src = "picture/sm_<%=m.getPicture()%>" width="20" height="30">
			</td>
			<td><%=m.getName()%></td>
			<td><%=m.getGender() == 1?"남":"여"%></td>
			<td><%=m.getTel() %></td>
			<td><a href = "updateForm.jsp?id=<%=m.getId() %>">[수정]</a>
			<% if(!m.getId().equals("admin")){ %>
			<a href = "deleteForm.jsp?id=<%=m.getId()%>">[강제탈퇴]</a>
			<%} %>
			</td>
		</tr><%} %>
		<tr>
			<td colspan = "6">
				<input type = "button" value = "돌아가기" onclick="location.href='main.jsp'">
			</td>
		</tr>
</table>
</body>
</html>
<%}%>