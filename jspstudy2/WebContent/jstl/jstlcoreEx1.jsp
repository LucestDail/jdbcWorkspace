<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL core 태그</title>
</head>
<body>
<h3>속성 관련 태그 : set, remove, out 태그</h3>
<%-- c  라는 속성값에 값을 저장 -> c:set --%>
<c:set var = "test" value = "${'hello jstl'}" scope = "session"/>
test 속성 : ${sessionScope.test}<br>
test 속성 : <c:out value = "${test }"/><br><%-- c 라는 속성값의 value 값을 출력 --%>
test 속성 : ${test }<br>
<c:remove var = "test"/>
test 속성 : ${test }<br>
</body>
</html>