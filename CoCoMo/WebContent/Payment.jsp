<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<%@ page import="SHOP.Product" %>
<%@ page import="java.sql.*, SHOP.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@page import="java.util.List"%>
<jsp:useBean id="productDAO" class="SHOP.SHOPDB" scope="session"/>
<html>
  <head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- material icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- joinForm icons -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!-- swiper-wrapper script -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- kakao script -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Iamport -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- End of Script -->


<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


    <title>주문상세페이지</title>
  </head>

  <body>

    <div class="navbar">
        <a href="#" id="logo">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrnRG3tc4YnOFvP3cQBWISSK8QItfkhEgRFA&usqp=CAU" height="60">
        </a>

        <ul id="menu">
            <li><a href="<%=request.getContextPath()%>/cart?cmd=cartList">장바구니</a></li>
            <li><a href="MyPage.jsp"><b>MyPage</b></a></li>
                 <li><div class="search-box"><input type=  "text" class="search-txt"name=""placeholder="search">
      <a class="search-btn" href="#">
        <i class="fas fa-search"></i>
        </a>
        </div>
        </li>
</ul>
</div>
     <!-- 전체 박스 시작 -->
<div class="products-detail">
	<!-- 상단 박스 시작 -->
	<div class="products-detail-box">
	<form id="theForm">
		<div class="products-box-info">
			<!-- 이미지, 브랜드, 상품명, 가격, 사이즈선택  -->
			<div class="products-info-image swiper-container">
				<!-- 이미지 -->
				<div class="swiper-wrapper">
				
					<c:if test="${prodDto.imgUrl_1 != ''}">
					<div class="swiper-slide">
						<img src="${prodDto.imgUrl_1}" />
						<!-- 동기적으로 불러오기 -->
					</div>
					</c:if>
					</div>
					</div>
					<span class="products-info-desciption">※ 이미지를 좌우로 드래그하면 더 많은 이미지를 확인하실 수 있습니다.</span>
					</div>
								<div>	<!-- 상품명 -->
				<span>${prodDto.productName}</span>
				</div>
				<div>
					<!-- 가격 -->
				<span class="products-box-detail-price-figure">${prodDto.price}</span>
				<span>원</span></div>
				<div>
								<span class="products-box-detail-postInfo-title">배송정보</span> <span
					class="products-box-detail-postInfo-content">일반배송</span>
					</div>
					<div>
					<span class="products-box-detail-realInfo-title">정품인증</span> <span
					class="products-box-detail-realInfo-content">CoCoMo 내 모든 상품은  100% 정품입니다.</span></div>
					<div>
					<span class="products-box-detail-allPrice-title">상품 금액</span>
				<span class="products-box-detail-allPrice-figure">
					<fmt:formatNumber value="${prodDto.price}" type="number" />
				</span>
				</div>
			 <!-- 버튼 시작 -->
            <c:choose>
            <c:when test="${sessionScope.customer ne null}">
               <button type="button" class="buy-btn" onclick="location.href='<%=request.getContextPath()%>/cart?cmd=directBuy&prodId=${prodDto.prodId}&userId=${sessionScope.customer.num}'">로그인됨</button>
            </c:when>
            <c:otherwise>
               <button type="button" class="buy-btn" onclick="needLogin()">바로 구매</button>
            </c:otherwise>
            </c:choose>
         <!-- 장바구니 버튼 시작 -->
         <c:choose>
         <c:when test="${sessionScope.customer ne null}">
            <c:choose>
               <c:when test="${isCart eq true }">
                  <button type="button" class="cart-btn" onclick="rmvCart(${sessionScope.customer.num}, ${prodDto.prodId})">
               
                     <i class="material-icons" style="color: red;">장바구니 있음</i>
                  </button>
               </c:when>
               <c:otherwise>
               <script src="http://code.jquery.com/jquery-latest.js"></script> 
                  <button type="button" class="cart-btn" onclick="addCart(${sessionScope.customer.num}, ${prodDto.prodId})">
                     <i>장바구니 비어있음</i>
                  </button>
               </c:otherwise>
            </c:choose>
         </c:when>
         <c:otherwise>
            <button type="button" class="cart-btn" onclick="needLogin()">
               <i>장바구니(로그인x)</i>
            </button>
         </c:otherwise>
         </c:choose>
         </form>
         <!-- 장바구니 버튼 끝 -->
        <%--  <!-- 찜 버튼 시작 -->
         <c:choose>
         <c:when test="${sessionScope.customer ne null }">
            <c:choose>
               <c:when test="${isFavor eq true }">
                  <button type="button" class="fav-btn" onclick="rmvFavor(${sessionScope.customer.id}, ${prodDto.productCode});">
                     <i class="material-icons" style="color: red;">favorite</i>
                  </button>
               </c:when>
               <c:otherwise>
                  <button type="button" class="fav-btn" onclick="addFavor(${sessionScope.customer.id}, ${prodDto.productCode});">
                     <i class="material-icons">favorite_border</i>
                  </button>
               </c:otherwise>
            </c:choose>
         </c:when>
         <c:otherwise>
            <button type="button" class="fav-btn" onclick="needLogin();">
               <i class="material-icons">favorite_border</i>
            </button>
         </c:otherwise>
         </c:choose>
         <!-- 찜 버튼 끝 --> --%>
         <!-- 버튼 끝 -->
					</div>
									
					
					
					</div>
					<div>
					 <button type="button" class="cart-btn" onclick="test()">
					 </button>
					</div>
					    <script type="text/javascript">
					    var realInfoOn = false;
					    var addressInfoOn = false;
						function test(){
							Swal.fire({
								  position: 'top-end',
								  icon: 'success',
								  title: 'Your work has been saved',
								  showConfirmButton: false,
								  timer: 1500
								})
							
						}
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
					    		title: '장바구니에 추가되었습니다.',
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
					    		title: '장바구니에서 삭제되었습니다.',
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
					    			location.href='/CoCoMo/login.jsp';
					    		} else {
					    			swal.close();
					    		}
					    	})
					    };
					    </script>
	<%-- <---------------------------------------------------------------------->    --%>	
   <!--  <div class="wrap">
      <div class="product-img"></div>
      <div class="product-desc">
        <h2>
		네프 오버핏 포켓 반팔 티셔츠
                            <sapn class="price">39,800원</sapn><span
                                style="text-decoration: line-through; color: lightgray;">41,800</span>
        </h2>
        <p>가슴 부분 포켓 디테일</p>
      </div>
      <div class="item-order">
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text">주문자이름</span>
          </div>
          <input
            type="text"
            class="form-control"
            aria-label="Default"
            aria-describedby="inputGroup-sizing-default"
          />
        </div>
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupSelect01">사이즈/색상</label>
          </div>
          <select class="custom-select" id="inputGroupSelect01">
            <option selected>-- 사이즈를 선택하세요 --</option>
            <option value="1">S(90~95)</option>
            <option value="2">L(95~100)</option>
            <option value="3">XL(100~105)</option>
          </select>
        </div>
        <div>
        <select class="custom-select" id="inputGroupSelect02">
            <option selected>-- 색상을 선택하세요 --</option>
            <option value="1">Black</option>
            <option value="2">White</option>
          </select>
          </div>
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text">주소</span>
          </div>
          <input
            type="text"
            class="form-control"
            aria-label="Default"
            aria-describedby="inputGroup-sizing-default"
          />
        </div>
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text">전화번호</span>
          </div>
          <input
            type="text"
            class="form-control"
            aria-label="Default"
            aria-describedby="inputGroup-sizing-default"
          />
        </div>
                <div class="cart__mainbtns">
            <a href="Main.html">
                <button class="cart__bigorderbtn left">쇼핑 계속하기</button></a>
            <a href="Cart.html">
                <button class="cart__bigorderbtn middle">장바구니로 이동하기</button></a>
        <button class="cart__bigorderbtn right" onclick="order()" class="btn btn-primary btn-order">
          주문하기
        </button> -->
<!--       </div>
    </div> -->

    </body>
    </html>

    
