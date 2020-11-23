<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
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
String pass = null;
Member sMem = new MemberDao().selectOne(sessionId);
String sPass = sMem.getPass();
if(mem != null){
	id = mem.getId();
	name = mem.getName();
	gender = (mem.getGender() == 1) ? "��" : "��";
	tel = mem.getTel();
	email = mem.getEmail();
	picture = mem.getPicture();
	pass = mem.getPass();
}
boolean owner = false;
if(!sessionId.equals(parameterId) && !sessionId.equals("admin")){
	%>
	alert("�� ������ ��ȸ �����մϴ�......")
	location.href = "main.jsp";
	<%
}

%>
function back(){
	history.go(-1);
}
function inputcheck(f){
	if(f.pass.value == ''){
		alert("��й�ȣ�� �Է��ϼ���");
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
	<table><caption>ȸ������ ����</caption>
		<tr>
			<td rowspan = "4" valign = "bottom">
				<img src = "picture/<%= mem.getPicture()%>" width="100" height="120" id="picture"><br>
				<font size="1"><a href = "javascript:win_upload()">�������</a></font>
			</td><th>���̵�</th><td><input type = "text" name = "id" readonly value = "<%=id %>"></td></tr>
			<tr><th>��й�ȣ</th><td><input type = "password" name = "pass"></td></tr>
			<tr><th>�̸�</th><td><input type = "text" name = "name" value = "<%=name %>"></td></tr>
			<tr><th>����</th>
			<%
			if(gender.equals("��")){
				%>
				<td>
					<input type = "radio" name = "gender" value = "1">��
					<input type = "radio" name = "gender" value = "2" checked>��
				</td>
				<%
			}else{
				%>
				<td>
					<input type = "radio" name = "gender" value = "1" checked>��
					<input type = "radio" name = "gender" value = "2">��
				</td>
				<%
			}
			%>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td colspan="2"><input type = "text" name = "tel" value = "<%=tel %>"></td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td colspan="2"><input type = "text" name = "email" value = "<%=email %>"></td>
			</tr>
			<tr>
				<td colspan = "3">
						<input type = "submit" value = "ȸ������">
					<% if(sessionId.equals("admin") || !parameterId.equals("admin")){%>
						<input type = "submit" value = "��й�ȣ����" onclick="win_passchg()">
					<% } %>
						<input type = "button" value = "���ư���" onclick="back()">
				</td>
			</tr>
	</table>
</form>
</body>
</html>