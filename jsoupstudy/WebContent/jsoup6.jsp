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
		out.println("<th>��ȭ��</th><th>�Ÿű�����</th><th>�����ĽǶ�</th><th>������Ƕ�</th><th>����ȯ�����Ƕ�</th><th>����ȯ�����Ƕ�</th>");
		out.println("<caption> ȯ�������� : " + json.get("��¥").toString() + "</caption>");
		JSONArray array = (JSONArray)json.get("����Ʈ");
		for(int i = 0; i < array.size(); i++){
			out.println("<tr>");
			JSONObject obj = (JSONObject)array.get(i);
			out.println("<td>" + obj.get("��ȭ��").toString() + "</td>");
			out.println("<td>" + obj.get("�Ÿű�����").toString()  + "</td>");
			out.println("<td>" + obj.get("�����ĽǶ�").toString()  + "</td>");
			out.println("<td>" + obj.get("������Ƕ�").toString()  + "</td>");
			out.println("<td>" + obj.get("�۱�_����ȯ�����Ƕ�").toString()  + "</td>");
			out.println("<td>" + obj.get("�۱�_����ȯ�����Ƕ�").toString()  + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");
	}catch(IOException e){
		e.printStackTrace();
	}
%>
</body>
</html>