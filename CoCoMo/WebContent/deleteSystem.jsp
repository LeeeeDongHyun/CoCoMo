<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher, SHOP.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
  <HEAD>
  <meta charset="EUC-KR">
  <TITLE>����</TITLE>
  </HEAD>
  <BODY>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");

SHOPDB.loadConnectshop();
boolean result=SHOPDB.deleteId(id,password);
if(result){
	session.invalidate();
	out.print("<script>alert('������ �Ϸ�Ǿ����ϴ�!')</script>");
	out.print("<script>location='Main.jsp'</script>");
}
else{
	out.print("<script>alert('���� �ȵ�����!')</script>");
	out.print("<script>location='customerInfo.jsp'</script>");
}
%>
  </BODY>
</HTML>