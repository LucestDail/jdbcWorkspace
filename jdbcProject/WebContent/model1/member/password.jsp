<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- �α׾ƿ� ������ ���
		-> �α��� �ϼ��� �޽��� ���
	�ٸ�������� ��й�ȣ ���� �Ұ� => �α��ε� id���� ���氡��. ���θ� ����
	opener(ȸ�� ���� ������)�� loginForm.jsp �������� �̵� -> ���� ������ �ݱ�
	pass, chgpass �Ķ���� �� ����
	
	pass ��й�ȣ db�� ����� ��й�ȣ Ʋ���� ��й�ȣ ���� �޽��� ���.
	passwordForm.jsp �������� �̵�
	
	pass ��й�Ȥ db�� ���嵵�� ��й�ȣ�� ������
	MemberDao.updatePass(login, chgpass) ��й�ȣ ����
	��й�ȣ ���� ����.
	�޽��� ���
	opener �������� info.jsp �������� �̵�. ���������� �ݱ�
	
	��й�ȣ ���� ����
	opener �������� updateForm.jsp ������ �̵�
	���� ������ �ݱ�
	���� ������ �ݱ�
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
		msg = "�α����ϼ���...";
		url = "loginForm.jsp";
	}else{
		String pass = request.getParameter("pass");
		String chgpass = request.getParameter("chgpass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(sessionId);
		if(pass.equals(mem.getPass())){
			if(dao.updatePass(sessionId,chgpass) > 0){
				msg = "��й�ȣ�� ����Ǿ����ϴ�!";
				url = "info.jsp?id="+sessionId;;
			}else{
				msg = "��й�ȣ ���� ����";
				url = "updateForm.jsp?id="+sessionId;
			}
			
		}else{
			opener = false;
			closer = false;
			msg = "��й�ȣ �����Դϴ�... ";
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