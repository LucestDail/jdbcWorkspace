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
while(rs.next()){
%>
<%=rs.getString(1)%>,<%=rs.getString(2) %>,<%=rs.getString(3) %>,<%=rs.getString(4) %><br>
<%
}
%>

</body>
</html>