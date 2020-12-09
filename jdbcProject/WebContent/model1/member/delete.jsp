<%@page import="osh.model.Member"%>
<%@page import="osh.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String parameterId = request.getParameter("id");
	request.setCharacterEncoding("euc-kr");
	String sessionId = (String)session.getAttribute("login");
	String comparePass = request.getParameter("pass");
	MemberDao dao = new MemberDao();
	Member parameterMem = new MemberDao().selectOne(parameterId);
	Member sessionMem = new MemberDao().selectOne(sessionId);
	String msg = null;
	String url = null;
	int result = 0;
	if(sessionId == null){ // 로그아웃 상태
		%>
		<script>
			alert("로그인하세요...");
			location.href = 'loginForm.jsp';
		</script>
		<%
	}else if(!sessionId.equals("admin") && !sessionId.equals(parameterId)){ //일반 사용자 - 파라매터 세션 불일치
		if(!sessionId.equals(parameterId)){
			%>
			<script>
			alert("본인만 탈퇴가 가능합니다...")
			location.href = "main.jsp";
			</script>
			<%
		}
	}else if(parameterId.equals("admin")){ //ID가 관리자인 경우 탈퇴 불가
		%>
		<script>
		alert("관리자는 탈퇴가 불가능합니다...")
		location.href = "list.jsp";
		</script>
		<%
	}else if(sessionId.equals("admin") && !parameterId.equals("admin")){
		if(comparePass.equals(sessionMem.getPass())){
			result = dao.delete(parameterId);
			%>
			<script>
			alert(" 강제탈퇴 : 성공!")
			</script>
			<%
		}else{
			%>
			<script>
			alert("강제탈퇴 : 관리자의 비밀번호가 틀립니다......")
			location.href = "list.jsp";
			</script>
			<%
		}
	}else if(!sessionId.equals("admin") && parameterId.equals(sessionId)){
		if(comparePass.equals(sessionMem.getPass())){
			result = dao.delete(parameterId);
			%>
			<script>
			alert("탈퇴성공")
			</script>
			<%
		}else{
			%>
			<script>
			alert("회원님의 비밀번호가 틀립니다......")
			location.href = "deleteForm.jsp?id=" + "<%=parameterId%>";
			</script>
			<%
		}
	}
	if(result > 0){
		msg = "삭제성공";
		if(sessionId.equals("admin")){
			url = "list.jsp";
		}else{
			session.removeAttribute(sessionId);
			%>
			<script>
			location.href = "loginForm.jsp";
			</script>
			<%
		}
	}else{
		msg = "삭제실패";
		if(sessionId.equals("admin")){
			url = "list.jsp?id="+sessionId;
		}else{
			url = "info.jsp?id="+parameterId;
		}
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
</body>
</html>