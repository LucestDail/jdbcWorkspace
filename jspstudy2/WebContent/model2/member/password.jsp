<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
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

<script>
	alert("${msg}");
	<core:if test = "${opener}">
		opener.location.href="${url}";
	</core:if>
	<core:if test = "${!opener}">
		location.href="${url}";
	</core:if>
	<core:if test="${closer}">
		self.close();
	</core:if>
	</script>
</body>
</html>