<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type = "text/css">
	table, td, th{
		border: 2px solid grey;
		border-collapse: collapse;
		align: center;
	}
</style>
</head>
<body>
<%
	String url = "http://fx.kebhana.com/FER1101M.web";
	String line = "";
	String title = "";
	try{
		String kebhana = Jsoup.connect(url).get().text();
		System.out.println(kebhana);
		String strJson = kebhana.substring(kebhana.indexOf("{"));
		System.out.println(strJson);
		JSONParser jsonParser = new JSONParser();
		JSONObject json = (JSONObject)jsonParser.parse(strJson.trim());
		out.println("<table>");
		out.println("<th>통화명</th><th>매매기준율</th><th>현찰파실때</th><th>현찰사실때</th><th>전신환보내실때</th><th>전신환받으실때</th>");
		out.println("<caption> 환율기준일 : " + json.get("날짜").toString() + "</caption>");
		JSONArray array = (JSONArray)json.get("리스트");
		for(int i = 0; i < array.size(); i++){
			out.println("<tr>");
			JSONObject obj = (JSONObject)array.get(i);
			out.println("<td>" + obj.get("통화명").toString() + "</td>");
			out.println("<td>" + obj.get("매매기준율").toString()  + "</td>");
			out.println("<td>" + obj.get("현찰파실때").toString()  + "</td>");
			out.println("<td>" + obj.get("현찰사실때").toString()  + "</td>");
			out.println("<td>" + obj.get("송금_전신환보내실때").toString()  + "</td>");
			out.println("<td>" + obj.get("송금_전신환받으실때").toString()  + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");
	}catch(IOException e){
		e.printStackTrace();
	}
%>
</body>
</html>