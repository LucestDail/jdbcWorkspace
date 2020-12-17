<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<core:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/main.css">
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
</head>
<body>
  <div class="wrapper">
    <form class="form-signin">       
      <h2 class="form-signin-heading">환영합니다</h2>
      <input type="text" class="form-control" name="id" placeholder="Email Address" required="" autofocus="" />
      <input type="password" class="form-control" name="pass" placeholder="Password" required=""/>      
      <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
      <button class="btn btn-lg btn-primary btn-block" type = "button" value = "아이디찾기" onclick = "win_open('idForm')">아이디 찾기</button>
      <button class="btn btn-lg btn-primary btn-block" type = "button" value = "비밀번호찾기" onclick = "win_open('pwForm')">비밀번호 찾기</button>
    </form>
  </div>
</body>
</html>