<%@page import="java.sql.ResultSetMetaData"%>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String sql = request.getParameter("sql"); //null
%>
<%-- form �� action �Ӽ��� ���� ��� �ڽ��� �������� �ٽ� ȣ����. --%>
<form method = "post">
	<textarea name = "sql">
		<%=(sql==null) ? ("") : (sql)%>
	</textarea>
	<input type="submit" value = "����">
</form>
<%
Connection conn = null;
if(sql != null && !sql.trim().equals("")){
	try{
		//����̹� ����
		Class.forName("org.mariadb.jdbc.Driver");
		//���ᰴü(Connection ��ü)
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb","root","1234");
		//PreparedStatement : Statement ���� �������̽��̸� sql ������ �̸� db ������ ����
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//ResultSet rs = pstmt.executeQuery();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ResultSetMetaData rsmt = rs.getMetaData();
		PreparedStatement pstmt2 = conn.prepareStatement("select count(*) from (" + sql + ") a");
		ResultSet rs2 = pstmt2.executeQuery();
		rs2.next();
		int cnt = rs2.getInt(1);
		%>
		<table>
		<tr><td colspan = "<%=rsmt.getColumnCount()%>" style = "text-align:rigt;">
		��ȸ�� ���ڵ� ���� : <%=cnt %></td></tr>
		<tr><%-- �÷��� ��� --%>
		<% for(int i = 1; i<= rsmt.getColumnCount(); i++){ %>
		<th><%= rsmt.getColumnName(i) %></th>
		<%} %>
		</tr>
		<%-- �÷� ���� ��� --%>
		<% while(rs.next()) { %><tr>
		<% for (int i = 1; i <= rsmt.getColumnCount(); i++) { %>
		<td><%= rs.getString(i) %></td><%} %>
		<%} %></tr>
		</table>
		<% } catch(Exception e){ %>
		<h1> sql statement error...</h1>
		<h2><%=e.getMessage() %></h2>
		<h2> sql statement : <%= sql %></h2>
		<%} finally{
			conn.close();
		}
	}
	%>
</body>
</html>