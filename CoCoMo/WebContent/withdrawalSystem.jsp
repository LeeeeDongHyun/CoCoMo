<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher, SHOP.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
  <HEAD>
  <meta charset="EUC-KR">
  <TITLE>ȸ������ ó��</TITLE>
  </HEAD>
  <BODY>
    <% 
		String id = request.getParameter("id");
   		SHOPDB.loadConnectshop();	
	    boolean result = SHOPDB.cancelInfo(id);
		
		if(result == true){
			out.print("<script>alert('������ �Ϸ�Ǿ����ϴ�!')</script>");
			out.print("<script>location='Main.jsp'</script>");
		}
		else{
			out.print("<script>alert('������ �ȵƽ��ϴ�~!')</script>");
			out.print("<script>location='manager.jsp'</script>");
		}
    %>
  </BODY>
</HTML>