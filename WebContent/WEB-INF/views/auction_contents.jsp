<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- STYLE RESET -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
	integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
	crossorigin="anonymous" />
<!-- GoogleFonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet">
<!-- GoogleIcons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="../css/auction_contents.css" />
<title>auction_contents</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
// 입찰가 정수제한 정규식
var noInt = /[^0-9]/gi;
var start = /^(,)/gi;      // 첫 글자 "," 이랑 "0" 제거

// 상품 경매시작 시간
var db_start = Math.floor(new Date('${goodsbean.g_stime}').getTime() / 1000);

// 현재 입찰가
var now_price = ('${g_price}').replace(noInt, "");

// 현재 입찰자
var now_buyer = '${u_id}';

$(function() {
   // 현재 시간
   var this_time = Math.floor(new Date().getTime() / 1000);
   var timenum = db_start - this_time;
   
   $("#price").attr("disabled", true);
   $("#price").css("cursor", "not-allowed");
   $("#go_price").removeAttr("onclick");
   $("#go_price").css("cursor", "not-allowed");
   $("span").css("cursor", "not-allowed");
   
   // 경매가 끝났을 때 시간 처리
   if (db_start + 7200 <= this_time) {
     $(".now_ing").text("경매 종료");
     $(".now_ing").css("color", "red");
      $("#time").text("00:00:00");
      $("#time").css("color", "lightgray");
      $("#time").css("text-decoration", "line-through");
   } else {
      // 경매 시간 타이머
      timer(timenum);
   }
   
   // 입찰가 숫자입력 제한
   $("#price").on("keyup", function () {
      var text = $(this).val().replace(noInt, "");
        var str = text.split("").reverse().join("");
        var str2 = str.replace(/(.{3})/g, "$1,");
      if(text.length > 6) {
         str2 = "000,00" + str2.substring(6, );
      }
        var str3 = str2.split("").reverse().join("").replace(start, "");
        $(this).val(str3);
   })   
})

// 경매 시작 시간 탐지
function timer(num) {
   var start = 0;
   var times1 = setInterval(function () {
       if (start >= num) {
         clearInterval(times1);
         timer2(num);
      }
      start = start + 1;
   }, 1000);
}

// 경매 시작
function timer2(num) {
   $(".now_ing").text("진행중");
   $(".now_ing").css("color", "orange");
    $("#price").attr("disabled", false);
    $("#price").css("cursor", "default");
    $("#go_price").attr("onclick", "go_price()");
    $("#go_price").css("cursor", "pointer");
    $("span").css("cursor", "pointer");
   var end = 7198 + num;

   var times2 = setInterval(function () {
       var hours = Math.floor(end / (60 * 60));
       var min = Math.floor((end - (60 * 60)) / 60);
   
       if (min < 0) {
         min = 60 + min;
       }
       var sec = Math.floor((end - (60 * 60)) % 60);
   
       if (sec < 0) {
         sec = 60 + sec;
       }
   
       if (min < 10) {
         min = "0" + min;
       } else if (min == 60) {
         min = "00";
       }
   
       if (sec < 10) {
         sec = "0" + sec;
       }
   
       var time = "0" + hours + ":" + min + ":" + sec;
   
       if (end == 0) {
         clearInterval(times2);
            $(".now_ing").text("경매 종료");
         $(".now_ing").css("color", "red");
         $("#time").text("00:00:00");
         $("#time").css("color", "lightgray");
         $("#time").css("text-decoration-line", "line-through");
         $("#price").attr("disabled", true);
         $("#price").css("cursor", "not-allowed");
         $("#go_price").removeAttr("onclick");
         $("#go_price").css("cursor", "not-allowed");
         $("span").css("cursor", "not-allowed");
         end_auction();
       } else if (min == 0 && hours == 0 && sec < 10) {
          if (sec % 2 == 0) {
            $("#time").css("color", "black");
            $("#time").text(time);
            end = end - 1;
          } else if (sec % 2 == 1) {
            $("#time").css("color", "red");
            $("#time").text(time);
            end = end - 1;
          }
       }else {
         $("#time").text(time);
         end = end - 1;
      }
   }, 1000);
}

