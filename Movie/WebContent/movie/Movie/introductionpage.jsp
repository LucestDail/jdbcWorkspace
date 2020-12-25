<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Introduction</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
</head>
<body>
<div class = "introductionWrap">
<table style = "width:100%">
	<tr>
		<td colspan = "2">
		<div class = "introductionHead">
			��ȭ�� ���� �����, ��ȭ�ο��Դϴ�
		</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class = "introductionContent">
				<h2>��ȭ�� ���Ͽ�</h2><br>
				��ȭ�� �츮�� ������ �ڱ��մϴ�<br>
				���а� ����, ������ ���<br>
				������ ���� �� ���� �� ������ �̾��ִ�<br>
				���� ��ȭ�� ����ü<br>
				��ȭ���� ���࿡ �������� �ʴ��մϴ�.
			</div>
		</td>
		<td>
			<div class = "introductionimg">
				<img src = "${path}/resource/slidimg/movie.jpg" class = "introductionimgsrc">
			</div>
		</td>
	</tr>
		
	<tr>
		<td>
			<div class = "introductionimg">
				<img src = "${path}/resource/slidimg/cinema.jpg" class = "introductionimgsrc">
			</div>
		</td>
		<td>
			<div class = "introductionContent">
				<h2>������ ���� Ŀ�´�Ƽ</h2><br>
				��ȭ�� ������ ���� �������� Ȱ��<br>
				����, Ƽ��, �û�ȸ, �̺�Ʈ ���� ��������<br>
				������� ������ �����ְ�޴� ȭ���� Ŀ�´�Ƽ<br>
				��ȭ�οͷ� �������� ȯ���մϴ�.
			</div>
		</td>
	</tr>
</table>
</div>
</body>
</html>