<%@page import="osh.model.Member"%>
<%@page import="osh.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 
1. 모든 파라매터 정보를 Member 객체에 저장 => useBean 태그
2. 입력된 비밀번호와 데이터베이스에 저장된 비밀번호 비교
-> 같지 않은 경우 : "비밀번호 오류" 메시지 출력, updateForm.jsp 페이지 이동
3. 파라매터를 저장하고 있는 Member 객체를 이용하여 데이터베이스 정보 수정
int MemberDao.update(Member)
결과가 0 이하면 수정실패 메시지 출력후 updateForm.jsp 페이지 이동
1 이상이면 수정 성공 => info.jsp 페이지로 이동
 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id = "mem" class = "osh.model.Member"/>
<%-- 1. 모든 파라매터 정보를 Member 객체에 저장 --%>
<jsp:setProperty property = "*" name = "mem"/>
<%
String sessionId = (String)session.getAttribute("login");
MemberDao dao = new MemberDao();
Member dbMem = null;
if(sessionId.equals("admin")){
	dbMem = dao.selectOne(sessionId);
}else{
	dbMem= dao.selectOne(mem.getId());	
}
String msg = "비밀번호 오류 실패";
String url = "updateForm.jsp?id="+mem.getId();
if(mem.getPass().equals(dbMem.getPass())){
	int result = dao.update(mem);
	if(result > 0){
		msg = "수정성공";
		url = "info.jsp?id=" + mem.getId();
	}else{
		msg = "수정실패";
	}
}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
</body>
</html>