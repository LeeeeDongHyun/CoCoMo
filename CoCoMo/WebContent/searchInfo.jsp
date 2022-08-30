<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   import="java.sql.*, SHOP.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<%@include file="header.jsp" %>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/searchInfo.css">
  <title>회원정보조회</title>
  </head>
  <body>
  <jsp:useBean class="SHOP.Customer" id="customer" scope="request" />
   <jsp:setProperty name="customer" property="*" />
    <section>
    <div id="mng">
   <%   
           ResultSet rs = (ResultSet) request.getAttribute("RS");
          String id = request.getParameter("id");
           if (rs== null) {
              out.println("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");  
              return;
           }
           
    %>
    </div>
       <H3 align=center class="id"> <% out.println(request.getAttribute("title"));   %> </H3>
             
    <% 
          rs.last();  // rs 커서를 끝으로 이동하여 투플 개수 확인
         int cntTuples = rs.getRow();  // 투플 개수를 구함
         rs.beforeFirst();  // rs 커서를 처음으로 이동
         System.out.println("   >> cntTuples = " + cntTuples + "\n");   
          
         if (cntTuples==0) { // 투플 개수가 0이면
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
     
     <table id=table align=center valign=top border=1 cellpadding=8 cellspacing=0 bordercolor=#999999>
      <%            
       // 예약번호 따로빼기
       String[] reserveId = new String[cntTuples];
      
      // js에 튜플개수 인원수 넣기
      out.println("<input type=\"hidden\" id=\"cnt\" value=\" "+ cntTuples+ "\">"  );
         out.println("<tr bgcolor=black class=\"ftable\" >" );

         for(int i=0; i<columns.length; i++){
            out.println("<th>" + columns[i]  + "</th>" );   
         }
         out.println("</tr>" );

         int cnt = 0;
         while(rs.next()) {
            reserveId[cnt] = rs.getString("아이디");
            out.println("<input type=\"hidden\" id=\"Id" +cnt+ "\" value=\"" + reserveId[cnt] + "\">" );
            cnt++;

            for(int i=0; i<columns.length; i++){
               Object obj= rs.getObject(columns[i]);
               out.println("<td>" + obj+  "</td>");
            }
            out.println("</tr>" );
         }
         
      %>
      
     </table >
   <%--<%-- 추가버튼누르면 정보전달 --%>
    
    <div class="form-wrapper">
            <form class="btn" action="updateForm.jsp">
               <input type="hidden" name="date" value="">
               <input type="submit" value="회원정보 수정" class="upbtn"> 
          </form>
            <form class="btn" action="deleteForm.jsp">
               <input type="hidden" id ="reserveIdTarget"name="reserveId" value="">
               <input type="submit" value="회원탈퇴" class="delbtn"> 
            </form>
        </div>
    </section>
  </body>
</html>