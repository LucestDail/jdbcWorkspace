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
		alert("�α��� �ϼ���...");
		location.href = 'loginForm.jsp';
	</script>
	<%
	}else if(!sessionId.equals("admin")){
		%>
		<script>
		alert("�����ڸ� ����� �� �ֽ��ϴ�...")
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
	<title>ȸ�� ���</title>
	<link rel = "stylesheet" href="../../css/main.css">
</head>
<body>
<table>
	<caption>ȸ�� ���</caption>
		<tr>
			<th>���̵�</th>
			<th>����</th>
			<th>�̸�</th>
			<th>����</th>
			<th>��ȭ</th>
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
			<td><%=m.getGender() == 1?"��":"��"%></td>
			<td><%=m.getTel() %></td>
			<td><a href = "updateForm.jsp?id=<%=m.getId() %>">[����]</a>
			<% if(!m.getId().equals("admin")){ %>
			<a href = "deleteForm.jsp?id=<%=m.getId()%>">[����Ż��]</a>
			<%} %>
			</td>
		</tr><%} %>
		<tr>
			<td colspan = "6">
				<input type = "button" value = "���ư���" onclick="location.href='main.jsp'">
			</td>
		</tr>
</table>
</body>
</html>
<%}%>