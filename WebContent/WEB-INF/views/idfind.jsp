<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link href="${root }/css/idfind.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
$(function() {
	// 전화번호 입력 정규식
	$("#tel").on("propertychange change keyup paste input", function() {
		$(this).val($(this).val().replace(/[^0-9]/, "").replace(/(^010)([0-9]{4})?([0-9]{4})/, "$1-$2-$3").replace("--", "-"));
	})
})
function cl() {
	if($(this).val().lengh == 13) {
		return true;
	} else {
		alert("올바른 전화번호를 입력해주세요.");
		return false;
	}
}

</script>
</head>
<body>     
<c:import url="/WEB-INF/views/header.jsp"/>
	<hr>
    <hr>

	<form action="idfind_proc" method="POST" onsubmit="return cl();">
		<div class="body"></div>
	    <div class="grad"></div>
	    <div class="header">
	      <div>Standhal<br><span>Sindrom</span></div>
	    </div>
	    <br>
		<div class="serch">
			<input type="text" name="name" placeholder="Name"/><br>
			<input type="text" name="tel" id="tel" placeholder="Tel" />
			<button type="submit">아이디 찾기</button>
		</div>
	</form>
</body>
</html>