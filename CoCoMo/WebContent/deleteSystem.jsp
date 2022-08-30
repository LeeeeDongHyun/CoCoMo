<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher, SHOP.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
  <head>
  <meta charset="EUC-KR">
  <title>회원탈퇴하기 시스템</title>
  </head>
  <body>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");

SHOPDB.loadConnectshop();
boolean result=SHOPDB.deleteId(id,password);
if(result){
	session.invalidate();
	out.print("<script>alert('삭제가 완료되었습니다!')</script>");
	out.print("<script>location='Main.jsp'</script>");
}
else{
	out.print("<script>alert('삭제 안됐지렁!')</script>");
	out.print("<script>location='customerInfo.jsp'</script>");
}
%>
  </body>
</html>