<%@page import = "java.sql.ResultSet" %>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "SHOP.*" %>
<%@page import = "java.util.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보</title>
</head>
<body>
<link rel="stylesheet" href="css/MyPage.css">
</head>
<body>
	<div class="navbar">
        <a href="Main2.jsp" id="logo">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrnRG3tc4YnOFvP3cQBWISSK8QItfkhEgRFA&usqp=CAU" height="60">
        </a>
        <ul id="menu">
            <li><a href="logout.jsp"><b>MyPage</b></a></li>
            <li><a href="cart.jsp"><b>Cart</b></a></li>
            <li><div class="search-box"><input type=  "text" class="search-txt"name=""placeholder="search"></div></li>
		</ul>  
      <a class="search-btn" href="#">
        <i class="fas fa-search"></i>
      </a>
	</div>
      <%
      request.setCharacterEncoding("utf-8");
      Class.forName("com.mysql.jdbc.Driver");
      String dbUrl="jdbc:mysql://localhost:3306/";
      String dbId="root";
      String dbPass="onlyroot";
      Connection con = DriverManager.getConnection(dbUrl,dbId,dbPass);
      String id = (String)session.getAttribute("id");
      String sql = "select id,name,address,Email,number from Customer where id = ?";
      PreparedStatement pstmt = con.prepareStatement(sql);
      pstmt.setString(1,id);
      ResultSet rs = pstmt.executeQuery();
      %>
     
      <h1>나의 정보 조회</h1>      
      <table border="1">
      <tr>
      <td>아이디</td>
      <td>이름</td>
      <td>주소</td>
      <td>이메일</td>
      <td>전화번호</td>
      </tr>
      <%while(rs.next()){ %>
      <tr>
      <td><%=rs.getString("id") %></td>
      <td><%=rs.getString("name") %></td>
      <td><%=rs.getString("address") %></td>
      <td><%=rs.getString("Email") %></td>
      <td><%=rs.getString("number") %></td>
      </tr>
      <%} %>
      </table>
      <a href = "info.jsp" title="메인이동">메인이동</a>    
</body>
</html>