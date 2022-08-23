<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
   

    <div class="navbar">
        <a href="Main.html" id="logo">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrnRG3tc4YnOFvP3cQBWISSK8QItfkhEgRFA&usqp=CAU" height="60">
        </a>

        <ul id="menu">
            <li><a href="Login.html"><b>MyPage</b></a></li>
            <li><a href="Login.html"><b>Cart</b></a></li>
           <li><div class="search-box"><input type=  "text" class="search-txt"name=""placeholder="search">
      <a class="search-btn" href="#">
        <i class="fas fa-search"></i>
      </a>
    </div></li>

            
        </ul>
        
    </div>
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
                <thead>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="cart__list__detail">
                        <td><input type="checkbox"></td>
                        <td><img src="https://www.smallman.co.kr/web/product/big/202104/1b0fbefbb5acddd35066c9b3a4f4bd07.jpg" alt="magic keyboard"></td>
                        <td><a href="#">COCOMO 공식 스토어</a><span class="cart__list__COCOMO"></span>
                            <p>미니 자수 옆트임 7부 티셔츠</p>
                            <sapn class="price">18,900원</sapn><span
                                style="text-decoration: line-through; color: lightgray;">26,500</span>
                        </td>
                        <td class="cart__list__option">
                            <p>모델명 :미니 자수 옆트임 7부 티셔츠 색상 검정 1개 사이즈 100</p>
                            <button class="cart__list__optionbtn">사이즈,색상/변경</button>
                        </td>
                        <td><span class="price">18,900원</span><br>
                            <button class="cart__list__orderbtn">주문하기</button>
                        </td>
                        <td>무료</td>
                    </tr>
                    <tr class="cart__list__detail">
                        <td style="width: 2%;"><input type="checkbox"></td>
                        <td style="width: 13%;">
                            <img src="https://www.smallman.co.kr/web/product/big/202207/78732d2748daa127421bb78297bd1aab.gif" alt="magic mouse">
                        </td>
                       <td><a href="#">COCOMO 공식 스토어</a><span class="cart__list__COCOMO"></span>
                            <p>UPTC215 플로스 워싱 데님 반바지</p>
                            <sapn class="price">39,800원</sapn><span
                                style="text-decoration: line-through; color: lightgray;">41,800</span>
                        </td>
                        <td class="cart__list__option" style="width: 27%;">
                            <p>상품 주문 수량: 1개</p>
                            <button class="cart__list__optionbtn">사이즈,색상/변경</button>
                        </td>
                        <td style="width: 15%;"><span class="price">39,800원</span><br>
                            <button class="cart__list__orderbtn">주문하기</button>
                        </td>
                        <td style="width: 15%;">무료</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3"><input type="checkbox"> <button class="cart__list__optionbtn">선택상품 삭제</button>
                            <button class="cart__list__optionbtn">선택상품 찜</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </form>
        </table>
        <div class="cart__mainbtns">
            <a href="Main.html">
                <button class="cart__bigorderbtn left">쇼핑 계속하기</button></a>
            <a href="Main.html">
                <button class="cart__bigorderbtn right">주문하기</button></a>
        </div>
    </section>
 </body>
 </html>