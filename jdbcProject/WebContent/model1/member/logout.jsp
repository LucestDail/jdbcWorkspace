<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 
1. session �α��� ���� ����
2. loginForm.jsp ������ �̵�

1. session �α��� ���� ����
2. �α׾ƿ� �ϼ̽��ϴ�.
--%>
<%-- ���� ���� �����ϰ� ���ο� �������� �ٲ��ִ� ���� session.invalidate() �Դϴ�... --%>
<script type="text/javascript">
alert("�α׾ƿ��ϼ̽��ϴ�...");
location.href="loginForm.jsp";
</script>
<%
//session.invalidate();
session.removeAttribute("login");
%>