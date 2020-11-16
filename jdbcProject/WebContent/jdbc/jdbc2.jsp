<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>201116, 15:07, jdbc testing source code</title>
</head>
<body>
<%
Class.forName("org.mariadb.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb","scott","1234");
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from emp");
ResultSetMetaData rsmt = rs.getMetaData();
%>
<table><tr>
<% for(int i = 1; i <= rsmt.getColumnCount(); i++){ %>
<th><%=rsmt.getColumnName(i) %></th>
<%} %><tr>
<%
while(rs.next()){ // return one by one which read from record
%><tr>
<% for(int i = 1; i < rsmt.getColumnCount(); i++) {%>
<th><%= rs.getString(i) %></th>
<%} %>
<%}%>
</table>
</body>
</html>