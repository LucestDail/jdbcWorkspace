<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 1. 로그인 여부 검증
로그인 상태 : 현재 화면
로그인이 admin 인 경우는 회원목록 보기 추가하기!
로그아웃 상태 : 로그인하세요. 메시지 출력 후 loginForm.jsp 로 페이지 이동하기
 --%>
 <%
 String login = (String)session.getAttribute("login");
 if(login != null){%>
<html>
<head>
<meta charset="EUC-KR">
<title>회원관리</title>
<link rel = "stylesheet" href = "../../css/main.css">
</head>
<body>
<table><caption>Welcome!</caption>
	<tr>
		<th><%=login %> 로그인 되었습니다.</th>
	</tr>
	<tr>
		<td><a href = "logout.jsp">로그아웃</a></td>
	</tr>
	<tr>
		<td><a href = "info.jsp?id=<%=login%>">회원정보보기</a></td>
	</tr>
	<% if(login.equals("admin")){ %>
	<tr>
		<td><a href = "list.jsp?id=<%=login%>"> 회원목록 보기</a></td>
	</tr>
	<% } %>
</table>
</body>
</html>
<% } else { %>
<script>
alert("로그인하세요")
location.href = "loginForm.jsp"
</script>
<% }%>