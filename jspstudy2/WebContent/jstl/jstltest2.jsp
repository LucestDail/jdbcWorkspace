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
이름:<input type = "text" name = "name"><br>
나이:<input type = "text" name = "age"><br>
성별:<input type = "radio" name = "gender" value = "male">남<input type = "radio" name = "gender" value = "female">여<br>
출생연도:<select name = "year">
<core:forEach var = "i" begin = "1980" end = "2020">
		<option value = "${i}">${i}</option>
</core:forEach>
	</select><br>
<input type = "submit" value = "전송">
</form>
</core:if>
<core:if test = "${param.name != null }">
 이름: ${param.name} <br>
나이: ${param.age} <br>
성별: ${param.gender=="male" ? "남" : "여"} <br>
출생년도: ${param.year} <br>
<fmt:parseDate var="paramBirth" value="${param.birth}" pattern="yyyy"/>
<fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy"/>
나이(만): ${today - param.year} <br>
</core:if>
</body>
</html>