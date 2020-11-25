<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h3> Format 된 숫자를 일반 숫자로 변경</h3>
<fmt:parseNumber value = "20,000" var = "num1" pattern = "##,###"/>
<fmt:parseNumber value = "10,000" var = "num2" pattern = "##,###"/>
합 : ${num1 + num2 }<br>

<h3> 문제 : 20,000 + 10,000 = 30,000 이렇게 출력해보기</h3>
<fmt:formatNumber value = "${num1}" var = "snum1" pattern = "##,###"/>
<fmt:formatNumber value = "${num2}" var = "snum2" pattern = "##,###"/>
<fmt:formatNumber value = "${num1 + num2}" var = "snum3" pattern = "##,###"/>
${snum1} + ${snum2} = ${snum3}<br>

<h3> Format 된 날짜를 날짜형으로 변경</h3>
<fmt:parseDate value = "2020-12-25 12:00:00" var = "dnum1" pattern = "yyyy-MM-dd HH:mm:ss"/>
${dnum1}<br>

<h3> 문제 : 2020-12-25 일의 요일 출력하기 </h3>
<fmt:setLocale value="ko_KR"/>
<fmt:formatDate value = "${dnum1}" var = "dnum2" pattern ="yyyy-MM-dd E요일"/>
${dnum2}<br>
</body>
</html>