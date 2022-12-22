<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<%@ page import="SHOP.Product" %>
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
  <!-- summernote css/js -->
  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">






<!-- End of Script -->
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
<li>
				    <c:choose>
					<c:when
						test="${pageContext.request.requestURI eq '/CoCoMo/main.jsp' }">
						<button type="button" id="header-sec-home"
							onclick="location.href='/CoCoMo/';"
							class="btn btn-basic header-second-btn-group border-btm-red">
							전체 상품</button>
					</c:when>
					<c:otherwise>
						<button type="button" id="header-sec-home"
							onclick="location.href='/CoCoMo/';"
							class="btn btn-basic header-second-btn-group">전체 상품</button>
					</c:otherwise>
					</c:choose>
</li>
<li>
<c:choose>
					<c:when test="${pageContext.request.requestURI eq '/CoCoMo/Product/clothes.jsp' }">
						<button type="button" id="header-sec-rank" class="btn btn-basic header-second-btn-group border-btm-red" onclick="location.href='/CoCoMo/Product?cmd=clothes';">의류</button>
					</c:when>
					<c:otherwise>
						<button type="button" id="header-sec-rank" style=""
							class="btn btn-basic header-second-btn-group" onclick="location.href='/CoCoMo/Product?cmd=clothes';">의류</button>
					</c:otherwise>
				</c:choose>

</li>
<li>
<c:choose>
					<c:when test="${pageContext.request.requestURI eq '/CoCoMo/Product/shoes.jsp' }">
						<button type="button" id="header-sec-rank" class="btn btn-basic header-second-btn-group border-btm-red" onclick="location.href='/CoCoMo/Product?cmd=shoes';">신발</button>
					</c:when>
					<c:otherwise>
						<button type="button" id="header-sec-rank" style=""
							class="btn btn-basic header-second-btn-group" onclick="location.href='/CoCoMo/Product?cmd=shoes';">신발</button>
					</c:otherwise>
				</c:choose>

</li>
<li>
<c:choose>
					<c:when test="${pageContext.request.requestURI eq '/CoCoMo/Product/other.jsp' }">
						<button type="button" id="header-sec-rank" class="btn btn-basic header-second-btn-group border-btm-red" onclick="location.href='/CoCoMo/Product?cmd=other';">기타</button>
					</c:when>
					<c:otherwise>
						<button type="button" id="header-sec-rank" style=""
							class="btn btn-basic header-second-btn-group" onclick="location.href='/CoCoMo/Product?cmd=other';">기타</button>
					</c:otherwise>
				</c:choose>

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