<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL core �±�</title>
</head>
<body>
<h3>�Ӽ� ���� �±� : set, remove, out �±�</h3>
<%-- c  ��� �Ӽ����� ���� ���� -> c:set --%>
<c:set var = "test" value = "${'hello jstl'}" scope = "session"/>
test �Ӽ� : ${sessionScope.test}<br>
test �Ӽ� : <c:out value = "${test }"/><br><%-- c ��� �Ӽ����� value ���� ��� --%>
test �Ӽ� : ${test }<br>
<c:remove var = "test"/>
test �Ӽ� : ${test }<br>
</body>
</html>