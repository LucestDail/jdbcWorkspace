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
	}
</style>
</head>
<body>
<%
	String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
	String line = "";
	Document doc = null;
	List<String> list = new ArrayList<String>();
	try{
		doc = Jsoup.connect(url).get();
		Elements e1 = doc.select(".tc"); //class = tc 인 애들만 가져와라...
		for(Element ele : e1){
			list.add(ele.html()); // 리스트에 꼴아박아버리기~
		}
	}catch(IOException e){
		e.printStackTrace();
	}
	pageContext.setAttribute("list",list);
%>
<table>
	<core:forEach items = "${list}" var = "v" varStatus = "stat">
		<core:choose>
			<core:when test = "${stat.index % 7 == 0}"><%--통화 코드 --%>
				<tr><td rowspan = "6">${v}</td>
			</core:when>
			<core:when test="${stat.index % 7 == 1 }">
				<td>${v}</td>
			</core:when>
			<core:otherwise>
				<tr>
					<td>${v}</td>
				</tr>
			</core:otherwise>
		</core:choose>
	</core:forEach>
</table>
</body>
</html>