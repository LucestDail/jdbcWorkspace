<%@page import="java.util.List"%>
<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset = "euc-kr">
	<title>ȸ�� ���</title>
	<link rel="stylesheet" href="${path}/resource/mycss.css">
	<script type="text/javascript"
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	</script>
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
		
		function allchkbox2(chk){
			$("input[name=mailchk]").prop("checked",chk.checked)
		}
	</script>
</head>
<body>
<form action = "mailform.me" method = "post" name = "f">
<table class="table">
	<caption>ȸ�� ���</caption>
		<tr>
			<th>���̵�</th>
			<th>����</th>
			<th>�̸�</th>
			<th>����</th>
			<th>ȸ������</th>
			<th>�̸���</th>
			<th><input type = "checkbox" name = "allchk" onchange = "allchkbox2(this)"></th>
		</tr>
		<core:forEach var = "member" items = "${list}">
		<tr>
			<td>
				<a href = "info.me?id=${member.member_id}"> ${member.member_id}</a>
			</td>
			<td>
				<img src = "picture/sm_${member.member_picture}" width="20" height="30">
			</td>
			<td>${member.member_nickname }</td>
			<td>${member.member_gender==1?"��":"��"}</td>
			<td><a href = "updateForm.me?id=${member.member_id}">[����]</a>
			<core:if test = "${member.member_id != 'admin'}">
			<a href = "deleteForm.me?id=${member.member_id}">[����Ż��]</a>
			</core:if>
			</td>
			<td>${member.member_email}</td>
			<td>
			<core:if test="${member.member_email_receive_ok == 0}">
				<input type="checkbox" name="mailchk" value="${member.member_email}" onchange = "clickit(this)">
			</core:if>
			</td>
		</tr>
		</core:forEach>
		<tr>
			<td colspan = "6">
				<input type = "button" value = "���ư���" onclick="location.href='${path}/movie/board/index.do'" class = "normalbutton">
			</td>
			<td colspan = "2">
				<input type = "submit" value = "��������" class = "redbutton">
			</td>
		</tr>
</table>
</form>
</body>
</html>