<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt 태그 : 인코딩</title>
</head>
<body>
<fmt:requestEncoding value = "euc-kr"/>
<fmt:setLocale value="ko_KR"/>
<form method = "post" name = "f">
	이름 : <input type = "text" name = "name" value = "${param.name}"><br>
	입사 : <input type = "text" name = "hiredate" value = "${param.hiredate}"><br>
	급여 : <input type = "text" name = "salary" value = "${param.salary}"><br>
	<core:set var = "jobs" value = "${functions:join(paramValues.job,',')}"/>
	업무 : <input type = "checkbox" name = "job" value = "서무" <core:if test = "${functions:contains(jobs,'서무')}">checked</core:if>>서무
		 <input type = "checkbox" name = "job" value = "개발" <core:if test = "${functions:contains(jobs,'개발')}">checked</core:if>>개발
		 <input type = "checkbox" name = "job" value = "비서" <core:if test = "${functions:contains(jobs,'비서')}">checked</core:if>>비서
		 <input type = "checkbox" name = "job" value = "운용" <core:if test = "${functions:contains(jobs,'운용')}">checked</core:if>>운용
		 <input type = "checkbox" name = "job" value = "기타" <core:if test = "${functions:contains(jobs,'기타')}">checked</core:if>>기타<br>
		 <input type = "submit" value = "전송">
</form><hr>
이름 : ${param.name}<br>
입사 : ${param.hiredate}<br>
급여 : ${param.salary}<br>
업무 : ${param.job}<br>
담당 : <core:forEach var = "j" items="${paramValues.job}">
		${j}&nbsp;&nbsp;&nbsp;
		</core:forEach>
<br>

<h3> 문제 : 입사일을 yyyy년 MM월 dd일 E요일 형태로 출력하고, 급여는 3자리마다 , 콤마 출력, 연봉(연봉*12) 출력하기</h3>
<core:catch var = "formateexception">
<fmt:parseDate value="${param.hiredate}" pattern = "yyyy-MM-dd" var = "hiredate"/>
</core:catch>
<core:if test = "${formateexception != null}">
입사일은 yyyy-MM-dd 형태로 입력하세요...<br>
</core:if>
<fmt:formatDate var = "dateform" value = "${hiredate}" pattern = "yyyy년MM월dd일E요일"/>
입사(형식) : <core:out value = "${dateform }"/><br>
<fmt:formatNumber var = "salaryform" value = "${param.salary}" pattern = "###,###"/>
급여(형식) : <core:out value = "${salaryform }"/>
<br>
<fmt:formatNumber var = "yearSalary"  value = "${param.salary * 12 }" pattern = "###,###"/>
연봉 : <core:out value = "${yearSalary }"/><br>
</body>
</html>