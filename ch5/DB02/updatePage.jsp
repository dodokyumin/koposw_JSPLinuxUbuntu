<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
            <html>

            <head>
            

                <title> </title>
            </head>

            <body>
                

                <h1>레코드 수정</h1>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
                    Statement stmt = conn.createStatement();

                    String stuName = request.getParameter("stuName");
                    String studentid = request.getParameter("studentid");
                    String stuKor = request.getParameter("stuKor");
                    String stuEng = request.getParameter("stuEng");
                    String stuMat = request.getParameter("stuMat");
                    String stuNameHan = new String (stuName.getBytes("8859_1"),"utf-8");

                    String sql = " update examtable set " +
                    "name = '"+stuNameHan+ "', " +
                    "kor = "+ request.getParameter("stuKor") + ", " +
                    "eng = "+ request.getParameter("stuEng") + ", " +
                    "mat = "+ request.getParameter("stuMat")+
                    " where studentid = "+request.getParameter("studentid");

                    stmt.executeUpdate(sql);

                    ResultSet rset = stmt.executeQuery("select * from examtable;");

                        
                %>

                
                
                
                <table cellspacing=1 width=400 border=1> 
                    <tr>
                        <td width = 100><p align="center">이름</p></td>
                        <td width = 100><p align="center">학번</p></td>
                        <td width = 100><p align="center">국어</p></td>
                        <td width = 100><p align="center">영어</p></td>
                        <td width = 100><p align="center">수학</p></td>
                    </tr>

            <%  
                    while (rset.next()){

                        if( request.getParameter("studentid").equals(Integer.toString(rset.getInt(2)))){
                            out.println("<tr bgcolor = '#ffff00' >");
                            out.println("<td width=50><p align center>"+rset.getString(1)+"</a></p></td>");
                            out.println("<td width=50><p align center>"+rset.getString(2)+"</p></td>");
                            out.println("<td width=50><p align center>"+rset.getString(3)+"</p></td>");
                            out.println("<td width=50><p align center>"+rset.getString(4)+"</p></td>");
                            out.println("<td width=50><p align center>"+rset.getString(5)+"</p></td>");
                        
                        } else {
                            out.println("<tr>");
                            out.println("<td width=50><p align center>"+rset.getString(1)+"</a></p></td>");
                            out.println("<td width=50><p align center>"+rset.getString(2)+"</p></td>");
                            out.println("<td width=50><p align center>"+rset.getString(3)+"</p></td>");
                            out.println("<td width=50><p align center>"+rset.getString(4)+"</p></td>");
                            out.println("<td width=50><p align center>"+rset.getString(5)+"</p></td>");
                            }
                    }
                    rset.close();
                    stmt.close();
                    conn.close();
                %>
            </table>
            </body>

            </html>