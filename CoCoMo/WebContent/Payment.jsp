<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, SHOP.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>

<jsp:useBean id="productDAO" class="SHOP.SHOPDB" scope="session"/>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link
      rel="stylesheet"
      href="css/Payment.css"    />

 <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
    <style>
      * {
        font-family: "Jua", sans-serif;
      }
      .product-img {
        width: 500px;
        height: 300px;
        background-image: url("https://www.smallman.co.kr/web/product/medium/202207/7575f9abcd2a81178a766694c7d05428.gif");
        background-position: center;
        background-size: cover;
      }
      .product-desc {
        width: 500px;
        margin-top: 20px;
        margin-bottom: 20px;
      }

      .price {
        font-size: 20px;
        font-style: italic;
      }

      .item-order {
        width: 500px;
      }

      .btn-order {
        margin: auto;
        width: 100px;

        display: block;
      }
      .wrap {
        width: 500px;
        padding-top: 50px;
        margin: auto;
      }
    </style>

    <script>
      function order() {
        alert("주문이 완료되었습니다!")
      }
    </script>
    <title>주문상세페이지</title>
  </head>

  <body>
  

    <div class="navbar">
        <a href="#" id="logo">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrnRG3tc4YnOFvP3cQBWISSK8QItfkhEgRFA&usqp=CAU" height="60">
        </a>

        <ul id="menu">
            <li><a href="Cart.jsp"><b>Cart</b></a></li>
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
					class="products-box-detail-realInfo-content">CoCoMo 내 모든 상품은  100% 정품입니다.</div>
					<div>
					<span class="products-box-detail-allPrice-title">상품 금액</span>
				<span class="products-box-detail-allPrice-figure">
					<fmt:formatNumber value="${prodDto.price}" type="number" />
				</span></div>
					</div>
									
					
					
					</div>
					
    <div class="wrap">
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
        </button>
      </div>
    </div>
  </body>
</html>