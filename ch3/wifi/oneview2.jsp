<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<html>
   <head>

      <title> </title>
   </head>
   <body>
      <h1 align=center> 와이파이 페이지 </h1>
      
      <%
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
         Statement stmt = conn.createStatement();

         String fromPT = request.getParameter("from");
         String cntPT = request.getParameter("cnt");
         //자바에서 DB애 접속하기 위한 코드들을 jsp로 가져와 사용한다.
         //페이지에서 넘겨받은 키값으로 rewultset에 리미트를 부여했다.
         ResultSet rset = stmt.executeQuery("select * from wifi LIMIT "+(fromPT)+", "+(cntPT)+";");
      %>
      <table align=center cellspacing=1 width = 1200 border=1>
         <tr>
            <td align = center>번호</td>
            <td align = center>주소</td>
            <td align = center>위도</td>
            <td align = center>경도</td>
            <td align = center>거리</td>
            <!--출력표의 첫 필드 값 리스들을 테이블로 짠다.-->
         </tr>
         <%    
            while (rset.next()) {
               out.println("<tr>");
               out.println("<td width=30><p align=center>" + Integer.toString(rset.getInt(1)) + "</p></td>");
               out.println("<td width=100><p align=center>" + (rset.getString(2)) + "</p></td>");
               out.println("<td width=15><p align=center>" + (rset.getString(3)) + "</p></td>");
               out.println("<td width=15><p align=center>" + (rset.getString(4)) + "</p></td>");
               out.println("<td width=20><p align=center>" + Integer.toString(rset.getInt(5)) + "km</p></td>");
               //DB포맷에 맍게 각 값들을 반복문으로 모두 가져와 테이블에 찍어내기. 
            }
            rset.close();//메모리 절약 꺼주기
            stmt.close();
            conn.close();
         %>
      </table>
      
      
   </body>
</html>
