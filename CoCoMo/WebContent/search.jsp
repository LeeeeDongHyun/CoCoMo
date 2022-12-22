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
  <!-- summernote css/js -->
  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">


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
  <HEAD>
  <meta charset="EUC-KR">
  <TITLE>검색</TITLE>
  </HEAD>
  <BODY>
  <div id="container">
	<!-- Start of main-prd -->
	<main id="main-prd" class="frame">
		<div class="main-item-box">
			<div class="main-prd-list">
				<c:forEach var="product" items="${searchedProductList}">
					<div class="main-prd-box">
					<a class="link-prod" href="/shop/product?cmd=detail&prodNo=${product.productId}"></a>
						<img src="${product.imgUrl_1}" class="main-prd-item-img" /> <!-- 상품이미지 -->
						<ul class="main-prd-item">
						
							<li class="prd-item-name">${product.productName}</li> <!-- 상품명 -->
							<li class="prd-item-price"><fmt:formatNumber value="${product.price}" type="number" /></li> <!-- 가격 -->
							
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
		<c:if test="${fn:length(searchedProductList) == 0}">
			<div>
				<div class="main-pagetitle">
				<h1 class="main-pagetitle-word">
					검색어에 해당하는 결과가 없습니다.
				</h1>
			</div>
			<div class="main-pagetitle">
			<h1 class="main-pagetitle-word mgt150 mgb50">
				이런 상품들은 어떠신가요?
			</h1>
			</div>
			<div class="main-item-box">
			<div class="main-prd-list">
				<c:forEach var="product" items="${productList30}">
					<div class="main-prd-box">
					<a class="link-prod" href="/shop/product?cmd=detail&prodNo=${product.productId}"></a>
						<img src="${product.imgUrl_1}" class="main-prd-item-img" /> <!-- 상품이미지 -->
						<ul class="main-prd-item">

							<li class="prd-item-name">${product.productName}</li> <!-- 상품명 -->
							<li class="prd-item-price">${product.price}</li> <!-- 가격 -->
							
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
		</div>
		</c:if>
	</main>
	<!-- End of main-prd -->
	</div>
	<!-- End of Container -->
    
  </BODY>
</HTML>