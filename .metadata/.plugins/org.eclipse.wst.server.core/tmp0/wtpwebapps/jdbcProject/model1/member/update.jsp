<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 
1. ��� �Ķ���� ������ Member ��ü�� ���� => useBean �±�
2. �Էµ� ��й�ȣ�� �����ͺ��̽��� ����� ��й�ȣ ��
-> ���� ���� ��� : "��й�ȣ ����" �޽��� ���, updateForm.jsp ������ �̵�
3. �Ķ���͸� �����ϰ� �ִ� Member ��ü�� �̿��Ͽ� �����ͺ��̽� ���� ����
int MemberDao.update(Member)
����� 0 ���ϸ� �������� �޽��� ����� updateForm.jsp ������ �̵�
1 �̻��̸� ���� ���� => info.jsp �������� �̵�
 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id = "mem" class = "model.Member"/>
<%-- 1. ��� �Ķ���� ������ Member ��ü�� ���� --%>
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
String msg = "��й�ȣ ���� ����";
String url = "updateForm.jsp?id="+mem.getId();
if(mem.getPass().equals(dbMem.getPass())){
	int result = dao.update(mem);
	if(result > 0){
		msg = "��������";
		url = "info.jsp?id=" + mem.getId();
	}else{
		msg = "��������";
	}
}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
</body>
</html>