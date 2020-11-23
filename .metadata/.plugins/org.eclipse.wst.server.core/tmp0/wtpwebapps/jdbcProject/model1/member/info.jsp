<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ����</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<script>
<%
	request.setCharacterEncoding("euc-kr");
	String parameterId = request.getParameter("id");
	String sessionId = (String)session.getAttribute("login");
	if(sessionId == null){%>
		alert("�α��� �ϼ���...");
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
	if(mem != null){
		id = mem.getId();
		name = mem.getName();
		gender = (mem.getGender() == 1) ? "��" : "��";
		tel = mem.getTel();
		email = mem.getEmail();
		picture = mem.getPicture();
	}
	boolean owner = false;
	if(!sessionId.equals(parameterId) && !sessionId.equals("admin")){
		%>
		alert("�� ������ ��ȸ �����մϴ�......")
		location.href = "main.jsp";
		<%
	}
%>
</script>
<form name = "f" method="post">
<input type = "hidden" name ="picture" value = "">
<table><caption>ȸ�� ���� ����</caption>
	<tr>
		<td rowspan = "6">
				<img src = "picture/<%=mem.getPicture() %>" width="200" height="300" id="picture">
		</td>
		<th> ���̵�</th>
		<td><%=id %></td>
	</tr>
	<tr>
		<th> �̸�</th>
		<td><%=name %></td>
	</tr>
	<tr>
		<th> ����</th>
		<td><%=gender %></td>
	</tr>
	<tr>
		<th> ��ȭ</th>
		<td><%=tel %></td>
	</tr>
	<tr>
		<th> �̸���</th>
		<td><%=email %></td>
	</tr>
	<tr>
		<td colspan="2">
			<a href = "updateForm.jsp?id=<%=parameterId%>">[����]</a>
			<% if(!parameterId.equals("admin") && !sessionId.equals("admin")){%>
			<a href = "deleteForm.jsp?id=<%=parameterId%>">[Ż��]</a>
			<% }%>
			<a href = "main.jsp">[���ư���]</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>