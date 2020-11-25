<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<core:if test = "${param.name == null}">
<form method = "post">
�̸�:<input type = "text" name = "name"><br>
����:<input type = "text" name = "age"><br>
����:<input type = "radio" name = "gender" value = "male">��<input type = "radio" name = "gender" value = "female">��<br>
�������:<select name = "year">
<core:forEach var = "i" begin = "1980" end = "2020">
		<option value = "${i}">${i}</option>
</core:forEach>
	</select><br>
<input type = "submit" value = "����">
</form>
</core:if>
<core:if test = "${param.name != null }">
 �̸�: ${param.name} <br>
����: ${param.age} <br>
����: ${param.gender=="male" ? "��" : "��"} <br>
����⵵: ${param.year} <br>
<fmt:parseDate var="paramBirth" value="${param.birth}" pattern="yyyy"/>
<fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy"/>
����(��): ${today - param.year} <br>
</core:if>
</body>
</html>