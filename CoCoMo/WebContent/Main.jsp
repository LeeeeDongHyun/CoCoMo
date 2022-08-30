<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<%@ page import="java.sql.*, SHOP.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="productDAO" class="SHOP.SHOPDB" scope="session"/>
<html>
<%@include file="header.jsp" %>
<head>
  <title>CoCoMo</title>
  <meta charset="utf-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="css/Main.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  <script>
    $(document).ready(function(){
        $(".sub").css({display:"none"});
        $(".main > li").click(function(){
            $(".sub").each(function(){
                if($(this).css("display") == "block") {
                    $(this).css({display:"none"});
                }
            });
            $(this).find(".sub").fadeIn(500);
        });
    });
  </script>
</head>
<body>
			<c:choose>
			<c:when test="${sessionScope.customer eq null }">
					당신을 위한 추천
			</c:when>
			<c:otherwise>
					${sessionScope.customer.id }님을 위한 추천
			</c:otherwise>
			</c:choose>
	<div class="hero-header"></div>
	<div class="products">
        <h3>Our New Products</h3>
   <div id = "nav">
    <ul class="main">
<li><a href="#">인기 상품</a>
       <ul class="sub">
    
       <li><a href="#">상의</a></li>
       <li><a href="#">하의</a></li>
       <li><a href="#">모자</a></li>
       <li><a href="#">신발</a></li>
    </ul>
</li>
<li><a href="#">상의</a>
       <ul class="sub">
       <li><a href="#">티셔츠</a></li>
       <li><a href="#">가디건</a></li>
       <li><a href="#">셔츠</a></li>
       <li><a href="#">가디건</a></li>
    </ul>
</li>
<li><a href="#">하의</a>
       <ul class="sub">
       <li><a href="#">긴바지</a></li>
       <li><a href="#">반바지</a></li>
       <li><a href="#">츄리닝</a></li>
    </ul>
</li>
<li><a href="#">모자 와 신발</a>
       <ul class="sub">
       <li><a href="#">모자</a></li>
       <li><a href="#">구두</a></li>
       <li><a href="#">운동화</a></li>
       <li><a href="#">단화</a></li>
    </ul>
</li>
</ul>
</div>

	<div class="product-list">
	<c:forEach var="product" items="${productList30}">
	<div class="product">
	<a  href="/CoCoMo/Product?cmd=detail&prodNo=${product.productId}">
	<img src="${product.imgUrl_1}" width="225" height="225px"/>
	</a>
	<div class="product-name">
	${product.productName}</div>
	<div class="product-price">
	${product.price} 원</div>
	</div>
	</c:forEach>
	</div>
	<!-- End of main-prd -->
	</div>
	<!-- End of Container -->

	<div class="clearfix"></div>
    	<div class="footer">
            <a href="http://faceboo.com">
                <img src="https://bakey-api.codeit.kr/files/629/images/facebook.png" height="20">
            </a>
            <a href="http://faceboo.com">
                <img src="https://bakey-api.codeit.kr/files/629/images/instagram.png" height="20">
            </a>
            <a href="http://faceboo.com">
                <img src="https://bakey-api.codeit.kr/files/629/images/twitter.png" height="20">
            </a>
        </div>
</body>
</html>