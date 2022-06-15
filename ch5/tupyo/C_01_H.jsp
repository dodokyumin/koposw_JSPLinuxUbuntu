<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
            <html>

            <head>

                <title> 개표 결과 </title>
            </head>

            <body>
                <h1>후보별 득표 결과</h1>
                <form action="">
                    <table cellspacing=1 width=400 border=1>
                        <tr>
                            <td height = 50 width=100    align="center"><a href="A_01_H.jsp">후보등록</a></td>
                            </td>
                            <td height = 50  width=100  align="center"><a href="B_01_H.jsp">투표</a></td>
                            </td>
                            <td  height = 50 width=100  bgcolor="#00FFFF" align="center"><a href="C_01_H.jsp">개표결과</a></td>
                            </td>
                        </tr>
                    </table>
                    <% 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
                            Statement stmt=conn.createStatement();
                            ResultSet rset=stmt.executeQuery("select a.kiho, b.name, count(a.kiho) "+ 
                            "from tupyo as a, hubo as b " +
                            "where a.kiho = b.kiho " +
                            "group by a.kiho;");

                        %>
                    <table cellspacing="3" width="700" border="1">
                        <tr>
                            <td width=75><p align="center">이름</p></td>
                            <td width=75><p align="center">인기도</p></td>
                        </tr>

                        
                        <%
                            double sum = 0;
                            while(rset.next()){
                                sum += rset.getInt(3);
                            }
                            
                            rset=stmt.executeQuery("select hubo.kiho,hubo.name, ifnull(tupyoCount,0) from hubo left outer join (select kiho, count(*) as tupyoCount from tupyo group by kiho) tupyoCount on hubo.kiho = tupyoCount.kiho;");

                            while(rset.next()){
                                
                                
                              double per = (rset.getInt(3)/sum)*100;
                              double perRound = Math.round(per*100) /100.0;
                              
                              out.print("<tr><td width = 200><a href=C_02_H.jsp?name="+rset.getString(2)+"&kiho="+ rset.getInt(1) +" ><p align=center>"+ rset.getString(2)+ "</p></a></td>"); 
                              out.print("<td width = 500<p align=left><img src=bar.png width="+ perRound*4  + " height=20>"+ Integer.toString(rset.getInt(3)) +"("+ perRound +"%)"+ "</p></a></td></tr>"); 

                            }
                            rset.close();
                            stmt.close();
                            conn.close();
                        %>

                    </table>                   
                        
                        
                </form>



            </body>

            </html>