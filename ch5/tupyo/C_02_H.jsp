<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
            <html>

            <head>

                <title> 개표 결과 </title>
            </head>

            <body>
                <% 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
                            Statement stmt=conn.createStatement();
                        %>

                <h1>후보 득표 연령대 성향</h1>
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
                    
                    <table cellspacing="3" width="700" border="1">
                        <tr>
                            <td width=75><p align="center">연령대</p></td>
                            <td width=75><p align="center">인기도</p></td>
                        </tr>

                        <%
                            String selectedName = request.getParameter("name");//나연
                            String selectedKiho = request.getParameter("kiho");    
                        
                            ResultSet rset=stmt.executeQuery("select age, count(age) from tupyo where kiho = "+ selectedKiho +" group by age order by age;");

                            double sum = 0;
                            while(rset.next()){
                                sum += rset.getInt(2);
                            }
                            
                            

                            
                            rset=stmt.executeQuery("select age, count(age) from tupyo where kiho = "+ selectedKiho +" group by age order by age;");

                            
                            

                            for(int i=10; i<100; i+=10){
                                
                                ResultSet rset1 = stmt.executeQuery("select ifnull(count(*),0) from tupyo where age="+i+" and kiho=" + selectedKiho + ";");
                                while(rset1.next()){
                                    double per = (rset1.getInt(1)/sum)*100.0;
                                    double perRound = Math.round(per*100) /100.0;
                                    
                                    out.print("<tr><td width = 75><p align=center>"+ i + "대" + "</p></td>"); 
                                    out.print("<td width = 500><p align=left><img src=bar.png width="+ perRound*5 + " height=20>"+ Integer.toString(rset1.getInt(1)) +"("+ perRound +"%)"+ "</p></a></td></tr>");
                                
                                    }

                            }
                            rset.close();
                            stmt.close();
                            conn.close();
                        %>

                    </table>                   
                        
                        
                </form>



            </body>

            </html>