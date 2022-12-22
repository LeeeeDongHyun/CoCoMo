<%@ page language="java" contentType="text/html; charset=utf-8" 
	import="java.sql.*, SHOP.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mng.css">
  <meta charset="EUC-KR">
  <title>CoCoMo</title>
  </head>
  <body>
  <section>
  <div id="mainmng">
    <br> 
	<%	
 	
 	       ResultSet rs = (ResultSet) request.getAttribute("RS");
 	       if (rs == null) {
 	    	   out.println("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");  
 	    	   return;
 	       }
 	       
 	%>
 	   <H3 align=center > <% out.println(request.getAttribute("title"));   %> </H3>
 	       
 	<% 
 	       String attributeForButton = (String) request.getAttribute("attributeForButton");
 	       String pageForButtonCliked = (String) request.getAttribute("pageForButtonCliked");
System.out.println("   >> attributeForButton = " + attributeForButton + "\n");	
System.out.println("   >> pageForButtonCliked = " + pageForButtonCliked + "\n");	
			rs.last();  // rs 커서를 끝으로 이동하여 투플 개수 확인
			int cntTuples = rs.getRow();  // 투플 개수를 구함
			rs.beforeFirst();  // rs 커서를 처음으로 이동
System.out.println("   >> cntTuples = " + cntTuples + "\n");	
			 
			if (cntTuples == 0) { // 투플 개수가 0이면
				out.println("<center>(결과 없음)</center>");
				return;
			}
			
 	       
 System.out.println("   >> rs : " + rs + "\n");	       
 
		   ResultSetMetaData md = rs.getMetaData();
		   int count = md.getColumnCount();
		   String[] columns = new String[count];
		   String[] columnTypes = new String[count];
		   
		   
		   for(int i=0; i<count; i++){
			   columns[i] = md.getColumnLabel(i+1);
			   columnTypes[i] = md.getColumnTypeName(i+1);
			   
System.out.println("   >> clms : " + columns[i] + " " + columnTypes[i]+ "\n");							
     	   }
			   
	  %>
	  
	  
	   <%      		
	    /*
	      if (cntTuples == 1) { // 투플 개수가 1이면 한 라인에 애트리뷰트명과 애트리뷰트 이름을 출력
			    out.println("<table align=center valign=top border=1 cellpadding=8 cellspacing=0 bordercolor=#999999>");
			
				rs.next(); // ResultSet의 커서 이동
				for(int i=0; i<columns.length; i++){
					out.println("<tr><td bgcolor=#DDDDDD>" + columns[i]  + "</td >" + "<td > &nbsp;" +  rs.getObject(columns[i])  + "&nbsp;</td></tr>");	
				}
				
				out.println("</table>");
				return;
			}
	    */
			
	        out.println("<table align=center valign=top border=1 cellpadding=8 cellspacing=0 bordercolor=#999999>");
			out.println("<tr bgcolor=#6c7ae0 class=\"ftable\" >" );
			for(int i=0; i<columns.length; i++){
				out.println("<th>" + columns[i]  + "</th>" );	
			}
			out.println("</tr>" );
			while(rs.next()) {
				out.println("<tr>" );
				for(int i=0; i<columns.length; i++){
					Object obj= rs.getObject(columns[i]);
 // System.out.println("   >> col value : " + (obj) + "\n");
					if (obj == null)    // null 객체이면 null을 출력
						out.println("<td> null </td>");
					else if (columnTypes[i].equals("INTEGER") || columnTypes[i].equals("FLOAT")
			                             || columnTypes[i].equals("DOUBLE") || columnTypes[i].equals("BIGINT") )
						out.println("<td align=right>" + obj + "</td>");	
					else if (columnTypes[i].equals("VARCHAR") && ((String) obj).equals(""))
					     out.println("<td> &nbsp; </td>");	
					else if (columnTypes[i].equals("VARCHAR") )
						out.println("<td align=left>"+ obj + "</td>");	
 			     	else
					     out.println("<td>" + obj + "</td>");	
				}
				out.println("</tr>" );
			}
      %>
    <br>
    </div>
    </section>
  </body>
</html>
