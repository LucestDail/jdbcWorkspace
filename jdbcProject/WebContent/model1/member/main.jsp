<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 1. �α��� ���� ����
�α��� ���� : ���� ȭ��
�α����� admin �� ���� ȸ����� ���� �߰��ϱ�!
�α׾ƿ� ���� : �α����ϼ���. �޽��� ��� �� loginForm.jsp �� ������ �̵��ϱ�
 --%>
 <%
 String login = (String)session.getAttribute("login");
 if(login != null){%>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<table><caption>Welcome!</caption>
	<tr>
		<th><%=login %> �α��� �Ǿ����ϴ�.</th>
	</tr>
	<tr>
		<td><a href = "logout.jsp">�α׾ƿ�</a></td>
	</tr>
	<tr>
		<td><a href = "info.jsp?id=<%=login%>">ȸ����������</a></td>
	</tr>
	<% if(login.equals("admin")){ %>
	<tr>
		<td><a href = "list.jsp?id=<%=login%>"> ȸ����� ����</a></td>
	</tr>
	<% } %>
</table>
</body>
</html>
<% } else { %>
<script>
alert("�α����ϼ���")
location.href = "loginForm.jsp"
</script>
<% }%>