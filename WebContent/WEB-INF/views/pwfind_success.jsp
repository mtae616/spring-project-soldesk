<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
var pw_tr = false;
var pw2_tr = false;

$(function() {
	// 비밀번호 유효성 검사
    $("#pw_error").css("color", "red");
    $("#pw_error").text("* 영 대,소문자와 숫자 중 8이상 입력해주세요. ");
    $("#pw").on("keyup", function() {
       reg = /^[A-za-z0-9]{8,}$/;
       text = $(this).val();
       if (!reg.test(text)) {
          $("#pw_error").css("color", "red");
          $("#pw_error").text("* 영 대,소문자와 숫자 중 8이상 입력해주세요. ");
          pw_tr = false;
       } else {
          $("#pw_error").css("color", "blue");
          $("#pw_error").text("* 사용 가능한 비밀번호입니다.");
          pw_tr = true;
       }
    })
    // 비밀번호 확인 유효성 검사
    $("#pw2_error").css("color", "red");
    $("#pw2_error").text("* 비밀번호가 일치하지 않습니다.");
    $("#confirmpw").on("keyup", function() {
       text = $(this).val();
       if (text == $("#pw").val()) {
          $("#pw2_error").css("color", "blue");
          $("#pw2_error").text("* 비밀번호가 일치합니다.");
          pw2_tr = true;
       } else {
          $("#pw2_error").css("color", "red");
          $("#pw2_error").text("* 비밀번호가 일치하지 않습니다.");
          pw2_tr = false;
       }
    })
})

function cl() {
	if(pw_tr == true && pw2_tr == true) {
		return true;
	} else {
		return false;
	}
}
</script>
<style type="text/css">

.content .inner {
	width: 400px;
	height: 400px;
	margin-top: 200px;
}

.content .inner .pw {
	width: 100%;
	height: 50px;
	border-radius: 30px 0px 30px 0px;
	outline: none;
	font-size: large;
}

.content .inner .info {
	width: 100%;
	height: 40px;
	line-height: 50px;
	font-weight: bold;
	font-size: large;
	text-align: left;	
}

.content .inner form>button {
	margin-top: 20px;
	padding: 10px 20px;
	width: 100%;
	background-color: #02343F;
	color: #F0EDCC;
	border-radius: 10px;
}

</style>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />

	<div class="content">
		<div class="inner">
			<form action="pw_update" onsubmit="return cl();">
				<div class="pw1	">
					<div class="info">New Password</div>
					<input type="password" id="pw" class="pw" name="password" />
					<div id="pw_error"></div>
				</div>
				<div class="pw2">
					<div class="info">New Confirm Password</div>
					<input type="password" id="confirmpw" class="pw"/>
					<div id="pw2_error"></div>
				</div>
				<input type="hidden" name="id" value="${id }" />
				<button>변경하기</button>
			</form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>