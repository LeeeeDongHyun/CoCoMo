<%@ page language="java" contentType="text/html; charset=UTF-8"
     import="java.sql.*, SHOP.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃</title>
</head>
<body>
<%        
		Customer customerLogout = (Customer) session.getAttribute("customer");
       
       session.setAttribute("customer", null);
       session.setAttribute("customerLogout", customerLogout);
       System.out.println("  <<for debug >> logout ID: '" + customerLogout.getId() + "'\n");
       response.sendRedirect("Product?cmd=Main");
       %>

</body>
</html>