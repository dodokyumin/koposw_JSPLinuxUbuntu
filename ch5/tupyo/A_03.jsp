<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
            <html>

            <head>

                <title> 후보 등록 </title>
            </head>

            <body>
                <h1>후보 등록</h1>
                <form action="">
                    <table cellspacing=1 width=400 border=1>
                        <tr>
                            <td height = 50 width=100 bgcolor="#00FFFF"   align="center"><a href="A_01_H.jsp">후보등록</a></td>
                            </td>
                            <td height = 50  width=100  align="center"><a href="B_01_H.jsp">투표</a></td>
                            </td>
                            <td  height = 50 width=100  align="center"><a href="C_01_H.jsp">개표결과</a></td>
                            </td>
                        </tr>
                    </table>
                    <h3>해당 후보가 추가되었습니다.</h3>
                    
                        <% 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
                            Statement stmt=conn.createStatement();

                            String addName = request.getParameter("name");

                            String addNameHan = new String (addName.getBytes("8859_1"),"utf-8");

                            ResultSet rset=stmt.executeQuery("select * from hubo order by kiho");

                            int newKiho = 1;

                            while(rset.next()){
                                if(rset.getInt(1) != newKiho){
                                    break;
                                }
                                newKiho++;
                            }
                            stmt.execute("insert into hubo values("+ newKiho +",'" + addNameHan + "');");
                            out.println("<h4>추가된 후보 : "+ newKiho +" 번 '" + addNameHan + "'</h4>");
                                stmt.close();
                                conn.close();
                        %>
                        
                </form>
                <p id="notice">3초 후에 자동으로 후보 조회 화면으로 넘어갑니다.</p>

                <script>
                    let noti = document.getElementById("notice");
                    
                function sleep(sec) {
                    return new Promise(resolve => setTimeout(resolve, sec * 1000));
                } // 함수정의

                        (async () => { 

                        await sleep(1); // 1초대기
                            noti.innerText = "2초 후에 자동으로 후보 조회 화면으로 넘어갑니다.";
                        await sleep(1); // 1초대기
                            noti.innerText = "1초 후에 자동으로 후보 조회 화면으로 넘어갑니다.";
                        await sleep(1); // 1초대기
                        window.location = "A_01_H.jsp";
                        })();

                </script>


            </body>

            </html>