<%@page import="osh.model.Member"%>
<%@page import="osh.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 로그아웃 상태인 경우
		-> 로그인 하세요 메시지 출력
	다른사용자의 비밀번호 변경 불가 => 로그인된 id값만 변경가능. 본인만 변경
	opener(회원 수정 페이지)를 loginForm.jsp 페이지로 이동 -> 현재 페이지 닫기
	pass, chgpass 파라매터 값 저장
	
	pass 비밀번호 db에 저장된 비밀번호 틀리면 비밀번호 오류 메시지 출력.
	passwordForm.jsp 페이지로 이동
	
	pass 비밀번혹 db에 저장도니 비밀번호와 같으면
	MemberDao.updatePass(login, chgpass) 비밀번호 수정
	비밀번호 수정 성공.
	메시지 출력
	opener 페이지를 info.jsp 페이지로 이동. 현재페이지 닫기
	
	비밀번호 수정 실패
	opener 페이지를 updateForm.jsp 페이지 이동
	혀재 페이지 닫기
	현재 페이지 닫기
	 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href = "../css/main.css">
</head>
<body>
<%
	String sessionId = (String)session.getAttribute("login");
	boolean opener = true;
	boolean closer = true;
	String url = null;
	String msg = null;
	if(sessionId == null){
		msg = "로그인하세용...";
		url = "loginForm.jsp";
	}else{
		String pass = request.getParameter("pass");
		String chgpass = request.getParameter("chgpass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(sessionId);
		if(pass.equals(mem.getPass())){
			if(dao.updatePass(sessionId,chgpass) > 0){
				msg = "비밀번호가 변경되었습니당!";
				url = "info.jsp?id="+sessionId;;
			}else{
				msg = "비밀번호 변경 실패";
				url = "updateForm.jsp?id="+sessionId;
			}
			
		}else{
			opener = false;
			closer = false;
			msg = "비밀번호 오류입니당... ";
			url = "passwordForm.jsp";
		}
	}
%>
<script>
	alert("<%=msg%>");
	<% if(opener){%>
		opener.location.href = "<%=url%>";
	<%}else {%>
	location.href = "<%=url%>";
	<%}%>
	<%if(closer){%>
		self.close();
	<%}%>
	</script>
</body>
</html>