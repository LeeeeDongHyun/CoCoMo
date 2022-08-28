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

function addCart(userId, productCode) {
	var dto = {
		userId: userId,
		productCode: productCode
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

function rmvCart(userId, productCode) {
	var dto = {
		userId: userId,
		productCode: productCode
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

function needLogin() {
	Swal.fire({
		title: '로그인이 필요한 기능입니다.',
		text: '로그인하시겠습니까?',
		icon: 'info',
		closeOnClickOutside: false,
		showCancelButton: true,
		confirmButtonText: '로그인',
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