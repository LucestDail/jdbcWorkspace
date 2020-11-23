<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%--
    1. �Ķ���Ͱ��� model.Board ��ü ����
    useBean ���Ұ� : request ������ �Ķ���Ϳ� �� Ŭ������ ������Ƽ ��, request ��ü ��� �Ұ�
    2. �Խù� ��ȣ num ���� ��ϵ� num �� �ִ밪�� ��ȸ. �ִ밪+1 ��ϵ� �Խù��� ��ȣ
    db���� maxnum�� ���ؼ� +1 ������ num ����
    3. board ������ db�� ����ϱ�
    -> ��� ���� : �޽��� ���. list.jsp �������� �̵�
    -> ��� ���� : �޽��� ���. writeForm.jsp �������� �̵�
     --%>
     <%
     
    	String path = application.getRealPath("/") + "model1/board/file/";
    	File f = new File(path);
    	if(!f.exists()){
    		f.mkdirs();
    	}
    	int size = 10*1024*1024;
    	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
    	String noticecheck = multi.getParameter("notice");
    	Board board = new Board();
    	board.setName(multi.getParameter("name"));
    	board.setPass(multi.getParameter("pass"));
    	board.setSubject(multi.getParameter("subject"));
    	if(noticecheck != null){
    		board.setSubject("<b>[NOTICE]</b>" + multi.getParameter("subject"));
    	}
    	board.setContent(multi.getParameter("content"));
    	board.setFile1(multi.getFilesystemName("file1"));
    	
    	BoardDao dao = new BoardDao();
    	//board table ���� num �������� �ִ밪 ����, �ִ밪�� ���� ���� 0���� ����
    	String msg = "�Խù� ��� ����";
    	String url = "writeForm.jsp";
    	int num = dao.maxnum();
    	board.setNum(++num);
    	board.setGrp(num);
    	if(noticecheck != null){
    		board.setGrp(dao.maxgrp()+1);
    	}
    	if(dao.insert(board)){
    		msg = "�Խù� ��� ����!";
    		url = "list.jsp";
    		if(noticecheck != null){
    			msg += " �����Դϴ�!";
    		}
    	}
    %>
<script type = "text/javascript">
	alert("<%=msg%>")
	location.href = "<%=url%>"
</script>