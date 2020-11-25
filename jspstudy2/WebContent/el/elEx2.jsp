<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>elEx1.jsp�� ��� ȭ��</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String tel = "010-1111-2222";
	pageContext.setAttribute("tel", tel);
	pageContext.setAttribute("test","pageContext test �Ӽ�");
	request.setAttribute("test","request test �Ӽ�");
	application.setAttribute("test","application test �Ӽ�");
%>
<h3>jsp ��ũ��Ʈ�� �̿��Ͽ� �Ķ���Ϳ� �Ӽ��� ���</h3>
pageContext.getAttribute("test") : <%=pageContext.getAttribute("test") %><br>
session.getAttribute("test") : <%=session.getAttribute("test") %><br>
session.getAttribute("today") : <%=session.getAttribute("today") %><br>
request.getParameter("name") : <%=request.getParameter("name") %><br>
tel : <%=tel %><br>
pageContext.getAttribute("tel") : <%=pageContext.getAttribute("tel") %><br>
pageContext.getAttribute("noAttr") : <%=pageContext.getAttribute("noAttr") %><br>
request.getParameter("noparam") : <%=request.getParameter("noparam") %><br>
<hr>
<h3> jsp el expression</h3>
test : ${test}<br>
sessionScope.test : ${sessionScope.test}<br>
today : ${today }<br>
param.name : ${param.name }<br>
tel : <%=tel %><br>
tel : ${tel }<br>
noAttr : ${noAttr }<br>
noparma : ${param.noparam }<br>

<h3> ������ �����Ͽ� test �Ӽ��� ����ϱ�</h3>
\${test} = ${test}<br>
\${pageScope.test} = ${pageScope.test}<br>
\${requestScope.test} = ${requestScope.test}<br>
\${sessionScope.test} = $}sessionScope.test}<br>
\${applicationScope.test} = ${applicationScope.test}<br>
\${tel} = ${tel}<br>
\${requestScope.tel} = ${requestScope.tel}<br>
\${today} = ${sessionScope.today}<br>
<%--
${test} : ������� ��ü�� ����� �Ӽ� �� �̸��� test �� �Ӽ����� ��ȯ
1. pageContext ��ü�� ����� �Ӽ� �� �̸��� test �Ӽ��� ���� ��ȯ
2. 1���� ���� ��� request ��ü�� ����� �Ӽ� �� �̸��� test �Ӽ��� ���� ��ȯ
3. 2���� ���� ��� session ��ü�� ����� �Ӽ� �� �̸��� test �Ӽ��� ���� ��ȯ
4. 3���� ���� ��� application ��ü�� ����� �Ӽ� �� �̸��� test �Ӽ��� ���� ��ȯ
5. 4���� ���� ��� null �� �ƴ�, �ƹ��͵� ������� �ʽ��ϴ�!

�� ¤� ����ϰ� ���� ���� scope Ű���带 ���
���� ������� ��ü�� ����
pageContext �� test ���� : ${pageScope.test}
request �� test ���� : ${requestScope.test}
session �� test ���� : ${sessionScope.test}
application �� test ���� : ${applicationScope.test}




 --%>

</body>
</html>