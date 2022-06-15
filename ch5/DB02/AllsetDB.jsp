<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@ page errorPage="AllsetError.jsp" %>

<html>
   <head>

      <title> </title>
   </head>
   <body>
      <h1> 전교생 성적 입력 완료 </h1>
      
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
        int personCount = 10;
        //테이블에 반복하여 넣을 학생 수
         int i = 1;
         while(i <= personCount) { //설정한 학생 수 만큼 반복
        
        String QueryTxt;
             
        QueryTxt = String.format("insert into examtable ("
                     + "name, studentid, kor, eng, mat)"
                     + "values ("
                     + " '홍길%s', %s, RAND()*101, RAND()*101, RAND()*101);",
                     i, 20900+ i
                     );
            
            
            stmt.execute(QueryTxt);
            
            
            i++;
            
         }
         //5명 더 추가하기
         int personCounti = 5;
         int ii = 1;
         while(ii <= personCounti) { 
        
        String QueryTxti;
             
        QueryTxti = String.format("insert into examtable ("
                     + "name, studentid, kor, eng, mat)"
                     + "values ("
                     + " '홍길%s', %s, RAND()*101, RAND()*101, RAND()*101);",
                     ii, 20910+ ii
                     );
            
            
            stmt.execute(QueryTxti);
            
            
            ii++;
            
         }
            stmt.close();
            conn.close();
    %>
      </table>
      
   </body>
</html>