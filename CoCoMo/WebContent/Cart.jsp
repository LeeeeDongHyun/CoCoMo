<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<%@ page import="SHOP.Cart" %>
<%@ page import="SHOP.Product" %>
<%@ page import="java.sql.*, SHOP.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@page import="java.util.List"%>
    <jsp:useBean id="CartDAO" class="SHOP.SHOPDB" scope="session"/>
<html>
<%@include file="header.jsp" %>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="css/Payment.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- material icon -->
<!-- jquery -->
<!-- bootstrap -->
<!-- joinForm icons -->
<!-- swiper-wrapper script -->
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- kakao script -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"   rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Iamport -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- End of Script -->

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
                     
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>

                   <c:forEach var="cartDto" items="${cartDtoList}">
                    <tr class="cart__list__detail">
                       <td>
                       <button type="button" onclick="rmvCart(${sessionScope.customer.num}, ${cartDto.productId});">
						<i class="material-icons">삭제</i>
					</button></td>
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

                    
         </form>
        </table>
        
        
        <div class="cart__mainbtns">
            <a href="Product?cmd=Main">
                <button class="cart__bigorderbtn left">쇼핑 계속하기</button></a>
            <a href="<%=request.getContextPath()%>/Customer?cmd=cartBuy&userId=${sessionScope.customer.num}">
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
