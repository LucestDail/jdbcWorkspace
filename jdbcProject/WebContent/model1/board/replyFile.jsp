<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="osh.model.BoardDao"%>
<%@page import="osh.model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	BoardDao dao = new BoardDao();
	
	String path = application.getRealPath("/") + "model1/board/file/";
	File f = new File(path);
	if(!f.exists()){
		f.mkdirs();
	}
	int size = 10*1024*1024;
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
	
	String name = multi.getParameter("name");
	String pass = multi.getParameter("pass");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String file1 = multi.getFilesystemName("file1");
	int grp = Integer.parseInt(multi.getParameter("grp"));
	int grplevel = Integer.parseInt(multi.getParameter("grplevel"));
	int grpstep = Integer.parseInt(multi.getParameter("grpstep"));
	int num = dao.maxnum();
	dao.grpStepAdd(grp,grpstep);
	
	String msg = "답변등록시 오류 발생";
	String url = "replyForm.jsp?num="+num;
	
	Board board = new Board();
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setSubject(multi.getParameter("subject"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));
	board.setNum(++num);
	board.setGrp(grp);
	board.setGrplevel(grplevel + 1);
	board.setGrpstep(grpstep + 1);
	
	if(dao.insert(board)){
		msg = "답변등록 완료";
		url = "list.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>"
</script>