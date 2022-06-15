<?xml version = "1.0" encoding="utf-8"?>
<%@ page contentType="text/xml; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*, java.io.*, java.net.*"%>
<html>

  <head>
  </head>
  <body>
  
  
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
      Statement stmt=conn.createStatement();

      String selectedName = request.getParameter("name");//나연
      String selectedKiho = request.getParameter("kiho");

      ResultSet rset=stmt.executeQuery("select age, count(age) from tupyo where kiho = "+ selectedKiho +" group by age order by age;");
      
      //해당 후보의 모든 투표 수
      double sum = 0;
      while (rset.next()){
        sum += rset.getInt(2);
      }
      out.println("<datas>");
        
      //0표 받은 나이대도 출력하기 위한 age 연령대를 i로 놓고 for 문 돌리기.
      for(int i=10; i<100; i+=10){
          
          rset = stmt.executeQuery("select ifnull(age,"+i+"), ifnull(count(*),0) from tupyo where age="+i+" and kiho=" + selectedKiho + ";");
          while(rset.next()){

              out.println("<data>");

        double pyoyul = Math.round(((rset.getInt(2)*100)/sum)*10)/10.0;

        out.println("<age>" + rset.getString(1) + "</age>"); 
        out.println("<pyosu>" + rset.getInt(2) + "</pyosu>"); 
        out.println("<pyoyul>" + pyoyul + "</pyoyul>"); 
        out.println("</data>"); 
              }

      }
      out.println("</datas>");
      rset.close();
      stmt.close();
      conn.close();
    %>
</body>
</html>