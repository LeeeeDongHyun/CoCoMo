<%@ page language="java" contentType="text/html; charset=UTF-8" 
	import="java.sql.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher, SHOP.*"%>
        <% request.setCharacterEncoding("UTF-8"); %>
<html>
  <haed>
  <meta charset="UTF-8">
  <title>수정</title>
  </head>
  <body>
   <jsp:useBean class="SHOP.Customer" id="customer" scope="request" />
   <jsp:setProperty name="customer" property="*" />
    <%  
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String address = request.getParameter("address");
    String Email = request.getParameter("Email");
    String number = request.getParameter("number");
    SHA256 sha256 = new SHA256();
    String secPassword = (sha256.encrypt(password));// 기존 비밀번호 암호화
    customer.setPassword(secPassword);// 암호화된 비밀번호 삽입 
    customer.output();
    customer.setId(id);		
   
    SHOPDB db=new SHOPDB();
    boolean result=db.editInform(customer);
    if(result){
    	out.print("<script>alert('수정 완료되었습니다!')</script>");
    	out.print("<script>location='Main.jsp'</script>");
    }
    else{
    	out.print("<script>alert('수정 안됐지렁!')</script>");
    	out.print("<script>location='customerInfo.jsp'</script>");
    }
    %>
  </body>
</html>