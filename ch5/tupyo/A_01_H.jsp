<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
            <html>

            <head>

                <title> 후보 조회 </title>
            </head>

            <body>
                <h1>후보 조회</h1>
                    <table cellspacing=1 width=400 border=1>
                        <tr>
                            <td height = 50 width=100 bgcolor="#00FFFF"   align="center"><a href="A_01_H.jsp">후보조회</a></td>
                            </td>
                            <td height = 50  width=100  align="center"><a href="B_01_H.jsp">투표</a></td>
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
                        <table cellspacing=3 width=700 border=1>
                        <%
                        while (rset.next()) {

                            out.println("<form method=\"post\" action=\"A_02.jsp\"><tr height=50><td width=500 name> 기호번호 : <input type=text name=id value=" +Integer.toString(rset.getInt(1))+ " readonly > 후보명 :  <input type=text name=name value='" + rset.getString(2)+ "' readonly required pattern=\'^[가-힣a-zA-Z]+$\'></td><td width=100 align=center><input type=\"submit\" value=\"삭제\"></td></tr></form>");

                        }
                        rset.close();
                        stmt.close();
                        conn.close();
                        %>
                    </table>

                    <form action="A_03.jsp" method="post">
                        <table width=700 border=1>
                            <tr height=50>
                                <td align="left"  width=500>             
                                    기호번호 : <input type="text"  value="자동" readonly required 
                                    pattern='^[0-9]+$'>
                                    후보명 : <input type="text" name= name required  maxlength=20
                                    pattern='^[가-힣a-zA-Z]+$'>
                                </td>
                                <td width=100 align=center>
                                    <input type="submit" value="추가">
                                </td>
                            </tr>
                    </table>
                </form>   
                </form>



            </body>

            </html>