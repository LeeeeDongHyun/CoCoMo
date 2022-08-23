<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, SHOP.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>

<jsp:useBean id="productDAO" class="SHOP.SHOPDB" scope="session"/>
<html>
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


    <div class="navbar">
        <a href="#" id="logo">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrnRG3tc4YnOFvP3cQBWISSK8QItfkhEgRFA&usqp=CAU" height="60">
        </a>

        <ul id="menu">
            <li><a href="login.jsp"><b>Login</b></a></li>
            <li><a href="login.jsp"><b>MyPage</b></a></li>
            <li><a href="login.jsp"><b>Cart</b></a></li>
            <li><a href="#"><b>Search :  <input type=  "text"><input type="submit" value=" 검색 "></b></a></li>


            
        </ul>
    </div>

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
	<div>
	<c:forEach var="product" items="${productList30}">
	<a  href="/CoCoMo/Product?cmd=detail&prodNo=${product.productCode}">
	<img src="${product.imgUrl_1}"/></a>
	<ul>
	<li>${product.productName}</li>
	<li>${product.size}</li>
	<li>${product.productCode}</li>
	<li>${product.price}  원</li>
	</ul>
	</c:forEach>
	</div>
<div>

<div>


	<!-- End of main-prd -->
	</div>
	<!-- End of Container -->

</div>
</div>

              
<div>
            <div class="clearfix"></div>
        </div>

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
    </div>
</body>
</html>