<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value = "utf-8"/>
<sql:setDataSource var = "conn" driver = "org.mariadb.jdbc.Driver" url = "jdbc:mariadb://localhost:3306/classdb" user = "root" password = "1234" />
<sql:query var = "rs" dataSource = "${conn}">
	select * from member where name like ?
	<sql:param>%${param.name}%</sql:param>
</sql:query>
<table border = "1" style = "border-collapse: collapse;">
	<tr>
		<th>
			아이디
		</th>
		<th>
			이름
		</th>
		<th>
			전화
		</th>
		<th>
			이메일
		</th>
		<th>
			성별
		</th>
	</tr>
	<core:forEach var = "data" items = "${rs.rows}">
	<tr>
		<td>
			${data.id}
		</td>
		<td>
			${data.name}
		</td>
		<td>
			${data.tel}
		</td>
		<td>
			${data.email}
		</td>
		<td>
			${data.gender == 1 ? '남자' : '여자'}
		</td>
	</tr>
	</core:forEach>
</table>