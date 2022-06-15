<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
            <html>

            <head>

                <title> </title>
            </head>

            <body>
                <h1> 학생 성적 추가 완료 </h1>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
                    Statement stmt = conn.createStatement();

                    String stuName = request.getParameter("stuName");
                    String stuKor = request.getParameter("stuKor");
                    String stuEng = request.getParameter("stuEng");
                    String stuMat = request.getParameter("stuMat");
                    int NewStdId = 0;

                    String stuNameHan = new String(stuName.getBytes("8859_1"),"utf-8");




                    int newId = 1;
                    ResultSet rset=stmt.executeQuery("select * from examtable order by studentid");
                            while(rset.next()){
                                if(rset.getInt(2) != (20900+newId)){
                                    break;
                                }
                                newId++;
                            }
                            

                            stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('"+ stuNameHan+ "'," + (20900+newId) +"," +stuKor +"," + stuEng + "," + stuMat + ");");
                            //stmt.execute("insert into hubo values("+ newId +",'" + addNameHan + "');");
                            out.println("<h4>추가된 학생 : "+ (20900 + newId) +" 번 '" + stuNameHan + "'</h4>");


                            int Newid=20900 + newId;


                   // ResultSet rset = stmt.executeQuery("select max(studentid) from examtable;");
                   //     while (rset.next()){
                     //       NewStdId = rset.getInt(1) +1;
                       // }


                %>
                <form action="addStu.jsp" method="post">
                    <table cellspacing=1 width=400 border=1>
                        <tr>
                            <td align=center>이름</td><td  align=center>
                                <input name = "stuName" type="text"  value="<%=stuNameHan%>" readonly></input></td> <!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
                        </tr>
                        <tr>
                            <td align=center>학번</td><td align="center" ><input value= <%=Newid%> readonly></input></td> <!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
                        </tr>
                        <tr>
                            <td align=center>국어</td><td  align=center>
                                <input name = "stuKor" type="number" min='0' max="100" value="<%=stuKor%>" readonly></input></td> <!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
                        </tr>
                        <tr>
                            <td align=center>영어</td><td  align=center>
                            <input name = "stuEng" type="number" min='0' max="100" value="<%=stuEng%>" readonly></input></td> <!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
                        </tr>
                        <tr>
                            <td align=center>수학</td><td  align=center>
                                <input name = "stuMat" type="number" min='0' max="100" value="<%=stuMat%>" readonly></input></td> <!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
                        </tr>
                        
                    </table>
                    <input type="submit" value="뒤로가기" >
                </form>

                    <%
                            rset.close();
                            stmt.close();
                            conn.close();
                        %>
            </body>

            </html>