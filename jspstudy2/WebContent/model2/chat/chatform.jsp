<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "decorator" uri = "http://www.opensymphony.com/sitemesh/decorator" %>
<core:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ä�� ȭ��</title>
</head>
<body>
<div style = "width:100%;">
	<textarea rows = "10" cols = "50" readonly = "readonly" id = "messageWindow" style = "width:80%;">
	</textarea>
	<input id = "inputMessage" type = "text" style = "width:80%;" onkeydown = "keyin()">
	<input type = "button" value = "����" onclick = "send()">
</div>
<script type = "text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket("ws://192.168.4.111:8080${path}/chatting");
	var inputMessage = document.getElementById("inputMessage");
	webSocket.onerror = function(event){
		onError(event)
	}
	webSocket.onopen = function(event){
		onOpen(event);
		alert("��ſ� ä��! ��Ӿ�� �ȵǿ�!")
	}
	webSocket.onmessage = function(event){
		onMessage(event)
	}
	function onMessage(event){
		textarea.value += event.data + "\n";
	}
	function onOpen(event){
		textarea.value += "���� ����\n";
	}
	function onError(event){
		alert("���� ���� : " + event.data)
	}
	function send(){
		textarea.value += "${sessionScope.login} : " + inputMessage.value + "\n";
		webSocket.send('${sessionScope.login} : ' + inputMessage.value);
		inputMessage.value = "";
	}
	function keyin(){
		if(event.keyCode == 13){
			send()
		}
	}
</script>
</body>
</html>