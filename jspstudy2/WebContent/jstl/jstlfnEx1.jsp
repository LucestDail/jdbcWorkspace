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
<core:set var = "str1" value = "Functions 태그를 사용합니다...          "/>
<core:set var = "str2" value = "사용"/>
<core:set var = "tokens" value = "1,2,3,4,5,6,7,8,9,10"/>
length(str1) = ${functions:length(str1)} : str1 문자열의 길이 반환<br>
toUpperCase(str1) = ${functions:toUpperCase(str1)} : str1 문자열 전체 다 대문자<br>
toLowerCase(str1) = ${functions:toLowerCase(str1)} : str1 문자열 전체 다 소문자<br>
substring(str1,3,6) = ${functions:substring(str1,3,6)} : str1 문자열 중 부분 절삭<br>
substringAfter(str1,str2) = ${functions.substringAfter(str1,str2)} : str1 문자열에서 str2 문자열 이후의 문자열 반환<br>
substringBefore(str1, str2) = ${functions.substringBefore(str1, str2)} : st1 문자열에서 str2 문자열 이전의 문자열 반환<br>
contains(str1, str2) = ${functions.contains(str1, str2)} : str1 에 str2 문자열이 있는지 불 형식 반환<br>
trim(str1) = ${functions.trim(str1)} : str1 에서 공백 제거<br>
replace(str1, " ", "-") = ${functions.replace(str1, " " ,"-")} : " " 을 "-" 로 치환<br>
splict(tokens,',') : ,를 기준으로 문자열 나눠서 배열로 리턴<br>

<core:set var = "arr" value = "${functions:split(tokens,',')}"/>
<core:forEach var = "i" items = "${arr}">
	${i} &nbsp;
</core:forEach><br>
<%-- join(arr,'-') = ${functions:join(arr,'-'})<br>--%>
<br>
</body>
</html>