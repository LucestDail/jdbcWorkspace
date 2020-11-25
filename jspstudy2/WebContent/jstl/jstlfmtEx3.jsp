<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt �±� : ���ڵ�</title>
</head>
<body>
<fmt:requestEncoding value = "euc-kr"/>
<fmt:setLocale value="ko_KR"/>
<form method = "post" name = "f">
	�̸� : <input type = "text" name = "name" value = "${param.name}"><br>
	�Ի� : <input type = "text" name = "hiredate" value = "${param.hiredate}"><br>
	�޿� : <input type = "text" name = "salary" value = "${param.salary}"><br>
	<core:set var = "jobs" value = "${functions:join(paramValues.job,',')}"/>
	���� : <input type = "checkbox" name = "job" value = "����" <core:if test = "${functions:contains(jobs,'����')}">checked</core:if>>����
		 <input type = "checkbox" name = "job" value = "����" <core:if test = "${functions:contains(jobs,'����')}">checked</core:if>>����
		 <input type = "checkbox" name = "job" value = "��" <core:if test = "${functions:contains(jobs,'��')}">checked</core:if>>��
		 <input type = "checkbox" name = "job" value = "���" <core:if test = "${functions:contains(jobs,'���')}">checked</core:if>>���
		 <input type = "checkbox" name = "job" value = "��Ÿ" <core:if test = "${functions:contains(jobs,'��Ÿ')}">checked</core:if>>��Ÿ<br>
		 <input type = "submit" value = "����">
</form><hr>
�̸� : ${param.name}<br>
�Ի� : ${param.hiredate}<br>
�޿� : ${param.salary}<br>
���� : ${param.job}<br>
��� : <core:forEach var = "j" items="${paramValues.job}">
		${j}&nbsp;&nbsp;&nbsp;
		</core:forEach>
<br>

<h3> ���� : �Ի����� yyyy�� MM�� dd�� E���� ���·� ����ϰ�, �޿��� 3�ڸ����� , �޸� ���, ����(����*12) ����ϱ�</h3>
<core:catch var = "formateexception">
<fmt:parseDate value="${param.hiredate}" pattern = "yyyy-MM-dd" var = "hiredate"/>
</core:catch>
<core:if test = "${formateexception != null}">
�Ի����� yyyy-MM-dd ���·� �Է��ϼ���...<br>
</core:if>
<fmt:formatDate var = "dateform" value = "${hiredate}" pattern = "yyyy��MM��dd��E����"/>
�Ի�(����) : <core:out value = "${dateform }"/><br>
<fmt:formatNumber var = "salaryform" value = "${param.salary}" pattern = "###,###"/>
�޿�(����) : <core:out value = "${salaryform }"/>
<br>
<fmt:formatNumber var = "yearSalary"  value = "${param.salary * 12 }" pattern = "###,###"/>
���� : <core:out value = "${yearSalary }"/><br>
</body>
</html>