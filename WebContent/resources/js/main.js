new Swiper('.slider .swiper-container', {
	autoplay: true,
	loop: true,
	pagination: {
		el: '.slider .swiper-pagination',
		clickable: true
	},
	navigation: {
		prevEl: '.slider .swiper-prev',
		nextEl: '.slider .swiper-next'
	},
	spaceBetween: 30,
	slidesPerView: 3
});

window.onload = function() {
	const spyEl = document.querySelector('section.scroll-spy');
	new ScrollMagic
		.Scene({
			triggerElement: spyEl,
			triggerHook: .5
		})
		.setClassToggle(spyEl, 'show')
		.addTo(new ScrollMagic.Controller());

	$("#communitybtn").css("opacity", "0.5");
	$("#communitybox").hide();

	$("#buybtn").on('click', function() {
		$("#buybtn").css("opacity", "1");
		$("#buybox").show();
		$("#communitybtn").css("opacity", "0.5");
		$("#communitybox").hide();
	});

	$("#communitybtn").on('click', function() {
		$("#communitybtn").css("opacity", "1");
		$("#communitybox").show();
		$("#buybtn").css("opacity", "0.5");
		$("#buybox").hide();
	});
}