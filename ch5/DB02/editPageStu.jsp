<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
            <html>

            <head>
                <script>
                    function submitForm (mode){
                        var myform = document.myform;
                        if(mode == "update"){
                            myform.action = "updatePage.jsp";
                            //myform.submit();
                        } else if (mode == "delete"){
                            myform.action = "deletePage.jsp";
                            //myform.submit();
                        }
                    }

                </script>

                <title> </title>
            </head>

            <body>
                


                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
                    Statement stmt = conn.createStatement();

                    String name="", studentid="", stuKor="", stuEng="", stuMat="";

                    String searchid = request.getParameter("searchid");

                    if(searchid.length()==0){
                        searchid = "0";
                    }

                    ResultSet rset = stmt.executeQuery("select * from examtable where studentid = " + searchid);

                    name = "해당 학번 없음.";
                        while(rset.next()){
                            name = rset.getString(1);
                            studentid = rset.getString(2);
                            stuKor = rset.getString(3);
                            stuEng = rset.getString(4);
                            stuMat = rset.getString(5);
                        }

                        stmt.close();
                        conn.close();
                %>

                
                <h1>학생 성적 조회 정정/삭제</h1>
                <form action="editPageStu.jsp" method="post">
                <table cellspacing=1 width=400 border=0>
                    <tr>
                        <td width = 100><p align="center">조회할 학번</p></td>
                        <td width = 200><p align="center"><input type="text" name="searchid"></p></td>
                        <td width = 100><input type="submit" value="조회"></td>
                    </tr>
                </form>

                <form method="post" name="myform">
                    <table cellspacing=1 width=400 border=1>
                        <tr>
                            <td align=center>이름</td><td  align=center>
                                <input name = "stuName" type="text"  value="<%=name%>" readonly></input></td> <!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
                        </tr>
                        <tr>
                            <td align=center>학번</td><td align="center" >
                                <input name = "studentid" value="<%=studentid%>" readonly></input></td> <!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
                        </tr>
                        <tr>
                            <td align=center>국어</td><td  align=center >
                                <input name = "stuKor" type="number" min='0' max="100" value="<%=stuKor%>" maxlength=20 pattern='^[0-9]+$' required ></input></td> <!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
                        </tr>
                        <tr>
                            <td align=center>영어</td><td  align=center>
                            <input name = "stuEng" type="number" min='0' max="100" value="<%=stuEng%>" maxlength=20 pattern='^[0-9]+$' required ></input></td> <!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
                        </tr>
                        <tr>
                            <td align=center>수학</td><td  align=center>
                                <input name = "stuMat" type="number" min='0' max="100" value="<%=stuMat%>" maxlength=20 pattern='^[0-9]+$' required ></input></td> <!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
                        </tr>
                        
                    </table>

                    <%
                        if(studentid.length()!=0){
                            out.println("<table cellspacing=1 width=400 border=0>");
                            out.println("<tr>");
                            out.println("<td width=\"200\"></td>");
                            out.println("<td width=\"100\"><p align=\"center\"><input type=\"submit\" value=\"수정\" onclick=\"submitForm('update')\"></p></td>");
                            out.println("<td width=\"100\"><p align=\"center\"><input type=\"submit\" value=\"삭제\" onclick=\"submitForm('delete')\"></p></td>");
                            out.println("</tr>");
                            out.println("</table>");
                        }
                    %>
                </form>

            </body>

            </html>