<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 
���� ������!
1. �Ķ���Ͱ� ����
2. db ���� �о ���̵�� ��й�ȣ�� ��
3. ���̵� ���� ���
-> ���̵� �����ϴ�. �޽��� ��� �� loginForm.jsp �������� �̵�
	��й�ȣ�� Ʋ�� ���
-> ��й�ȣ�� Ʋ���ϴ�. �޽�ġ ��� �� loginFrom.jsp ������ �̵�
	���̵�, ��й�ȣ ��ġ
			-session ��ü�� �α��� ���� ����
			- �̸� ���� �α��� �߽��ϴ�. �޽��� ��� �� main.jsp ������ �̵�


 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String msg = "���̵� Ȯ���ϼ���";
	String url = "loginForm.jsp";
	// 1. �Ķ���Ͱ� ����
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	//2. DB ���� �о ���̵�� ��й�ȣ ��
	Member mem = new MemberDao().selectOne(id);
	//3. ���̵� ��й�ȣ ����
	if(mem != null){
		if(pass.equals(mem.getPass())){
			session.setAttribute("login",id);
			//session.setAttribute("name",mem.getName());
			msg = mem.getName() + "���� �α��� �߽��ϴ�.";
			url = "main.jsp";
		}else{
			msg = "��й�ȣ�� Ʋ���ϴ�...";
		}
	}
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>";
</script>
</body>
</html>