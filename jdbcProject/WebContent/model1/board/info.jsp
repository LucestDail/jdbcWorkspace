<%@page import="osh.model.Board"%>
<%@page import="osh.model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세 보기</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
		<%
    	request.setCharacterEncoding("euc-kr");
    	String num = request.getParameter("num");
    	if(num == null){
    		%>
    		<script>
    			alert("난 여기서 빠져나가야겠어");
    			location.href = "list.jsp";
    		</script>
    		<%
    	}
    	BoardDao dao = new BoardDao();
    	Board infoBoard = dao.selectOne(num);
    	if(infoBoard == null){
    		%>
    		<script>
    			alert("난 여기서 빠져나가야겠어");
    			location.href = "list.jsp";
    		</script>
    		<%
    	}
    	dao.readcntAdd(num);
    %>
	<table>
		<tr>
			<th>글쓴이</th>
			<td><%=infoBoard.getName() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=infoBoard.getSubject() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=infoBoard.getContent() %></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<% if(infoBoard.getFile1() == null){ %>
			<td><a href="#">첨부파일 없음</a></td>
			<%}else{ %>
			<td><a href="file/<%=infoBoard.getFile1() %>"><%=infoBoard.getFile1() %></a></td>
			<%} %>
		</tr>
		<tr>
			<td colspan = "2">
				<a href = "replyFileForm.jsp?num=<%=infoBoard.getNum()%>">[답변]</a>
				<a href = "updateForm.jsp?num=<%=infoBoard.getNum()%>">[수정]</a>
				<a href = "deleteForm.jsp?num=<%=infoBoard.getNum()%>">[삭제]</a>
				<a href = "list.jsp">[목록]</a>
			</td>
		</tr>
	</table>
</body>
</html>