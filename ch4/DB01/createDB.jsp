<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@ page errorPage="createError.jsp" %>
<html>
   <head>

      <title> </title>
   </head>
   <body>
      <h1> 성적 테이블 생성 완료 </h1> <!--테이블 만들기-->
      
      <%
         Class.forName("com.mysql.jdbc.Driver"); 
         //Class.forName()을 통해 드라이버를 로드한다.
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
         //드라이버 매니저의 getConnection 메소드로 인자(mysql경로,id,pwd)를 보내어 DB에 연결한다.
		   //연결 완료한 설정을 인스턴스 conn에 담아 구조화 한다.
         Statement stmt = conn.createStatement();
         //conn의 createStatement 메소드를 Query 작업을 실행하기 위한 Statement형 인스턴스에 담아 정적인 쿼리를 처리할 수 있게 한다.
         
      %>

         <%
         stmt.execute( "create table examtable("+
				"name varchar(20),"+				
            "studentid int not null primary key,"+		
				"kor int,"+								
				"eng int,"+								
				"mat int);");	
            //스테이트먼트의 execute메소드에 실행할 쿼리문을 삽입하고 명령문을 실행한다.
            stmt.close(); //사용 후 닫아주기
            conn.close();
         %>
      </table>
      
   </body>
</html>