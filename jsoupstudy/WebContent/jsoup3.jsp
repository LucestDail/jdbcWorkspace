<%@page import = "java.io.IOException"%>
<%@page import = "org.jsoup.nodes.Element"%>
<%@page import = "org.jsoup.select.Elements"%>
<%@page import = "org.jsoup.Jsoup"%>
<%@page import = "org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type = "text/css">
table, td, th{
	border : 2px solid grey;
}
</style>
</head>
<body>
<%
	String url = "https://www.doosanbears.com/players/batters/20";
	String line = "";
	String title = "";
	Document doc = null;
	try{
		doc = Jsoup.connect(url).get();
		Elements div = doc.select(".table_l > .tableBWrite1");
		for(Element src : div){
			out.println(src.toString());
			System.out.println(src.toString());
		}
	}catch(IOException e){
		e.printStackTrace();
	}


%>
<table><%=line%></table>
</body>
</html>