// 입찰가 갱신
function go_price() {
   price = parseInt($("#price").val().replace(noInt, ""));
   if($("#price").val() == "") {
      alert("가격을 입력해주세요.")
   } else if(price <= now_price) {
      alert("현재 입찰가보다 낮거나 동일한 가격입니다.");
      $("#price").val("");
   } else {
      send_socket($("#price").val());
   }
}

function change_price(message) {
   var price = message.replace(noInt, "");
   console.log(price);
   $.ajax({
      type: "POST",
      url: "${root}updateprice",
      async: true,
      data: {
         g_no : ${goodsbean.g_no},
         g_price : price,
         g_buyer : "${loginUserBean.u_id}"
      },
      success: function (result) {
         now_price = result.split(",")[0];
         now_buyer = result.split(",")[1];
         var reverse = now_price.split("").reverse().join("");
         var toprice = reverse.replace(/(.{3})/g, "$1,");
         $("#money").text(toprice.split("").reverse().join("").replace(start, ""));
         $("#buyer").text(now_buyer);
         $("#price").val("");
      },
      error : function (request, status, error) {
      }
   })
}

function end_auction() {
   $.ajax({
      type: "POST",
      url: "${root}payment",
      async: false,
      data: {
         g_no : ${goodsbean.g_no}
      },
      success: function() {
         
      },
      error: function () {
      }
   })
}

function reply() {
   $.ajax({
      type: "POST",
      url: "${root}auction_reply",
      async: true,
      data: {
         r_no: ${goodsbean.g_no},
         r_writer: '${loginUserBean.u_id }',
         r_text: $('#g_text').val()
      },
      success: function(result) {
         made_li(result);
      },
      error: function(request, status, error) {
         console.log(error);
      }
   })
}

function made_li(result) {
      var first = "<div class='replybox'><div class='reply__writer'>${loginUserBean.u_id}</div><div class='reply__contents'>" + result + "</div></div>";
      $(".reply__section").append(first);
      $("#g_text").val("");
}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	<!-- CONTENT_BODY -->
	<section class="content">
		<div class="inner">
			<div class="content__wrapper">
				<div class="left__side">
					<div class="img__section">
						<img src="${goodsbean.g_img }" alt="">
					</div>
					<div class="contents__wrapper">
						<div class="content__sub">${goodsbean.g_sub }</div>
						<div class="content__writer">${g_writer }</div>
						<div class="content__content">${goodsbean.g_text }</div>
					</div>
				</div>
				<ul class="right__side">
					<li>
						<div class="now_ing">경매 시작 전</div>
					</li>
					<li>
						<div class="info">남은 시간</div>
						<div class="time" id="time">02:00:00</div>
					</li>
					<li>
						<div class="info">현재 입찰가</div>
						<div class="price" id="money">${g_price }</div>
					</li>
					<li>
						<div class="price__section">
							<div class="price__write">
								<input type="text" id="price" />
							</div>
							<div class="price__submit" onclick="go_price()" id="go_price">
								<span>입찰하기</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="reply__">
				<div class="reply__submit__wrapper">
					<div class="reply__write">
						<input type="text" id="g_text" />
						<div class="reply__submit" onclick="reply()">댓글작성</div>
					</div>
				</div>
				<div class="reply__section">
					<div class="reply_box">
						<div class="reply__write">작성자</div>
						<div class="reply__content">내용</div>
					</div>
					<c:forEach var="rep" items="${reply }">
						<div class="replybox" id="replybox">
							<div class="reply__writer">${rep.r_writer }</div>
							<div class="reply__contents">${rep.r_text }</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>