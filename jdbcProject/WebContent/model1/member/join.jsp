<%@page import="osh.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 
1. �Ķ���� ������ member ��ü�� ������ �����̹Ƿ� useBean �׼� �±׸� ����մϴ�...
2. member ��ü�� ����� ������ db�� �߰��մϴ�...
member table ���� �߰��ϱ�!
3. db�κ��� ���� ����, ���� ���п� ���� ������ ������ֱ�
���� ���� : loginForm.jsp �̵�
���� ���� : joinForm.jsp �������� �̵�
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
<%-- �Ķ���Ϳ� Member ��ü�� ������Ƽ�� ���� ���(property="*") setProperty �� �̿�, Member ��ü�� �Ķ���� ���� --%>
<jsp:setProperty property = "*" name = "mem"/>
<%

MemberDao dao = new MemberDao();
//dao.insert ���Ͽ� �����ϸ� ���, ���н� 0, ���� ��ȯ
int result = dao.insert(mem);
String msg = "ȸ������ ����";
String url = "joinForm.jsp";
if(result > 0){
	msg = mem.getName() + "�� ȸ������ �Ϸ�";
	url = "loginForm.jsp";
}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";

</script>
</body>
</html>