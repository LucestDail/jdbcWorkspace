<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl 형식화 태그</title>
</head>
<body>
<h3>숫자 관련 형식 지정하기</h3>
<fmt:formatNumber value = "500000" type = "currency" currencySymbol = "￦"/><br>
<fmt:formatNumber value = "0.15" type = "percent"/><br>
<fmt:formatNumber value = "50000.345" pattern = "###,###.00"/><br>
<fmt:setLocale value = "en_US"/>
<fmt:formatNumber value = "500000" type = "currency" /> <br>
<fmt:setLocale value="ko_KR"/>
<fmt:formatNumber value = "500000" type = "currency"/><br>

<h3>날짜 관련 형식 지정하기</h3>
<core:set var = "today" value = "<%=new java.util.Date() %>"/>
년월일 : <fmt:formatDate value="${today}" type = "date"/><br>
시분초 : <fmt:formatDate value="${today}" type = "time"/><br>
년월일시분초 : <fmt:formatDate value="${today}" type = "both"/><br>
년월일시분초1 : <fmt:formatDate value="${today}" type = "both" timeStyle = "short" dateStyle="short"/><br>
년월일시분초2 : <fmt:formatDate value="${today}" type = "both" timeStyle = "long" dateStyle="long"/><br>
년월일시분초3 : <fmt:formatDate value="${today}" type = "both" timeStyle = "full" dateStyle="full"/><br>
년월일시분초4 : <fmt:formatDate value="${today}" type = "both" timeStyle = "full" dateStyle="full" timeZone = "GMT"/><br>
형식지정 : <fmt:formatDate value="${today}" pattern = "yyyy년MM월dd일 HH:mm:ss a E"/><br>
</body>
</html>
<%-- XXXFormat 틀래스
format() : 자료형 => 형식화된 문자열
parse() : 형식화된 문자열 => 원래의 자료형 변경

--%>