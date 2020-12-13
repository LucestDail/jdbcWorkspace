<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "decorator" uri = "http://www.opensymphony.com/sitemesh/decorator" %>
<core:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>
<decorator:head />
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<table>
		<tr>
			<td colspan = "3" align = "right">
			�ڹ�/������ ��� ������ �÷��� ������ �缺���� ��2 ���α׷� ����
			<span style = "float:right;">
				<core:if test = "${empty sessionScope.login}">
					<a href = "${path}/movie/member/loginForm.me"> �α��� </a><br>
					<a href = "${path}/movie/member/joinForm.me"> ȸ������ </a><br>
				</core:if>
				<core:if test = "${!empty sessionScope.login}">
					${sessionScope.login} ���� �α����ϼ̽��ϴ�...
					<a href = "${path}/movie/member/logout.me">�α׾ƿ�</a><br>
				</core:if>
			</span>
			</td>
		</tr>
		<tr>
			<td width = "15%" style = "vertical-align: top">
				<a href = "${path}/movie/member/main.me">ȸ������</a><br>
				<a href = "${path}/movie/board/list.do">�Խ���</a><br>
				<a href = "${path}/movie/chat/chatForm.do">ä��</a>
			</td>
			<td colspan = "2" style = "text-align: left; vertical-align:top;">
			<decorator:body /><%-- <body> �±� ���� �߰� --%>
			</td>
		</tr>
		<tr>
			<td colspan = "3">  ���� ��ī���� Since 2016
			</td>
		</tr>
	</table>
</body>
</html>