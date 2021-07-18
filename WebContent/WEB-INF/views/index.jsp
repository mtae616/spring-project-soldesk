<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Web Socket Example</title>
</head>
<body>
	<form>
		<input id="textMessage" type="text">
		<input onclick="sendMessage()" value="Send" type="button">
		<input onclick="disconnect()" value="Disconnect" type="button">
	</form>
	<br />
	<textarea id="messageTextArea" rows="10" cols="50"></textarea>
	<script type="text/javascript">
	</script>
</body>
</html>