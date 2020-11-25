<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl core tag : for loop</title>
</head>
<body>
<h3> loop tag : forEach</h3>
<c:forEach var = "test" begin = "1" end = "10" step = "2">
${test}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:forEach>
<h3> use forEach tag, return sumation from 1 to 100</h3>
<c:forEach var = "i" begin = "1" end = "100">
<c:set var = "sum" value = "${sum + i }"/>
</c:forEach>
result : ${sum }<br>

<h3> use forEach step tag, return sumation from 1 to 100 which even number</h3>
<c:set var = "sum" value = "${0}"/>
<c:forEach var = "i" begin = "2" end = "100" step = "2">
<c:set var = "sum" value = "${sum + i }"/>
</c:forEach>
even result : ${sum }<br>

<h3> use forEach , if tag, return sumation from 1 to 100 which even number</h3>
<c:set var = "sum" value = "${0}"/>
<c:forEach var = "i" begin = "1" end = "100">
	<c:if test="${i%2 == 0}">
		<c:set var = "sum" value = "${sum + i }"/>
	</c:if>
</c:forEach>
even result : ${sum }<br>

<h3> use forEach step tag, return sumation from 1 to 100 which odd number</h3>
<c:set var = "sum" value = "${0}"/>
<c:forEach var = "i" begin = "1" end = "100" step = "2">
<c:set var = "sum" value = "${sum + i }"/>
</c:forEach>
odd result : ${sum }<br>

<h3> use forEach , if tag, return sumation from 1 to 100 which even number</h3>
<c:set var = "sum" value = "${0}"/>
<c:forEach var = "i" begin = "1" end = "100">
	<c:if test="${i%2 == 1}">
		<c:set var = "sum" value = "${sum + i }"/>
	</c:if>
</c:forEach>
even result : ${sum }<br>

<h3> foreach 태그써서 구구단 출력</h3>
<c:forEach var="i" begin = "2" end = "9">
	<h4>${i}단</h4>
	<c:forEach var = "j" begin = "2" end = "9">
		${i} * ${j} = ${i*j}<br>
	</c:forEach>
</c:forEach>

<h3>forEach 태그를 이용하여 List 객체 출력하기</h3>
<%
	List<Integer> list = new ArrayList<>();
	for(int i = 1; i <= 10; i++){
		list.add(i*10);
	}
	pageContext.setAttribute("list",list);
%>
<c:forEach var = "i" items = "${list}">
	${i}&nbsp;&nbsp;
</c:forEach>

<c:forEach var = "i" items="${list}" varStatus="stat">
	<c:if test = "${stat.index == 0}">
		<h4>forEach 태그의 varStatus 속성 연습</h4>
	</c:if>
	${stat.count}:${i}&nbsp;&nbsp;
</c:forEach>

<h3> 몬제 : 1부터 10까지를 3개씩 출력하기</h3>
<c:forEach var = "i" items = "${list}" varStatus = "stat">
	<c:if test = "${stat.index%3 == 0}"><br>
	</c:if>
	${stat.count}:${i}&nbsp;&nbsp;&nbsp;	
</c:forEach>

<h3> forEach 태그를 이용하여 Map 객체 출력하기</h3>
<%
	Map<String, Object> map = new HashMap<>();
	map.put("name","홍길동");
	map.put("today",new Date());
	map.put("age",20);
	pageContext.setAttribute("map",map);
%>
<c:forEach var = "m" items = "${map}" varStatus = "stat">
	${stat.count}:${m.key} = ${m.value}<br>
</c:forEach>

<h3>forEach 태그를 이용하여 배열 객체 출력하기</h3>
<c:set var = "arr" value = "<%=new int[]{10,20,30,40,50} %>"/>
<c:forEach var = "a" items="${arr}" varStatus = "stat">
	arr[${stat.index}] = ${a}<br>
</c:forEach>
<h3>EL 배열, List 객체 출력하기</h3>
${arr[0]}<br>
${list[9]}<br>

<h3>forEach 태그를 이용하여 배열 객체의 두번째 요소부터 세번째 요소만 출력하기</h3>
<c:forEach var = "a" items = "${arr}" varStatus = "stat" begin = "1" end = "2">
	arr[${stat.index }] = ${a }<br>
</c:forEach>

<h3>forEach 태그를 이용하여 배열 객체의 짝수 인덱스 요소만 출력하기, if 미사용</h3>
<c:forEach var = "a" items = "${arr}" varStatus = "stat" step = "2">
	arr[${stat.index }] = ${a }<br>
</c:forEach>

<h3>forEach 태그를 이용하여 배열 객체의 홀수 인덱스 요소만 출력하기, if 미사용</h3>
<c:forEach var = "a" items = "${arr}" varStatus = "stat" step = "2" begin = "1">
	arr[${stat.index }] = ${a }<br>
</c:forEach>

</body>
</html>