<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher, SHOP.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
  <HEAD>
  <meta charset="EUC-KR">
  <TITLE>회원가입 처리</TITLE>
  </HEAD>
  <BODY>
    <% 
		String id = request.getParameter("id");
   		SHOPDB.loadConnectshop();	
	    boolean result = SHOPDB.cancelInfo(id);
		
		if(result == true){
			out.print("<script>alert('삭제가 완료되었습니다!')</script>");
			out.print("<script>location='Main.jsp'</script>");
		}
		else{
			out.print("<script>alert('삭제가 안됐습니당~!')</script>");
			out.print("<script>location='manager.jsp'</script>");
		}
    %>
  </BODY>
</HTML>