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
<title>원본 이미지와 썸네일 이미지 보기</title>
<link rel = "stylesheet" href = "../css/main.css">
</head>
<body>
<%
	// 이미지 파일 업로드 위치 지정
	String path = application.getRealPath("/") + "thumbnail/";
	int size = 10*1024*1024; // 최대 업로드 크기 지정
	//업로드 실행
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
	//fname : <input type = "file" name="picture"> 선택한 파일의 이름, (업로드된 파일의 이름이 이겁니다!!!)
	String fname = multi.getFilesystemName("picture");
	//bi : 이미지 파일을 읽어서 메모리에 로드 => 원본이미지
	BufferedImage bi = ImageIO.read(new File(path + fname));
	int width = bi.getWidth()/5; // 원본이미지 가로 크기의 5분의 1 값 확보
	int height = bi.getHeight()/5; // 원본이미지 세로 크기의 5분의 1 값 확보
	BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi,0,0,width,height,null);
	File f = new File(path + "sm_" + fname);
	ImageIO.write(thumb,"jpg",f);
%>
<table><caption>파일 조정 결과</caption>
	<tr>
		<th>원본 이미지</th>
		<td><img src = "<%=fname %>"></td>
	</tr>
	<tr>
		<th>썸네일 이미지</th>
		<td><img src = "sm_<%=fname %>"></td>
	</tr>
</table>
</body>
</html>