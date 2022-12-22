<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<%@ page import="java.sql.*, SHOP.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@page import="java.util.List"%>
    <jsp:useBean id="FavorDAO" class="SHOP.SHOPDB" scope="session"/>
<html>
<%@include file="header.jsp" %>
<head>
<title>좋아요 목록</title>
  <meta charset="utf-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="css/Cart.css">
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

<section class="cart">
        <div class="cart__information">
            <ul>
            
                <li>좋아요 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
            </ul>
        </div> 
             
 <table class="cart__list">
            <form>
                    <tr>
      
                        			<c:choose>
			<c:when test="${sessionScope.customer ne null }">
					${sessionScope.customer.name }님의 좋아요 목록
			</c:when>
			</c:choose>
                        </tr>
                        

  <c:forEach var="favorDto" items="${favorDtoList}">
                    <tr class="cart__list__detail">
                       <td><input type="checkbox"></td>
                       <td>
                       <a  href="/CoCoMo/Product?cmd=detail&prodNo=${product.productId}">
                       <img src="${favorDto.imgUrl_1}" /></a>
                       </td>
                       <td>
                          <a>상품 정보</a><span class="cart__list__COCOMO"></span>
                          <p>
                             <a  href="/CoCoMo/Product?cmd=detail&prodNo=${product.productId}">  ${favorDto.productName} </a>
                          </p>
                          <span>
                           <fmt:formatNumber value="${favorDto.price}" type="number"/>
                           <c:set var="price_one" value="${favorDto.price}"/>
                          </span>
                       </td>
                       <td class="cart__list__option">
                     	<p>
                     	사이즈 : ${favorDto.size }
                     	</p>
                       </td>
                       <td>
                          <button class="cart__list__orderbtn">주문하기</button>
                       </td>
                    </tr>

                    </c:forEach>

	</form>
	 </section>
</body>
</html>