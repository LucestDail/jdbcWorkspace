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
<title>���� �� �� ��ȸ</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
</head>
<body>
	<table>
	<core:if test = "${boardcount == 0}">
		<tr>
			<td colspan = "5"> ��ϵ� �Խñ��� �����ϴ�...
			</td>
		</tr>
	</core:if>
	<core:if test = "${boardcount > 0}">
	<caption>�Խ��� ���� - �Խñ�</caption>
		<tr>
			<th width = "20%">�Խñ� ����</th>
			<th width = "10%">�ۼ�����</th>
			<th width = "10%">��ȸ��</th>
			<th width = "10%">��õ</th>
			<th width = "10%">����õ</th>
		</tr>
		<core:forEach var="boardlist" items="${boardlist}">
		<tr>
			<td style = "text-align : left">
				<a href = "info.do?board_num=${boardlist.board_num}&&board_type=${boardlist.board_type}">${boardlist.board_subject}</a>
			</td>
			<td>
				<fmt:formatDate value = "${boardlist.board_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
			</td>
			<td>${boardlist.board_readcnt}</td>
						<!--  ��õ -->
			<td>${boardlist.recommand_count}</td>
			<!--  ��õ -->
			<td>${boardlist.not_recommand_count}</td>
		</tr>
		</core:forEach>
	</core:if>
	</table>
	<table>
	<core:if test = "${commentcount == 0}">
		<tr>
			<td colspan = "5"> ��ϵ� �Խñ��� �����ϴ�...
			</td>
		</tr>
	</core:if>
	<core:if test = "${commentcount > 0}">
	<caption>�Խ��� ���� - ���</caption>
		<tr>
			<th width = "20%">�Խñ� ����</th>
			<th width = "10%">��� ����</th>
			<th width = "10%">�ۼ�����</th>
			<th width = "10%">��õ</th>
			<th width = "10%">����õ</th>
		</tr>
		<core:forEach var="commentlist" items="${commentlist}">
		<tr>
			<td>${board.information_type}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num }&&board_type=${param.board_type}">${board.board_subject}(${board.counter})</a>
			</td>
			<td>${board.member_id}</td>
			<fmt:formatDate var = "rdate" value="${board.board_regdate}" pattern = "yyyy-MM-dd"/>
			<core:if test = "${today == rdate}">
				<!-- ������ ��� -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "HH:mm:ss"/>
				</td>
			</core:if>
			<core:if test = "${today != rdate}">
				<!--  ������ �ƴ� ��� -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
				</td>
			</core:if>
			<td>${board.board_readcnt}</td>
						<!--  ��õ -->
			<td>${board.recommand_count}</td>
			<!--  ��õ -->
			<td>${board.not_recommand_count}</td>
		</tr>
		</core:forEach>
	</core:if>
	</table>
</body>
</html>