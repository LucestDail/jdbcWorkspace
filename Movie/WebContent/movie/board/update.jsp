<%-- 
<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	Board board = new Board();
	String path = application.getRealPath("/") + "movie/board/file/";
	File f = new File(path);
	if(!f.exists()){
		f.mkdirs();
	}
	int size = 10*1024*1024;
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
	board.setNum(Integer.parseInt(multi.getParameter("num")));
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setSubject(multi.getParameter("subject"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));
	if(board.getFile1() == null || board.getFile1().equals("")){
		board.setFile1(multi.getParameter("file2"));
	}
	BoardDao dao = new BoardDao();
	String numString = board.getNum() + "";
	Board dbBoard = dao.selectOne(numString);
	String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
	String url = "updateForm.jsp?num="+board.getNum();
	if(board.getPass().equals(dbBoard.getPass())){
		if(dao.update(board)){
			msg = "�Խù� ���� �Ϸ�";
			url = "info.jsp?num=" + board.getNum();
		}else{
			msg = "�Խù� ���� ����";
		}
	}
%>
<script>
alert("<%=msg%>");
location.href = "<%=url%>"
</script>
--%>