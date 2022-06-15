<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>

<%@ page errorPage="oneviewError.jsp" %>

<html>
   <head>

      <title> </title>
   </head>
   <body>
      
      
      <%
         Class.forName("com.mysql.jdbc.Driver");
         //Class.forName()을 통해 드라이버를 로드한다.
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
         Statement stmt = conn.createStatement();

         String ckey = request.getParameter("nameppap");
         //이때 리절트셋을 설정 해주기 전에 AllviewDB에서 받은 키값을 getParameter메소드로 구조화하여 변수 ckey에 담아 활용 가능하게 하였다. 

         ResultSet rset = stmt.executeQuery("select * from examtable where name='"+ckey+"';");

         //그리고 DB에서 select하여 값을 받아올 때 where조건문으로 해당 이름이 존재하는 row의 값들만 가져오도록 설정해주었다.

         //드라이버 매니저의 getConnection 메소드로 인자(mysql경로,id,pwd)를 보내어 DB에 연결한다.
		   //연결 완료한 설정을 인스턴스 conn에 담아 구조화 한다.
         //conn의 createStatement 메소드를 Query 작업을 실행하기 위한 Statement형 인스턴스에 담아 정적인 쿼리를 처리할 수 있게 한다.
         out.println("<h1> "+ckey+"조회 </h1>");
         %>
      
      <table cellspacing=1 width = 400 border=1>
         <tr>
            <td align = center>이름</td><!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
            <td align = center>학번</td>
            <td align = center>국어</td>
            <td align = center>영어</td>
            <td align = center>수학</td>
         </tr>
         <%    
            while (rset.next()) {

               out.println("<tr>");
                  out.println("<td width=50><p align=center>" + rset.getString(1) + "</p></td>");
                  out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(2)) + "</p></td>");
                  out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(3)) + "</p></td>");
                  out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(4)) + "</p></td>");
                  out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(5)) + "</p></td>");
               out.println("</tr>");
            }
            rset.close();//사용 후 메모리 절약 위해 닫아주기
            stmt.close();
            conn.close();
         %>
      </table>
      
      
   </body>
</html>


