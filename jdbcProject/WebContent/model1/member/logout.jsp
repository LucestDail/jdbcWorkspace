<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 
1. session 로그인 정보 제거
2. loginForm.jsp 페이지 이동

1. session 로그인 정보 제거
2. 로그아웃 하셨습니다.
--%>
<%-- 기존 세션 만료하고 새로운 세션으로 바꿔주는 것이 session.invalidate() 입니다... --%>
<script type="text/javascript">
alert("로그아웃하셨습니다...");
location.href="loginForm.jsp";
</script>
<%
//session.invalidate();
session.removeAttribute("login");
%>