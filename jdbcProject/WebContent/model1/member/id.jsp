<%@page import="osh.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	MemberDao dao = new MemberDao();
	String id = dao.idSearch(email,tel);
	if(id != null){ //id ã�Ҵ�!
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵�ã���ٲ���</title>
<link rel = "stylesheet" href = "../../css/main.css">
<script type = "text/javascript">
	function idsend(id){
		opener.document.f.id.value = id;
		self.close();
	}
</script>
</head>
<body>
<table>
	<tr>
		<td>
			<%=id.substring(0,id.length() - 2) + "**" %>
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<input type = "button" value = "���̵�����" onclick = "idsend('<%=id.substring(0,id.length()-2)%>')">
		</td>
	</tr>
</table>
</body>
</html>
<% } else { %>
<script type="text/javascript">
	alert("������ �´� id�� ã�� �� �����ϴ�...");
	location.href = "idForm.jsp";
</script>

<%}%>