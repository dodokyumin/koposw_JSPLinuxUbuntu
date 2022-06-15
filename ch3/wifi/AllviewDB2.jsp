<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<html>
   <head>

      <title> </title>
   </head>
   <body>
      <h1> 와이파이 전체조회 </h1>
      
      <%
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
         Statement stmt = conn.createStatement();
         ResultSet rset = stmt.executeQuery("select * from wifi;");
         //자바에서 DB애 접속하기 위한 코드들을 jsp로 가져와 사용한다.
      %>
      <table cellspacing=1 width = 600 height = 50 border=1>
         <tr>
            <td align = center>번호</td>
            <td align = center>주소</td>
            <td align = center>위도</td>
            <td align = center>경도</td>
            <td align = center>거리</td>
            <!--출력표의 첫 필드 값 리스들을 테이블로 짠다.-->
         </tr>
         <%
            double lat = 37.3860521; //분당 융기원 위도와 경도.
            double lng = 127.1214038;

            while (rset.next()) {
               out.println("<tr>");
               out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(1)) + "</p></td>");
               out.println("<td width=50><p align=center>" + (rset.getString(2)) + "</p></td>");
               out.println("<td width=50><p align=center>" + (rset.getString(3)) + "</p></td>");
               out.println("<td width=50><p align=center>" + (rset.getString(4)) + "</p></td>");
               out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(5)) + "km</p></td>");
               //DB포맷에 맍게 각 값들을 반복문으로 모두 가져와 테이블에 찍어내기.  

               
            }
            rset.close();//메모리 절약하기
            stmt.close();
            conn.close();
         %>
      </table>
   </body>
   <!-- //피타고라스의 정리를 이용해 밑변과 높이 데이터를 가지고 빗변 즉 최단거리를 계산
   //(원래는 지구는 둥그니 삼각함수도 적용해야함) 계산한 실수형 데이터를 변수 distance에 저장. -->
</html>