<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value = "utf-8"/>

<sql:setDataSource var = "conn" driver = "org.mariadb.jdbc.Driver" url = "jdbc:mariadb://localhost:3306/classdb" user = "root" password = "1234" />

<sql:query var = "rs" dataSource = "${conn}">
	select * from board where ${param.column} like ?
	<sql:param>%${param.find}%</sql:param>
</sql:query>
<table border = "1" style = "border-collapse: collapse;">
	<tr>
		<th>
			번호
		</th>
		<th>
			글쓴이
		</th>
		<th>
			제목
		</th>
		<th>
			내용
		</th>
		<th>
			등록일
		</th>
		<th>
			조회수
		</th>
	</tr>
	<core:forEach var = "data" items = "${rs.rows}">
	<tr>
		<td>
			${data.num}
		</td>
		<td>
			${data.name}
		</td>
		<td>
			${data.subject}
		</td>
			<core:set var = "content" value = "${functions:escapeXml(data.content)}" />
		<td>
			${functions:substring(content,0,20)} <core:if test = "${functions:length(content)>20}">...</core:if>
		</td>
			
		<td>
			${data.regdate}
		</td>
		<td>
			${data.readcnt}
		</td>
	</tr>
	</core:forEach>
</table>