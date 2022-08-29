
var realInfoOn = false;
var addressInfoOn = false;
$("#realInfo-box").hide();
$("#addressInfo-box").hide();

var mySwiper = new Swiper('.swiper-container', {
	direction: 'horizontal',
	loop: true,
	centeredSlides: true,
	autoplay: {
		delay: 2500,
		disableOnInteraction: false
	},
	navigation: {
		nextEl: '.swiper-button-next',
		prevEl: '.swiper-button-prev'
	}
});

!function realInfoBox() {
	if (realInfoOn == false) {
		realInfoOn = true;
		$("#realInfo-box").show();
	} else {
		realInfoOn = false;
		$("#realInfo-box").hide();
	}
};

function addressInfoBox() {
	if (addressInfoOn == false) {
		addressInfoOn = true;
		$("#addressInfo-box").show();
	} else {
		addressInfoOn = false;
		$("#addressInfo-box").hide();
	}
};

function addCartMessage() {
	Swal.fire({
		html: '장바구니에 추가되었습니다.',
		icon: 'success',
		timer: 2000,
		timerProgressbar: true,
		willClose: () => {
			clearInterval(timerInterval)
		}
	}).then((result) => {
		location.reload();
	})
}

function rmvCartMessage() {
	Swal.fire({
		html: '장바구니에서 삭제되었습니다.',
		icon: 'success',
		timer: 2000,
		timerProgressbar: true,
		willClose: () => {
			clearInterval(timerInterval)
		}
	}).then((result) => {
		location.reload();
	})
}

function addCart(userId, prodId) {
	var dto = {
		userId: userId,
		prodId: prodId
	};

	$.ajax({
		type: "POST",
		url: "/CoCoMo/cart?cmd=cartAdd",
		data: JSON.stringify(dto),
		contentType: "application/json; charset=utf-8",
		dataType: "text"
	}).done(function(result){
		if (result === '200') {
			addCartMessage();
		}
	})
};

function rmvCart(userId, prodId) {
	var dto = {
		userId: userId,
		prodId: prodId
	};

	$.ajax({
		type: "POST",
		url: "/CoCoMo/cart?cmd=cartRmv",
		data: JSON.stringify(dto),
		contentType: "application/json; charset=utf-8",
		dataType: "text"
	}).done(function(result){
		if (result === '200') {
			rmvCartMessage();
		}
	})
};

!function needLogin() {
	Swal.fire({
		title: '회원가입이 필요한 기능입니다.',
		text: '회원가입하시겠습니까?',
		icon: 'info',
		closeOnClickOutside: false,
		showCancelButton: true,
		confirmButtonText: '회원가입',
		cancelButtonText: '페이지 머물기',
		reverseButtons: true
	}).then((result) => {
		if (result.isConfirmed) {
			location.href='/CoCoMo/login.jsp';
		} else {
			swal.close();
		}
	})
};


