<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value = "utf-8"/>
<sql:setDataSource var = "conn" driver = "org.mariadb.jdbc.Driver" url = "jdbc:mariadb://localhost:59753/classdb" user = "root" password = "159753" />
<sql:query var = "rs" dataSource = "${conn}">
	select * from member where id = ? and pass = ?
	<sql:param>${param.id}</sql:param>
	<sql:param>${param.pass}</sql:param>
</sql:query>
<core:if test = "${!empty rs.rows}">
	<h1>�ݰ����ϴ� ${rs.rows[0].name} ��</h1>
</core:if>

<core:if test = "${empty rs.rows}">
	<h1>���̵� �Ǵ� ��й�ȣ�� Ʋ���ϴ�...</h1>
</core:if>