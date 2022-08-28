<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
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
  
  
  <!-- End of Script -->
<title>CoCoMo</title>
</head>

<body>
   <div class="header">
  <!--  <div class="logo"><a href="Main.jsp">CoCoMo</a></div> -->
  <!--   <div class="menu"></div> -->
      <div id="header-first">
       <!--   <div id="header-logo">
            <a href="<%=request.getContextPath()%>/"><img
               src="/shop/images/header/logo.png" id="header-logo-img" /></a>
         </div> -->
         <a href="<%=request.getContextPath()%>/" id="logo">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrnRG3tc4YnOFvP3cQBWISSK8QItfkhEgRFA&usqp=CAU" height="60">
        </a>
       <!--   <form id="headerSearchForm" method="POST"
            action="<%=request.getContextPath()%>/product?cmd=search">
            <button class="headerSearchForm-btn">
               <i class="tiny material-icons">search</i>
            </button>
            <input name="keyword" placeholder="상품명 또는 브랜드명으로 검색"
               class="headerSearchForm-input" />
         </form> -->
         <% 
         String re = (String)session.getAttribute("state");
         %>
         <c:set var="menu" value="re" scope="session"/>
        <c:choose>
           <c:when test="${sessionScope.customer ne null}">  
               <ul id="header-main-menu">
                 <c:if test="${sessionScope.principal.auth eq 'admin' }">  
                    <li> <a href="<%=request.getContextPath()%>/product?cmd=insertPage"
                        class="header-sub-menu">상품등록</a> </li>
                    <li> <a href="#" class="header-sub-menu">상품수정</a> </li>
                
                 </c:if>
                 </ul>
                <ul id="header-main-menu">
                  <li>   <a href="jjim.jsp" class="header-sub-menu">찜</a> </li>
                  <li>   <a href="<%=request.getContextPath()%>/cart?cmd=cartList" class="header-sub-menu">장바구니</a> </li>
                  <li>   <a href="MyPage.jsp" class="header-sub-menu">정보수정</a> </li>
                  <li>   <a href="logoutSystem.jsp" class="header-sub-menu">로그아웃</a> </li>
                  <li>   <div class="search-box"><input type=  "text" class="search-txt"name=""placeholder="search">
                     <a class="search-btn" href="#">
                      <i class="fas fa-search"></i>
                     </a>
                      </div></li>
               </ul>
             </c:when>
             <c:otherwise>
               <ul id="header-main-menu">
                 <li> <a href="<%=request.getContextPath()%>/login.jsp"
                     class="header-sub-menu">로그인</a> </li>
                 <li> <a href="<%=request.getContextPath()%>/join membership.jsp"
                     class="header-sub-menu">회원가입</a></li>
                 <li>   <div class="search-box"><input type=  "text" class="search-txt"name=""placeholder="search">
                     <a class="search-btn" href="#">
                      <i class="fas fa-search"></i>
                     </a>
                      </div></li>
                    </ul>
               </div>
            </c:otherwise>
         </c:choose>  
      </div>
      <!-- Start of Dropdown -->
    <!--    <div id="header-second">
         <div class="btn-group header-second-btn-box">
            <c:choose>
               <c:when
                  test="${pageContext.request.requestURI eq '/CoCoMo/Main.jsp' }">
                  <button type="button" id="header-sec-home"
                     onclick="location.href='/CoCoMo/';"
                     class="btn btn-basic header-second-btn-group border-btm-red">
                     홈</button>
               </c:when>
               <c:otherwise>
                  <button type="button" id="header-sec-home"
                     onclick="location.href='/CoCoMo/';"
                     class="btn btn-basic header-second-btn-group">홈</button>
               </c:otherwise>
            </c:choose>
          
         </div>
      </div> -->
      <!-- End of Dropdown -->