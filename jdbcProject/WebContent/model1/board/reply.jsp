<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id = "b" class = "model.Board"/>
<jsp:setProperty property = "*" name = "b"/>
<%
	BoardDao dao = new BoardDao();
	dao.grpStepAdd(b.getGrp(),b.getGrpstep());
	
	int grplevel = b.getGrplevel();
	int grpstep = b.getGrpstep();
	int num = dao.maxnum();
	
	String msg = "�亯��Ͻ� ���� �߻�";
	String url = "replyForm.jsp?num="+b.getNum();
	
	b.setNum(++num);
	b.setGrplevel(grplevel + 1);
	b.setGrpstep(grpstep + 1);
	
	if(dao.insert(b)){
		msg = "�亯��� �Ϸ�";
		url = "list.jsp";
	}
	
	
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>"
</script>