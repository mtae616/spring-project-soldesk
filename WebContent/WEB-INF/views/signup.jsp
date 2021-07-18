<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>signup</title>
<link href="${root }/css/signup.css" rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	// 가입 조건 만장일치
	var tr = false;
	var name_tr = false;
	var id_tr = false;
	var pw_tr = false;
	var pw2_tr = false;
	var tel_tr = false;

	// 아이디 중복체크
	var idcheck;

	// 유효성 검사
	var text;
	var reg;
	$(function() {

		// 이름 유효성 검사
		$("#name_error").css("color", "red");
		$("#name_error").text("* 한글로 된 2 ~ 10자를 입력해주세요. ");
		$("#u_name").on("keyup", function() {
			reg = /^[가-힣]{2,10}$/;
			text = $(this).val();
			if (!reg.test(text)) {
				$("#name_error").css("color", "red");
				$("#name_error").text("* 한글로 된 2 ~ 10자를 입력해주세요. ");
				name_tr = false;
			} else {
				$("#name_error").css("color", "blue");
				$("#name_error").text("");
				name_tr = true;
			}
		})
		// 아이디 유효성 검사
		$("#id_error").css("color", "red");
		$("#id_error").text("* 영 대,소문자와 숫자로 5자 이상을 입력해주세요. ");
		$("#u_id").on("propertychange change keyup paste input", function() {
			reg = /^[a-z]{1}[a-z0-9]{4,}$/;
			id = $(this).val();
			idValidate(id);
			if (idcheck == "false") {
				$("#id_error").css("color", "red");
				$("#id_error").text("* 이미 사용중인 아이디입니다.");
				id_tr = false;
			} else if (!reg.test(id)) {
				$("#id_error").css("color", "red");
				$("#id_error").text("* 영 대,소문자와 숫자로 5자 이상을 입력해주세요. ");
				id_tr = false;
			} else {
				$("#id_error").css("color", "blue");
				$("#id_error").text("* 사용 가능한 아이디입니다.");
				id_tr = true;
			}
		})
		// 비밀번호 유효성 검사
		$("#pw_error").css("color", "red");
		$("#pw_error").text("* 영 대,소문자와 숫자 중 8이상 입력해주세요. ");
		$("#u_pw").on("keyup", function() {
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
		$("#u_pw2").on("keyup", function() {
			text = $(this).val();
			if (text == $("#u_pw").val()) {
				$("#pw2_error").css("color", "blue");
				$("#pw2_error").text("* 비밀번호가 일치합니다.");
				pw2_tr = true;
			} else {
				$("#pw2_error").css("color", "red");
				$("#pw2_error").text("* 비밀번호가 일치하지 않습니다.");
				pw2_tr = false;
			}
		})
		// 전화번호 유효성 검사
		$("#tel_error").css("color", "red");
		$("#tel_error").text("* 전화번호 11자를 입력해주세요.");
		$("#u_tel").on(
				"keyup",
				function() {
					$(this).val(
							$(this).val().replace(/[^0-9]/, "").replace(
									/(^010)([0-9]{4})?([0-9]{4})/, "$1-$2-$3")
									.replace("--", "-"));
					if ($("#u_tel").val().length == 13) {
						$("#tel_error").text("");
						tel_tr = true;
					} else {
						$("#tel_error").css("color", "red");
						$("#tel_error").text("* 전화번호 11자를 입력해주세요.");
						tel_tr = false;
					}
				})
	})

	// 만장일치 확인
	function cl() {
		if (name_tr == true && id_tr == true && pw_tr == true && pw2_tr == true
				&& tel_tr == true) {
			tr = true;
		}
		return tr;
	}

	// 아이디 중복체크
	function idValidate(id) {
		$.ajax({
			type : "POST",
			url : "${root}idCheck",
			async : true,
			data : {
				id : id
			},
			success : function(result) {
				idcheck = result;
			},
			error : function(request, status, error) {
			}
		});
	}
</script>
</head>

<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	<div class="body"></div>
	<div class="inner">
		<div class="joinform">
			<form:form action="signup_proc" method="post" modelAttribute="joinUserBean" onsubmit="return cl();">
				<span class="text">Name</span>
				<form:input type="text" id="u_name" placeholder="이름을 입력해주세요." path="u_name" />
				<div id="name_error"></div>
				<span class="text">ID</span>
				<form:input type="text" id="u_id" placeholder="아이디를 입력해주세요." path="u_id" />
				<div id="id_error"></div>
				<span class="text">PW</span>
				<form:input type="password" id="u_pw" placeholder="비밀번호를 입력해주세요." path="u_password" />
				<div id="pw_error"></div>
				<span class="text">PW Check</span>
				<input type="password" id="u_pw2" placeholder="비밀번호를 한번 더 입력해주세요." />
				<div id="pw2_error"></div>
				<span class="text">H.P</span>
				<form:input type="text" id="u_tel" placeholder="전화번호를 입력해주세요 (-)없이" path="u_tel" value="010" /><br>
				<div id="tel_error"></div>
				<input type="submit" class="button" value="회원가입" />
			</form:form>
		</div>
	</div>
</body>
</html>