<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type = "text/javascript">
	function inputcheck(f){
		if(f.id.value == ''){
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		if(f.id.value.length < 4){
			alert("아이디는 4자리 이상 입력하세요");
			f.id.focus();
			return false;
		}
		if(f.pass.value == ''){
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return false;
		}
		return true;
	}
	function win_open(page){
		var op = "width = 500, height=350, left=50, top=150";
		open(page + ".me","",op);
	}
</script>
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
<div id = "centerPosition">
<form action = "login.me" method="post" name = "f" onsubmit = "return inputcheck(this)">
	<table>
		<tr>
			<td align = "center">
				<input type = "text" name = "id" onfocus="this.value=''" value = "아이디를 입력하세요">
			</td>
			<td rowspan = "2">
				<input type = "submit" class = "normalbutton" value = "로그인">
			</td>
		</tr>
		<tr>
			<td align = "center">
				<input type = "password" name = "pass" onfocus="this.value=''" value = "비밀번호를 입력하세요">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<input type = "button" class = "redbutton" value = "회원가입" onclick = "location.href = 'joinForm.me'">
				<input type = "button" class = "normalbutton" value = "아이디찾기" onclick = "win_open('idForm')">
				<input type = "button" class = "normalbutton" value = "비밀번호찾기" onclick = "win_open('pwForm')">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>