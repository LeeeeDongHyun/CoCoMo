<%@ page language="java" contentType="text/html; charset=euc_kr" import="java.sql.*, SHOP.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<title>CoCoMo</title>
</head>
<body>
   <div id="header">
   <div class="logo"><a href="Main.jsp">CoCoMo</a></div>
   <div class="menu">
   <a href="logoutSystem.jsp">로그아웃</a>
   <a href="MyPage.jsp">mypage</a>
    <a href="Cart.jsp">장바구니</a> 
   </div>
   </div>
</body>
</html>