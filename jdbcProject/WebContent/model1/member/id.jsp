<%@page import="osh.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	MemberDao dao = new MemberDao();
	String id = dao.idSearch(email,tel);
	if(id != null){ //id 찾았다!
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디찾아줄께영</title>
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
			<input type = "button" value = "아이디전송" onclick = "idsend('<%=id.substring(0,id.length()-2)%>')">
		</td>
	</tr>
</table>
</body>
</html>
<% } else { %>
<script type="text/javascript">
	alert("정보에 맞는 id를 찾을 수 없습니다...");
	location.href = "idForm.jsp";
</script>

<%}%>