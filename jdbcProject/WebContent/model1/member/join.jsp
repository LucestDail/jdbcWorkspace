<%@page import="osh.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 
1. 파라매터 정보를 member 객체에 저장할 예정이므로 useBean 액션 태그를 사용합니다...
2. member 객체에 저장된 정보를 db에 추가합니다...
member table 만들어서 추가하기!
3. db로부터 가입 성공, 가입 실패에 대한 조건을 만들어주기
가입 성공 : loginForm.jsp 이동
가입 실패 : joinForm.jsp 페이지로 이동
 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>201117, 11:06, join form source code</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id = "mem" class = "osh.model.Member"/>
<%-- 파라매터와 Member 객체의 프로퍼티가 같은 경우(property="*") setProperty 를 이용, Member 객체에 파라매터 저장 --%>
<jsp:setProperty property = "*" name = "mem"/>
<%

MemberDao dao = new MemberDao();
//dao.insert 통하여 성공하면 양수, 실패시 0, 음수 반환
int result = dao.insert(mem);
String msg = "회원가입 실패";
String url = "joinForm.jsp";
if(result > 0){
	msg = mem.getName() + "님 회원가입 완료";
	url = "loginForm.jsp";
}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";

</script>
</body>
</html>