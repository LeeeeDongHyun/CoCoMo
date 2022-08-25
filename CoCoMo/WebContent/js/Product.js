/**
 * 
 *
 */

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

function addCart(userId, prodId) {
	var dto = {
		userId: userId,
		prodId: prodId
	};

	$.ajax({
		type: "POST",
		url: "/shop/cart?cmd=cartAdd",
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
		url: "/shop/cart?cmd=cartRmv",
		data: JSON.stringify(dto),
		contentType: "application/json; charset=utf-8",
		dataType: "text"
	}).done(function(result){
		if (result === '200') {
			rmvCartMessage();
		}
	})
};

function needLogin() {
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
			location.href='/shop/user?cmd=joinForm';
		} else {
			swal.close();
		}
	})
};