<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<core:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ����</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<style>
   #centerPosition {  
     position:absolute;
     height:800px;
     width:550px;
     margin:-150px 0px 0px -200px;
     top: 50%;
     left: 50%;
     padding: 5px;
   }

</style>
</head>
<body>
<table style = "width : 100%; height: 600px;">
	<tr>
		<td>
			<form name = "f" method="post">
			<input type = "hidden" name ="picture" value = "">
			<table>
			<caption>ȸ�� ���� ����</caption>
				<tr>
					<td rowspan = "8">
						<img src = "picture/${member.member_picture}" width="200" height="300" id="picture">
					</td>
				<th> ���̵�</th>
				<td>${member.member_id}</td>
				</tr>
				<tr>
					<th> �г���</th>
					<td>${member.member_nickname}</td>
				</tr>
				<tr>
					<th> ����</th>
					<td>${member.member_gender==1?"��":"��"}</td>
				</tr>
				<tr>
					<th> ����</th>
					<td>${member.member_age}</td>
				</tr>
				<tr>
					<th> �̸���</th>
					<td>${member.member_email}</td>
				</tr>
				<tr>
					<th> �����ϴ� �帣</th>
					<td>${member.member_genre}</td>
				</tr>
				<tr>
					<th> �ڱ� �Ұ�</th>
					<td>${member.member_introduction}</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href = "${path}/movie/member/updateForm.me?id=${member.member_id}" class = "redbutton">����</a>
					<core:if test="${param.id != 'admin' && sessionScope.login != 'admin' }">
						<a href = "${path}/movie/member/deleteForm.me?id=${member.member_id}" class = "normalbutton">Ż��</a>
					</core:if>
					<core:if test="${param.id == 'admin' && sessionScope.login == 'admin' }">
						<a href = "${path}/movie/member/list.me" class = "normalbutton">ȸ�����</a>
					</core:if>
						<a href = "${path}/movie/board/index.do" class = "normalbutton">���ư���</a>
				</td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
</table>
</body>
</html>