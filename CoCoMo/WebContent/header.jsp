<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.sql.*, SHOP.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Main.css">
<title>CoCoMo</title>
</head>
<body>
   <div id="header">
   <div class="logo"><a href="Main.jsp">CoCoMo</a></div>
   <div class="menu">
   <a href="loginSystem.jsp">login</a>
   <a href="MyPage.jsp">mypage</a>
   <a href="Cart.jsp">장바구니</a> 
   </div>
   </div>
</body>
</html>