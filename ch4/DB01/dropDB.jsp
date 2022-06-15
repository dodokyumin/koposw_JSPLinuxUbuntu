<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@ page errorPage="dropError.jsp" %>
<html>
   <head>

      <title> </title>
   </head>
   <body>
      <h1> 성적 테이블 삭제 완료 </h1>
      
      <%
         Class.forName("com.mysql.jdbc.Driver");
         //Class.forName()을 통해 드라이버를 로드한다.

         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
         Statement stmt = conn.createStatement();

         //드라이버 매니저의 getConnection 메소드로 인자(mysql경로,id,pwd)를 보내어 DB에 연결한다.
		   //연결 완료한 설정을 인스턴스 conn에 담아 구조화 한다.
         //conn의 createStatement 메소드를 Query 작업을 실행하기 위한 Statement형 인스턴스에 담아 정적인 쿼리를 처리할 수 있게 한다.
      %>

         <%
         stmt.execute("drop table if exists examtable"); //해당 쿼리문을 execute를 통해 보낸다. 테이블삭제하기
            stmt.close();//사용후 닫기
            conn.close();//사용후 닫기
         %>
      </table>
      
   </body>
</html>