<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, util.*, SHOP.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
    <% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<%@include file="header.jsp" %>
<head>
<meta charset="UTF-8">
<title>My Page</title>
  <link rel="stylesheet" href="css/MyPage.css">
</head>
<body>

  

<div class="wrap">
  <div class="greenContainer">
    <div>
      <div class="grade">GOLD</div>
      <div class="name">${customer.id }님</div>
      <li><a href="customerInfo.jsp"><b>내 정보 보기 </a></li>
    </div>    
  </div>
  <div class="summaryContainer">
    <div class="item">
   
</div>
</div>
  <div class="summaryContainer">
    
      <div class="item">
        <div class="number">354</div>
        <div>상품후기</div>
      </div>
      <div class="item">
        <div class="number">354</div>
        <div>적립금(BLCT)</div>
      </div>
  </div>  
  <div class="shippingStatusContainer">
    <div class="title">
      주문/배송조회
    </div>
    <div class="status">
      
      <div class="item">
        <div>
          <div class="green number">6</div>
          <div class="text">장바구니</div>
        </div>
        <div class="icon"> > </div>
      </div>     
      <div class="item">
        <div>
          <div class="number">0</div>
          <div class="text">결제완료</div>
        </div>
        <div class="icon"> > </div>
      </div>     
      <div class="item">
        <div>
          <div class="green number">1</div>
          <div class="text">배송중</div>
        </div>
        <div class="icon"> > </div>
      </div>     
      <div class="item">
        <div>
          <div class="green number">3</div>
          <div class="text">구매확정</div>
        </div>
      </div>     
      
    </div>
    
  </div>  
  <div class="listContainer">
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">주문목록<span class="circle"></span></div>
        <div class="right"> > </div>
    </a>
    
  </div>
  <div class="listContainer">
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">
          <span>내지갑</span>
          <span class="smallLight">
            <span>|</span>
            <span>보유 적립금</span>
          </span>          
        </div>                
        <div class="right">
          <span class="blct">175 BLCT</span>
          > </div>
    </a>
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">알림</div>
        <div class="right"> > </div>
    </a>
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">설정</div>
        <div class="right"> > </div>
    </a>   
  </div>
  <div class="infoContainer">
    <a href="#" class="item">
      <div>icon</div>
      <div>공지사항</div>
    </a>    
    <a href="#" class="item">
      <div>icos</div>
      <div>이용안내</div>
    </a>    
    <a href="#" class="item">
      <div>icon</div>
      <div>고객센터</div>
    </a>
  </div>
</div>
</body>
</html>