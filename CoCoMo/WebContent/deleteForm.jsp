<%@ page language="java" contentType="text/html; charset=UTF-8" 
	import="java.sql.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher, SHOP.*"%>
        <% request.setCharacterEncoding("UTF-8"); %>
<html>
  <head>
  <%@include file="header.jsp" %>
  <meta charset="UTF-8">
  <title>회원탈퇴하기</title>
  </head>
  <body>
    <%  
      Customer customer = (Customer) session.getAttribute("customer");
	  String id = customer.getId();
	  
      SHOPDB.loadConnectshop();		
	  ResultSet result = SHOPDB.getcustomerInfo(id);
     if (id== null) {
  	   out.println("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");  
  	   return;
     }
    %>
    <fieldset>
    	<legend> 회원 정보 삭제 </legend>
    	<form action="deleteSystem.jsp" method="post">
    		<input type="hidden" name="id" value="<%=id %>">
    		비밀번호 : <input type ="password" name="password"><br>
    		<input type="submit" value="삭제하기">
    		</form>
    </fieldset>
  </body>
</html>