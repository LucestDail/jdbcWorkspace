<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String num = request.getParameter("num");
	String pass = request.getParameter("pass");
	Board board = new Board();
	BoardDao dao = new BoardDao();
	String msg = "�Խñ� ���� ����";
	String url = "info.jsp?num="+num;
	
	Board curBoard = dao.selectOne(num);
	if(!pass.equals(curBoard.getPass())){
		msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		url = "info.jsp?num="+num;
	}else{
		if(dao.delete(num)){
			msg = "�Խñ� ���� ����!";
			url = "list.jsp";
		}
	}
%>
<script>
alert("<%=msg%>");
location.href = "<%=url%>";

</script>