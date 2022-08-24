<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*, SHOP.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 처리</title>
</head>
<body>
<%  
      String id = request.getParameter("id");
      String password = request.getParameter("password");
      
      if (id.equals("") || password.equals("")) {
      		out.print("<script>alert('로그인 아이디와 패스워드가 모두 입력되지 않았습니다.')</script>");
      		out.print("<script>location='login.jsp'</script>");
       }
      
   // 비밀번호 암호화
      SHA256 sha256 = new SHA256();
    	String secPassword = (sha256.encrypt(password));// 기존 비밀번호 암호화
    	
    	SHOPDB.loadConnectshop();	
 	    Customer customer = SHOPDB.loginProcess(id, secPassword);// 회원정보찾기
 		
     if (customer == null) {
    		out.print("<script>alert('잘못된 아이디 또는 패스워드 입니다.')</script>");     
    		out.print("<script>location='login.jsp'</script>");
     }
     else if(customer.getId().equals("admin")){
   	  System.out.println("  <<for debug >> 로그인한 아이디 : " + customer.getId() + ", 사용자 이름: " + customer.getName() + "\n");
   	  session.setAttribute("customer", customer);  // // 세션처리
   	  out.print("<script>location='manager.jsp'</script>");
     }
     else {
		System.out.println("  <<for debug >> 로그인한 아이디 : " + customer.getId() + ", 사용자 이름: " + customer.getName() + "\n");
   		session.setAttribute("customer", customer);  // // 세션처리
   		response.sendRedirect("Product?cmd=Main");

     }
 	    
      %>
</body>
</html>