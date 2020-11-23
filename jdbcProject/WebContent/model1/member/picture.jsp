<%@page import="java.awt.Graphics2D"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	// �̹��� ���� ���ε��� ��ġ : ���� ����/picture ������ ����
	String path = application.getRealPath("/") + "model1/member/picture/";
	int size = 10*1024*1024;
	// ������ ������ ���� ����ϴ�...
	File pathDirectory = new File(path);
    if (!pathDirectory.exists()) {
        pathDirectory.mkdirs();
    }
	// �̹��� ���� ���ε�, request ��ü ��� �Ұ��ϹǷ� MultipartRequest ���
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
	String fname = multi.getFilesystemName("picture");
	
	//�̹��� ������ 3���� 1ũ���� ������ �̹��� ����, ���� �̸��� sm_�����̸�.jpg ���� ����
	BufferedImage bi = ImageIO.read(new File(path + fname));
	int width = bi.getWidth()/3;
	int height = bi.getHeight()/3;
	BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi,0,0,width,height,null);
	File f = new File(path + "sm_" + fname);
	ImageIO.write(thumb,"jpg",f);
	String thumbnail = "sm_" + fname;
	%>
	<script>
		opener.document.getElementById("picture").src="picture/<%=thumbnail%>";
		opener.document.f.picture.value="<%=fname%>";
		self.close();
	</script>
	<%
%>
</body>
</html>