<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
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
	if(sessionId == null){ // �α׾ƿ� ����
		%>
		<script>
			alert("�α����ϼ���...");
			location.href = 'loginForm.jsp';
		</script>
		<%
	}else if(!sessionId.equals("admin") && !sessionId.equals(parameterId)){ //�Ϲ� ����� - �Ķ���� ���� ����ġ
		if(!sessionId.equals(parameterId)){
			%>
			<script>
			alert("���θ� Ż�� �����մϴ�...")
			location.href = "main.jsp";
			</script>
			<%
		}
	}else if(parameterId.equals("admin")){ //ID�� �������� ��� Ż�� �Ұ�
		%>
		<script>
		alert("�����ڴ� Ż�� �Ұ����մϴ�...")
		location.href = "list.jsp";
		</script>
		<%
	}else if(sessionId.equals("admin") && !parameterId.equals("admin")){
		if(comparePass.equals(sessionMem.getPass())){
			result = dao.delete(parameterId);
			%>
			<script>
			alert(" ����Ż�� : ����!")
			</script>
			<%
		}else{
			%>
			<script>
			alert("����Ż�� : �������� ��й�ȣ�� Ʋ���ϴ�......")
			location.href = "list.jsp";
			</script>
			<%
		}
	}else if(!sessionId.equals("admin") && parameterId.equals(sessionId)){
		if(comparePass.equals(sessionMem.getPass())){
			result = dao.delete(parameterId);
			%>
			<script>
			alert("Ż�𼺰�")
			</script>
			<%
		}else{
			%>
			<script>
			alert("ȸ������ ��й�ȣ�� Ʋ���ϴ�......")
			location.href = "deleteForm.jsp?id=" + "<%=parameterId%>";
			</script>
			<%
		}
	}
	if(result > 0){
		msg = "��������";
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
		msg = "��������";
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