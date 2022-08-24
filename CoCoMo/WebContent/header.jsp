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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Main.css">



<!-- End of Script -->
<title>CoCoMo</title>
</head>

<body>
   <div id="header">
   <div class="logo"><a href="Main.jsp">CoCoMo</a></div>
   <div class="menu"></div>
   <header>
      <div id="header-first">
         <div id="header-logo">
            <a href="<%=request.getContextPath()%>/"><img
               src="/shop/images/header/logo.png" id="header-logo-img" /></a>
         </div>
         <form id="headerSearchForm" method="POST"
            action="<%=request.getContextPath()%>/product?cmd=search">
            <button class="headerSearchForm-btn">
               <i class="tiny material-icons">search</i>
            </button>
            <input name="keyword" placeholder="상품명 또는 브랜드명으로 검색"
               class="headerSearchForm-input" />
         </form>
         <% 
         String re = (String)session.getAttribute("state");
         %>
         <c:set var="menu" value="re" scope="session"/>
         <c:choose>
            <c:when test="${sessionScope.customer ne null}">
               <div id="header-main-menu">
                  <c:if test="${sessionScope.principal.auth eq 'admin' }">
                     <a href="<%=request.getContextPath()%>/product?cmd=insertPage"
                        class="header-sub-menu">상품등록</a>
                     <a href="#" class="header-sub-menu">상품수정</a>
                  </c:if>
                  <a href="jjim.jsp" class="header-sub-menu">찜</a> 
                     <a href="cart.jsp" class="header-sub-menu">장바구니</a>
                  <a href="MyPage.jsp" class="header-sub-menu">정보수정</a>
                  <a href="logoutSystem.jsp" class="header-sub-menu">로그아웃</a>
               </div>
            </c:when>
            <c:otherwise>
               <div id="header-main-menu">
                  <a href="<%=request.getContextPath()%>/login.jsp"
                     class="header-sub-menu">로그인</a> <a
                     href="<%=request.getContextPath()%>/join membership.jsp"
                     class="header-sub-menu">회원가입</a>
               </div>
            </c:otherwise>
         </c:choose>
      </div>
      <!-- Start of Dropdown -->
      <div id="header-second">
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
            <c:choose>
               <c:when test="${pageContext.request.requestURI eq '/shop/product/rank.jsp' }">
                  <button type="button" id="header-sec-rank" class="btn btn-basic header-second-btn-group border-btm-red" onclick="location.href='/shop/product?cmd=rank';">랭킹</button>
               </c:when>
               <c:otherwise>
                  <button type="button" id="header-sec-rank" style=""
                     class="btn btn-basic header-second-btn-group" onclick="location.href='/shop/product?cmd=rank';">랭킹</button>
               </c:otherwise>
            </c:choose>
            <div class="btn-group">
               <button type="button" id="header-sec-items"
                  class="btn btn-basic dropdown-toggle header-second-btn-group"
                  data-toggle="dropdown">브랜드별</button>
               <div class="dropdown-menu">
                  <c:forEach var="comp" items="${brandNameList}">
                     <a class="dropdown-item"
                        href="<%=request.getContextPath()%>/product?cmd=search&compNo=${comp.id}">${comp.name}</a>
                  </c:forEach>
               </div>
            </div>
            <c:choose>
               <c:when test="${pageContext.request.requestURI eq '/shop/product/categories.jsp' }">
                  <button type="button" id="header-sec-rank" class="btn btn-basic header-second-btn-group border-btm-red" onclick="location.href='/shop/product?cmd=category';">전체상품</button>
               </c:when>
               <c:otherwise>
                  <button type="button" id="header-sec-rank" style=""
                     class="btn btn-basic header-second-btn-group" onclick="location.href='/shop/product?cmd=category';">전체상품</button>
               </c:otherwise>
            </c:choose>
         </div>
      </div>
      <!-- End of Dropdown -->
   </header>