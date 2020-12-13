<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "decorator" uri = "http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>send mail</title>
<script type="text/javascript">
	function idinputchk(f){
		if(f.naverid.value == ""){
			alert("���̹� ���̵� �Է��ϼ���");
			f.naverid.focus();
			return false;
		}
		if(f.naverpw.value == ""){
			alert("���̹� ��й�ȣ�� �Է��ϼ���");
			f.naverpw.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<h2>���� ������</h2>
	<form name = "mailform" method = "post" action = "mail.me" onsubmit = "return idinputchk(this)">
		<table>
			<tr>
				<td> ���� ���̹� ID</td>
				<td><input type = "texT" name = "naverid"></td>
			</tr>
			<tr>
				<td> ���� ���̹� PW</td>
				<td><input type = "password" name = "naverpw"></td>
			</tr>
			<tr>
				<td>�޴� ���</td>
				<td>
					<input type = "text" name = "recipient" size = "100" value = '<core:forEach items = "${list}" var="mail">${mail},</core:forEach>'>
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type = "text" name = "title" size = "100"></td>
			</tr>
			<tr>
				<td>�޽��� ����</td>
				<td>
					<select name = "mtype">
						<option value = "text/html; charset = EUC-KR">HTML</option>
						<option value = "text/plain; charset = EUC-KR">TEXT</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan = "2">
					<textarea name = "contents" cols = "120" rows = "10"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan = "2">
					<input type = "submit" value = "���� ������">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>