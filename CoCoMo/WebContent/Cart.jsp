<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<%@ page import="java.sql.*, SHOP.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@page import="java.util.List"%>
    <jsp:useBean id="CartDAO" class="SHOP.SHOPDB" scope="session"/>
<html>
<%@include file="header.jsp" %>
<head>
  <title>장바구니</title>
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
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        <table class="cart__list">
            <form>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>


                   <c:forEach var="cartDto" items="${cartDtoList}">
                    <tr class="cart__list__detail">
                       <td><input type="checkbox"></td>
                       <td><img src="${cartDto.imgUrl_1}" /></td>
                       <td>
                          <a href="#">COCOMO 공식 스토어</a><span class="cart__list__COCOMO"></span>
                          <p>
                             ${cartDto.productName}
                          </p>
                          <span>
                           <fmt:formatNumber value="${cartDto.price}" type="number"/>
                           <c:set var="price_one" value="${cartDto.price}"/>
                          </span>
                       </td>
                       <td class="cart__list__option">
                     	<p>
                     	사이즈 : ${cartDto.size }
                     	</p>
                       <button class="cart__list__optionbtn">사이즈,색상/변경</button>
                       </td>
                       <td>
                          <span class="price">임시 가격</span><br>
                          <button class="cart__list__orderbtn">주문하기</button>
                       </td>
                       <td>FREE</td>
                    </tr>

                    </c:forEach>
                </tbody>

                    <tr>
                        <td colspan="3"><input type="checkbox"> <button class="cart__list__optionbtn">선택상품 삭제</button>
                            <button class="cart__list__optionbtn">선택상품 찜</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
         </form>
        </table>
        
        
        <div class="cart__mainbtns">
            <a href="Product?cmd=Main">
                <button class="cart__bigorderbtn left">쇼핑 계속하기</button></a>
            <a href="#">
                <button class="cart__bigorderbtn right">주문하기</button></a>
        </div>
        <div>
    <c:set var="prodCount" value="0" />
   <c:set var="prodPriceAll" value="0" />
   <div>
   
   
   </div>
   
   </div>
    </section>
 </body>
 </html>