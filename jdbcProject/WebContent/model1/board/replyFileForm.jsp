<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- 
    1. ������ num�� �Ķ���ͷ� �޴´�.
    2. db���� num�� �Խù��� ��ȸ�Ͽ� ������ num, grp, grplevel, grpstep ������ ����
    3. �Է� ȭ�� ǥ��
     --%>
     <%
     String num = request.getParameter("num");
     BoardDao dao = new BoardDao();
     Board board = dao.selectOne(num);
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ��� ����</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<form action="replyFile.jsp" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "num" value = "<%=board.getNum()%>">
<input type = "hidden" name = "grp" value = "<%=board.getGrp()%>">
<input type = "hidden" name = "grplevel" value = "<%=board.getGrplevel()%>">
<input type = "hidden" name = "grpstep" value = "<%=board.getGrpstep()%>">
	<table>
		<caption>�Խ��� ��� ���</caption>
		<tr>
			<th>
				�۾���
			</th>
			<td>
				<input type = "text" name = "name">
			</td>
		</tr>
		<tr>
			<th>
				��й�ȣ
			</th>
			<td>
				<input type = "password" name = "pass">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<input type = "text" name = "subject" value = "RE:<%=board.getSubject()%>">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "content"></textarea>
			</td>
		</tr>
		<tr>
			<th>
				÷������
			</th>
			<td>
				<input type = "file" name = "file1">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<a href = "javascript:document.f.submit()">[�Խù� ���]</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>