	// 상단 돋보기
    $(".fa-search").click(function() {
       $(".searchbox").toggle();
       $("input[type='search']").val("");
       $("input[type='search']").focus();
    });
    
	// ===== Scroll to Top ==== 
	$(window).scroll(function() {
	    if ($(this).scrollTop() >= 130) {       // If page is scrolled more than 50px
	        $('#return-to-top').fadeIn(200);    // Fade in the arrow
	    } else {
	        $('#return-to-top').fadeOut(200);   // Else fade out the arrow
	    }
	});
	$('#return-to-top').click(function() {      // When arrow is clicked
	    $('body,html').animate({
	        scrollTop : 0                       // Scroll to top of body
	    }, 500);
	});    