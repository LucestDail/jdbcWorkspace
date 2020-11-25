<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>elEx1.jsp의 결과 화면</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String tel = "010-1111-2222";
	pageContext.setAttribute("tel", tel);
	pageContext.setAttribute("test","pageContext test 속성");
	request.setAttribute("test","request test 속성");
	application.setAttribute("test","application test 속성");
%>
<h3>jsp 스크립트를 이용하여 파라매터와 속성값 출력</h3>
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

<h3> 영역을 설정하여 test 속성값 출력하기</h3>
\${test} = ${test}<br>
\${pageScope.test} = ${pageScope.test}<br>
\${requestScope.test} = ${requestScope.test}<br>
\${sessionScope.test} = $}sessionScope.test}<br>
\${applicationScope.test} = ${applicationScope.test}<br>
\${tel} = ${tel}<br>
\${requestScope.tel} = ${requestScope.tel}<br>
\${today} = ${sessionScope.today}<br>
<%--
${test} : 영역담당 객체에 저장된 속성 중 이름이 test 인 속성값을 반환
1. pageContext 객체에 저장된 속성 중 이름이 test 속성의 값을 반환
2. 1번이 없는 경우 request 객체에 저장된 속성 중 이름이 test 속성의 값을 반환
3. 2번이 없는 경우 session 객체에 저장된 속성 중 이름이 test 속성의 값을 반환
4. 3번이 없는 경우 application 객체에 저장된 속성 중 이름이 test 속성의 값을 반환
5. 4번이 없는 경우 null 이 아닌, 아무것도 출력하지 않습니다!

꼭 짚어서 출력하고 싶은 경우는 scope 키워드를 사용
직접 영역담당 객체에 접근
pageContext 중 test 접근 : ${pageScope.test}
request 중 test 접근 : ${requestScope.test}
session 중 test 접근 : ${sessionScope.test}
application 중 test 접근 : ${applicationScope.test}




 --%>

</body>
</html>