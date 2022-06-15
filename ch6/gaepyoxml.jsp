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

  ResultSet rset=stmt.executeQuery("select hubo.kiho,hubo.name, ifnull(tupyoCount,0) from hubo left outer join (select kiho, count(*) as tupyoCount from tupyo group by kiho) tupyoCount on hubo.kiho = tupyoCount.kiho;");



  out.println("<datas>");
  while (rset.next()) {
    
    out.println("<data>");
    
    out.println("<kiho>" + Integer.toString(rset.getInt(1)) + "</kiho>"); 
    out.println("<name>" + rset.getString(2) + "</name>"); 
    out.println("<count>" + Integer.toString(rset.getInt(3)) + "</count>"); 

    out.println("</data>");
  }

  out.println("</datas>");
  stmt.close();
  conn.close();
%>
</body>
</html>