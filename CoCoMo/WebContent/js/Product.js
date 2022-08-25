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

function addCart(id, productCode) {
	var dto = {
		id: id,
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

function rmvCart(id, productCode) {
	var dto = {
		id: id,
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
		title: '회원가입이 필요한 기능입니다.',
		text: '회원가입하시겠습니까?',
		icon: 'info',
		closeOnClickOutside: false,
		showCancelButton: true,
		confirmButtonText: '회원가입',
		cancelButtonText: '페이지 머물기',
		reverseButtons: true
	}).then((Customer) => {
		if (Customer.isConfirmed) {
			location.href='/CoCoMo/joinmembership.jsp';
		} else {
			swal.close();
		}
	})
};