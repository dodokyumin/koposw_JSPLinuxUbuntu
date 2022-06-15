<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
            <html>

            <head>

                <title> 투표하기 </title>
            </head>

            <body>
                <h1>투표하기</h1>
                    <table cellspacing=1 width=400 border=1>
                        <tr>
                            <td height = 50 width=100   align="center"><a href="A_01_H.jsp">후보조회</a></td>
                            </td>
                            <td height = 50  width=100 bgcolor="#00FFFF" align="center"><a href="B_01_H.jsp">투표</a></td>
                            </td>
                            <td  height = 50 width=100  align="center"><a href="C_01_H.jsp">개표결과</a></td>
                            </td>
                        </tr>
                    </table>
                    
                        <% 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
                            Statement stmt=conn.createStatement(); 
                            ResultSet rset=stmt.executeQuery("select * from hubo;");

                        
                        %>
                        
                        
                        
                        <form method="post" action="B_02.jsp" id="ppap">
                        <table cellspacing=3 width=700 height = 50 border=1>
                        <tr>
                            <td height = 50 width="700"><p align="center"><select name="kiho">
                        <%
                            int i = 1;
                            while(rset.next()){
                                out.print("<option value = "+Integer.toString(rset.getInt(1))+">"+Integer.toString(rset.getInt(1)) + "번 " + rset.getString(2) + "</option>"); 
                            i++;
                            }
                            
                        %>

                        </select>
                        
                        <select name="age">
                            <option value="10">10대</option>
                            <option value="20">20대</option>
                            <option value="30">30대</option>
                            <option value="40">40대</option>
                            <option value="50">50대</option>
                            <option value="60">60대</option>
                            <option value="70">70대</option>
                            <option value="80">80대</option>
                            <option value="90">90대</option>
                        </p></select>
                        <td align="center" width=100 height = 50>
                        <input type="submit" value="투표하기">
                    </td>
                    </td>
                    
                    </tr>
                        
                            
                        </table>
                        

                    </form>
                    
                    <%
                        ResultSet rset1=stmt.executeQuery("select * from hubo;");

                            int people = 0;
                            while(rset1.next()){
                                people++;
                            }
                            rset.close();
                            stmt.close();
                            conn.close();
                    %>
                    
                    <script>
                        if(<%=people%>==0){
                            document.getElementById("ppap").style.display='none';
                            
                        }
                    </script>
            </body>

            </html>