<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%--

enctype = "multipart/form-data -> action �޾����Ƿ�
request ��ü ���� ����� �Ұ���
=> MultipartRequest ��ü�� �̿��Ͽ� ���˴ϴ�...

application.getRealPath("/") : �����ø����̼��� ���� ���

uploadPath : �����ø����̼� ���� ���/upload/
=> ������ ���ε� ������ ����Ǵ� ��ġ

 new MultipartRequest(request, uploadPath, size, "euc-kr")
request : �Ķ���� ����, ��������, ���ϳ��� �����ϰ� �ִ� ��û ��ü(Request Object)
uploadPath : ���ε� �Ǵ� ���� ����
size : ���ε�Ǵ� �ִ� ������ ũ��
euc-kr : �Ķ���� ���ڵ� ����( -> utf-8 ������ ���� ����!)


 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href = "../css/main.css">
</head>
<body>
<%
	String uploadPath = application.getRealPath("/") + "upload/";
	int size = 10*1024*1024;
	File f = new File(uploadPath);
	if(!f.exists()){
		f.mkdirs();
	}
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr");
	String name = multi.getParameter("name");
	String title = multi.getParameter("title");
	String fname = multi.getFilesystemName("file1");//uploadForm �� name ���� file1 �̱� ����...
%>
<table>
	<tr>
		<th>���ε� ��ġ</th>
		<td> <%=uploadPath %></td>
	</tr>
	<tr>
		<th>�ø� ���</th>
		<td><%=name %></td>
	</tr>
	<tr>
		<th>����</th>
		<td><%=title %></td>
	</tr>
	<tr>
		<th>����</th>
		<td>
			<a href = "<%=fname %>"><%=fname %></a>
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<img src = "<%=fname%>">
		</td>
	</tr>
</table>
</body>
</html>