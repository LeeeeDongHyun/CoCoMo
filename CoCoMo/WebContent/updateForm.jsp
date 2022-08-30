<%@ page language="java" contentType="text/html; charset=UTF-8" 
	import="java.sql.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher, SHOP.*"%>
        <% request.setCharacterEncoding("UTF-8"); %>
<html>
  <head>
  <%@include file="header.jsp" %>
  <meta charset="UTF-8">
  <title>회원정보 수정</title>
  </head>
  <body>
  <%  
      Customer customer = (Customer) session.getAttribute("customer");
	  String id = customer.getId();
	  
      SHOPDB.loadConnectshop();	
     if (id== null) {
  	   out.println("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");  
  	   return;
     }
     SHOPDB db=new SHOPDB();
     Customer ct=db.getInform(id);
    %>
    <form action="updateSystem.jsp" method="post">
    <label>
        
        <input type="hidden" class="size" name="id"value="<%= ct.getId() %>">
        </label><!--아이디-->
        <label>
        <p style="text-align: left; font-size:12px; color:#666">username</p>
        <input type="text" placeholder="이름" class="size" name="name" "value="<%= ct.getName() %>" required>
        </label><!--이름-->
        <label>
        <!-- <span>PW</span> -->
        <p style="text-align: left; font-size:12px; color:#666">Password </p>
        <input type="password" placeholder="비밀번호" class="size" name="password" value="<%=ct.getPassword() %>" required>
        </label><!--비밀번호-->
      	<label>
      	<p style="text-align: left; font-size:12px; color:#666">Address</p>
        <input type="text" placeholder="주소" class="size" name="address" value="<%=ct.getAddress() %>" required>
        </label><!--주소-->
        <label>
                <!-- <span>PW</span> -->
            <p style="text-align: left; font-size:12px; color:#666">E-mail</p>
                <input type="text" placeholder="이메일" class="size" name="email" value="<%=ct.getEmail() %>" required>
        </label> <!--이메일--> 
      
        <label>
            <!-- <span>PW</span> -->
        <p style="text-align: left; font-size:12px; color:#666">Mobile Phone</p>
            <select class="size num1">
                <option value="1" selected>SKT</option>
                <option value="2" selected>KT</option>
                <option value="3" selected>LG</option>
            </select>
            <input placeholder="-빼고 숫자만 입력"  class="size num2" name="number"value="<%=ct.getNumber() %>" required>
         </label> <!--전화번호-->
         <br>
        <p>
            <input type="submit" value="정보수정 완료" class="btn">
            
        </p>
    
    </form>
  </body>
</html>