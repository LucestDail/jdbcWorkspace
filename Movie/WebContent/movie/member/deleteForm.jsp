<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<style>
   #centerPosition {  
     position:absolute;
     height:100px;
     width:550px;
     margin:-150px 0px 0px -200px;
     top: 60%;
     left: 45%;
     padding: 5px;
   }

</style>
</head>
<body>
<script>
	function inputcheck(f){
		if(f.pass.value == ""){
			alert("��й�ȣ�� �Է��ϼ���...");
			f.pass.focus();
			return false;
		}
		return true;
	}
</script>
<div id = "centerPosition">
<form action="delete.me" method="post" onsubmit = "return inputcheck(this)">
<input type="hidden" name="id" value="${param.id}">
<table>
	<caption>Ż���Ͻ÷��� ��й�ȣ�� �Է����ּ���</caption>
	<tr>
		<th>��й�ȣ</th>
		<td><input type = "password" name = "password">
	</tr>
	<tr>
		<td colspan = "2"><input type = "submit" value = "Ż���ϱ�" class = "redbutton"></td>
	</tr>
</table>
</form>
</div>
</body>
</html>