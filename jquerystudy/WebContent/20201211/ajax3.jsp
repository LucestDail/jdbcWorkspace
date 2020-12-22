<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value = "utf-8"/>
<sql:setDataSource var = "conn" driver = "org.mariadb.jdbc.Driver" url = "jdbc:mariadb://localhost:59753/classdb" user = "root" password = "159753" />
<sql:query var = "rs" dataSource = "${conn}">
	select * from member where id like ?
	<sql:param>%${param.id}%</sql:param>
</sql:query>
<ul>
	<core:forEach var = "data" items = "${rs.rows}">
		<li>${data.id}</li>
	</core:forEach>
</ul>