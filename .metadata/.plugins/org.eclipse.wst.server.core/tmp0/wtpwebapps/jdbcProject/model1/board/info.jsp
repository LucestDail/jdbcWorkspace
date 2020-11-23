<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
		<%
    	request.setCharacterEncoding("euc-kr");
    	String num = request.getParameter("num");
    	if(num == null){
    		%>
    		<script>
    			alert("�� ���⼭ ���������߰ھ�");
    			location.href = "list.jsp";
    		</script>
    		<%
    	}
    	BoardDao dao = new BoardDao();
    	Board infoBoard = dao.selectOne(num);
    	if(infoBoard == null){
    		%>
    		<script>
    			alert("�� ���⼭ ���������߰ھ�");
    			location.href = "list.jsp";
    		</script>
    		<%
    	}
    	dao.readcntAdd(num);
    %>
	<table>
		<tr>
			<th>�۾���</th>
			<td><%=infoBoard.getName() %></td>
		</tr>
		<tr>
			<th>����</th>
			<td><%=infoBoard.getSubject() %></td>
		</tr>
		<tr>
			<th>����</th>
			<td><%=infoBoard.getContent() %></td>
		</tr>
		<tr>
			<th>÷������</th>
			<% if(infoBoard.getFile1() == null){ %>
			<td><a href="#">÷������ ����</a></td>
			<%}else{ %>
			<td><a href="file/<%=infoBoard.getFile1() %>"><%=infoBoard.getFile1() %></a></td>
			<%} %>
		</tr>
		<tr>
			<td colspan = "2">
				<a href = "replyFileForm.jsp?num=<%=infoBoard.getNum()%>">[�亯]</a>
				<a href = "updateForm.jsp?num=<%=infoBoard.getNum()%>">[����]</a>
				<a href = "deleteForm.jsp?num=<%=infoBoard.getNum()%>">[����]</a>
				<a href = "list.jsp">[���]</a>
			</td>
		</tr>
	</table>
</body>
</html>