<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>EL에서 연산자 사용하기</title>
</head>
<body>
<h3>\${20+10} = ${20+10}</h3><br>
<h3>\${20-10} = ${20-10}</h3><br>
<h3>\${20*10} = ${20*10}</h3><br>
<h3>\${20/10} = ${20/10}</h3><br>
<h3>\${20 mod 10} = ${20 mod 10}</h3><br>
<h3>\${20 == 10} = ${20 == 10}</h3><br>
<h3>\${20 eq 10} = ${20 eq 10}</h3><br>
<h3>\${20 !=10} = ${20 !=10}</h3><br>
<h3>\${20 >=10} = ${20 >=10}</h3><br>
<h3>\${20 ge 10} = ${20 ge 10}</h3><br>
<h3>\${20 < 10} = ${20 < 10}</h3><br>
<h3>\${20 lt 10} = ${20 lt 10}</h3><br>
<h3>\${20 >10} = ${20 !=10}</h3><br>
<h3>\${20 gt 10} = ${20 gt 10}</h3><br>
<h3>\${5+4==8?8:10} = ${5+4==8?8:10}</h3><br>
<h3>\${10} = ${10}</h3><br>
<h3>\${'test'} = ${'test'}</h3><br>

</body>
</html>