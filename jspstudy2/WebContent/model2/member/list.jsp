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
	<title>ȸ�� ���</title>
	<link rel = "stylesheet" href="../../css/main.css">
	<script type="text/javascript">
		function allchkbox(chk){
			var allchk = chk.checked // ��ü ���� ��, true, false
			//getElementsByName(name) : name �Ӽ� ���� mailchk �� �±׵�
			//input name = "mailchk"
			document.getElementsByName("mailchk").forEach(function(item,index){
				//item : name = "mailchk" �� �±� �Ѱ�
				if(allchk){ // ��ü ���� ���� true �� ���
					item.setAttribute("checked",true);
				}else{// ��ü ������ �ȵ� ���(false �� ���)
					item.removeAttribute("checked");
				}
			})
		}
	</script>
</head>
<body>
<form action = "mailform.me" method = "post" name = "f">
<table class="w3-table-all w3-border">
	<caption>ȸ�� ���</caption>
		<tr>
			<th>���̵�</th>
			<th>����</th>
			<th>�̸�</th>
			<th>����</th>
			<th>��ȭ</th>
			<th>ȸ������</th>
			<th>�̸���</th>
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
			<td>${member.gender==1?"��":"��"}</td>
			<td>${member.tel }</td>
			<td><a href = "updateForm.me?id=${member.id}">[����]</a>
			<core:if test = "${member.id != 'admin'}">
			<a href = "deleteForm.me?id=${member.id}">[����Ż��]</a>
			</core:if>
			</td>
			<td>${member.email}</td>
			<td><input type="checkbox" name="mailchk" value="${member.email}" onchange = "clickit(this)"></td>
		</tr>
		</core:forEach>
		<tr>
			<td colspan = "6" class = "w3-center">
				<input type = "button" value = "���ư���" onclick="location.href='main.me'">
			</td>
			<td colspan = "2" class = "w3-center">
				<input type = "submit" value = "��������">
			</td>
		</tr>
</table>
</form>
</body>
</html>