<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, util.*, SHOP.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
    <% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%  
    
      // 세션 정보 불러오기
      Customer customer = (Customer) session.getAttribute("customer");
	  String id = customer.getId();
	  
      SHOPDB.loadConnectshop();		
  	  ResultSet result = SHOPDB.getcustomerInfo(id);
  	  request.setAttribute("title", id+"님의 회원정보"); 
      request.setAttribute("RS", result); 
      request.getRequestDispatcher("searchInfo.jsp").forward(request, response);
   %>
</body>
</html>