<%@page import="java.awt.Graphics2D"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �̹����� ����� �̹��� ����</title>
<link rel = "stylesheet" href = "../css/main.css">
</head>
<body>
<%
	// �̹��� ���� ���ε� ��ġ ����
	String path = application.getRealPath("/") + "thumbnail/";
	int size = 10*1024*1024; // �ִ� ���ε� ũ�� ����
	//���ε� ����
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
	//fname : <input type = "file" name="picture"> ������ ������ �̸�, (���ε�� ������ �̸��� �̴̰ϴ�!!!)
	String fname = multi.getFilesystemName("picture");
	//bi : �̹��� ������ �о �޸𸮿� �ε� => �����̹���
	BufferedImage bi = ImageIO.read(new File(path + fname));
	int width = bi.getWidth()/5; // �����̹��� ���� ũ���� 5���� 1 �� Ȯ��
	int height = bi.getHeight()/5; // �����̹��� ���� ũ���� 5���� 1 �� Ȯ��
	BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi,0,0,width,height,null);
	File f = new File(path + "sm_" + fname);
	ImageIO.write(thumb,"jpg",f);
%>
<table><caption>���� ���� ���</caption>
	<tr>
		<th>���� �̹���</th>
		<td><img src = "<%=fname %>"></td>
	</tr>
	<tr>
		<th>����� �̹���</th>
		<td><img src = "sm_<%=fname %>"></td>
	</tr>
</table>
</body>
</html>