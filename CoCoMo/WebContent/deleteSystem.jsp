<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher, SHOP.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
  <HEAD>
  <meta charset="EUC-KR">
  <TITLE>삭제</TITLE>
  </HEAD>
  <BODY>
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
  </BODY>
</HTML>