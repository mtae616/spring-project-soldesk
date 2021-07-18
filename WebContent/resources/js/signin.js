$(document).ready(function() {
	$(".button").click(function() {
		$.ajax({
			type: 'post',
			url: '/SpringMVC1/VerifyRecaptcha',
			data: {
				recaptcha: $("#g-recaptcha-response").val()
			},
			success: function(data) {
				switch (data) {
					case 0:
						break;

					case 1:
						alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
						location.href = 'signin';
						break;

					default:
						alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
						break;
				}
			}
		});
	});
});