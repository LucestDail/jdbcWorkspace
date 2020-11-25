<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl el functions Example</title>
</head>
<body>
<core:set var = "str1" value = "Functions �±׸� ����մϴ�...          "/>
<core:set var = "str2" value = "���"/>
<core:set var = "tokens" value = "1,2,3,4,5,6,7,8,9,10"/>
length(str1) = ${functions:length(str1)} : str1 ���ڿ��� ���� ��ȯ<br>
toUpperCase(str1) = ${functions:toUpperCase(str1)} : str1 ���ڿ� ��ü �� �빮��<br>
toLowerCase(str1) = ${functions:toLowerCase(str1)} : str1 ���ڿ� ��ü �� �ҹ���<br>
substring(str1,3,6) = ${functions:substring(str1,3,6)} : str1 ���ڿ� �� �κ� ����<br>
substringAfter(str1,str2) = ${functions.substringAfter(str1,str2)} : str1 ���ڿ����� str2 ���ڿ� ������ ���ڿ� ��ȯ<br>
substringBefore(str1, str2) = ${functions.substringBefore(str1, str2)} : st1 ���ڿ����� str2 ���ڿ� ������ ���ڿ� ��ȯ<br>
contains(str1, str2) = ${functions.contains(str1, str2)} : str1 �� str2 ���ڿ��� �ִ��� �� ���� ��ȯ<br>
trim(str1) = ${functions.trim(str1)} : str1 ���� ���� ����<br>
replace(str1, " ", "-") = ${functions.replace(str1, " " ,"-")} : " " �� "-" �� ġȯ<br>
splict(tokens,',') : ,�� �������� ���ڿ� ������ �迭�� ����<br>

<core:set var = "arr" value = "${functions:split(tokens,',')}"/>
<core:forEach var = "i" items = "${arr}">
	${i} &nbsp;
</core:forEach><br>
<%-- join(arr,'-') = ${functions:join(arr,'-'})<br>--%>
<br>
</body>
</html>