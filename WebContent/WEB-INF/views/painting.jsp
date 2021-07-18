<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>그림판</title>
<link rel="stylesheet" href="./css/paintingstyles.css" />
<!-- STYLE RESET -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
	integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
	crossorigin="anonymous" />
<script src="./js/jscolor.js"></script>
<script defer src="./js/app.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	<canvas id="jsCanvas" class="canvas"></canvas>
	<div class="controls">
		<div class="controls__range">
			<input type="range" name="" id="jsRange" min="0.1" max="10.0"
				value="5.0" step="0.1" />
		</div>
		<div class="controls__btns">
			<button id="jsUpload">그림 올리기</button>
			<button id="jsMode">배경색</button>
			<button id="jsSave">저장</button>
			<button id="jsErase">지우개</button>
		</div>
		<div class="controls__colors" id="colors">
			<div class="controls__color jsColor"
				style="background-color: #2c2c2c;"></div>
			<div class="controls__color jsColor" style="background-color: white;"></div>
			<div class="controls__color jsColor" style="background-color: red;"></div>
			<div class="controls__color jsColor"
				style="background-color: orange;"></div>
			<div class="controls__color jsColor"
				style="background-color: yellow;"></div>
			<div class="controls__color jsColor" style="background-color: green;"></div>
			<div class="controls__color jsColor" style="background-color: blue;"></div>
			<div class="controls__color jsColor"
				style="background-color: indigo;"></div>
			<div class="controls__color jsColor"
				style="background-color: violet;"></div>
			<input class="jscolor" id="palette" value="" />
		</div>
	</div>
</body>
</html>
