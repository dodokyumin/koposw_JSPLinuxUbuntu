<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@ page errorPage="AllviewError.jsp" %>
<html>
   <head>

      <title> </title>
   </head>
   <body>
      <h1> 전교생 성적 조회 </h1>
      
      <%
         Class.forName("com.mysql.jdbc.Driver");
         //Class.forName()을 통해 드라이버를 로드한다.
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
         Statement stmt = conn.createStatement();
         ResultSet rset = stmt.executeQuery("select * from examtable;");
         //드라이버 매니저의 getConnection 메소드로 인자(mysql경로,id,pwd)를 보내어 DB에 연결한다.
		   //연결 완료한 설정을 인스턴스 conn에 담아 구조화 한다.
         //conn의 createStatement 메소드를 Query 작업을 실행하기 위한 Statement형 인스턴스에 담아 정적인 쿼리를 처리할 수 있게 한다.

      %>
      <table cellspacing=1 width = 600 border=1>
         <tr>
            <td align = center>이름</td> <!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
            <td align = center>학번</td>
            <td align = center>국어</td>
            <td align = center>영어</td>0
            <td align = center>수학</td>
         </tr>
         <%
            while (rset.next()) {
               
               String han = rset.getString(1);
               //String ckey = URLEncoder.encode(han, "utf-8");
               //String cURL = "oneview.jsp?name='"+han+"'";
               //기본적으로 charset=utf-8이 설정 되어있기 때문에 인코딩과 디코딩을 할 필요는 없음.
               //학생의 이름을 String 변수에 저장을 한다.

               out.println("<tr>");
               out.println("<td width=50><p align=center><a href='oneview.jsp?nameppap="+han+"'>" + rset.getString(1) + "</a></p></td>");
               //url ? key이름 = 값
               //형식으로 다른 페이지와 한 개 이상의 키 값들을 주고 받으며 상호작용할 수 있다.
               out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(2)) + "</p></td>");
               out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(3)) + "</p></td>");
               out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(4)) + "</p></td>");
               out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(5)) + "</p></td>");
            }
            rset.close();
            stmt.close();
            conn.close();
         %>
      </table>
   </body>
</html>