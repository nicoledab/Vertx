<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="/Vertx/js/jquery-1.10.2.min.js"></script>
<script src="/Vertx/js/socket.io.js"></script>
<script>
	$(document).ready(function() {
		var socket = io.connect("http://192.168.45.81:12345");  //서버연결  본인 아이피로 변경 
		socket.on('response', function(msg){// 서버로부터 채팅메세지를 계속 받고있다. .. 
			$('#msgs').append(params.msg+'<BR>');		// 채팅 메세지 받아 출력 부분..
			$('#msgs').append(params.id+'<BR>');		// 채팅 메세지 받아 출력 부분..
		});
		
		
		// 텍스트박스내부의 채팅 내용 보내기
		$("#sendBtn").bind("click", function() {	
			var chat = $("input[name=chat]").val();
			socket.emit('msg', {msg:chat,id:'java'});   // 보내기
		              // on    msg라는 파라미터  이름:값 
		});
	});
</script>
</head>

<body>
	<h1>Main</h1>
	<input type="text" name="chat" />
	<input type="button" value="send" id="sendBtn" />
	 <span id="msgs"></span>
</body>

</html>