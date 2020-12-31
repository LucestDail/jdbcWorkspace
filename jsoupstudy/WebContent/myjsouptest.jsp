<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공공데이터 가져오기</title>
</head>
<body>
<%
	Date today = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	String defaultdate = sf.format(today);
	int targetdate = Integer.parseInt(defaultdate) - 1;
	System.out.println(targetdate);
	String apiurl = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=14234f311919496d0877ff15e5d5c03c&targetDt="+targetdate;
	String line = "";
	String str = "";
	
	URL url = new URL(apiurl);
	HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	conn.setRequestProperty("Accept","application/xml");
	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
	while((str = br.readLine()) != null){
		line += str;
	}
	System.out.println("line ->" +  line);
	Document doc = null;
	String html = "<table><caption></caption>";
	try{
		doc = Jsoup.parse(line);
		Elements e1 = doc.select("dailyBoxOffice");
		for(Element ele : e1){
			html += "<tr><td>" + ele.select("rank").get(0).text() + "</td>";
			html += "<td>" + ele.select("movieNm").get(0).text() + "</td>";
			try{
				html += "<td>" + ele.select("audiCnt").get(0).text() + "&nbsp;</td></tr>";
			}catch(Exception e){
				html += "<td>&nbsp;</td></tr>";
			}
		}
		html += "</table>";
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%= html %>
</body>
</html>