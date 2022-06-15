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
                
                    <table cellspacing=1 width=400 border=1>
                        <tr>
                            <td height = 50 width=100    align="center"><a href="A_01_H.jsp">후보등록</a></td>
                            </td>
                            <td height = 50  width=100 bgcolor="#00FFFF" align="center"><a href="B_01_H.jsp">투표</a></td>
                            </td>
                            <td  height = 50 width=100  align="center"><a href="C_01_H.jsp">개표결과</a></td>
                            </td>
                        </tr>
                    </table>
                    <h3>투표를 완료하였습니다.</h3>
                    
                        <% 
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
                            Statement stmt=conn.createStatement();

                            String kihoString = request.getParameter("kiho");
                            String ageTupyo = request.getParameter("age");
                            int kihoTupyo = Integer.parseInt(kihoString);

                            ResultSet rset=stmt.executeQuery("select name from hubo where kiho = "+kihoTupyo+";");
                            
                            String huboName="";

                            
                            while(rset.next()){
                                huboName = rset.getString(1);
                            }
                            out.println("<h4>투표한 후보 : "+ kihoTupyo +" 번 '" + huboName + "' </h4>");
                            
                            stmt.execute("insert into tupyo values("+ kihoTupyo+" , '"+ageTupyo+"');");
                            
                            stmt.close();
                            conn.close();
                        %>
                        
                        

                        <p id="notice">3초 후에 자동으로 투표 화면으로 넘어갑니다.</p>

                        <script>
                            let noti = document.getElementById("notice");
                            
                        function sleep(sec) {
                            return new Promise(resolve => setTimeout(resolve, sec * 1000));
                        } // 함수정의
        
                                (async () => { 
         
                                await sleep(1); // 1초대기
                                    noti.innerText = "2초 후에 자동으로 투표 화면으로 넘어갑니다.";
                                await sleep(1); // 1초대기
                                    noti.innerText = "1초 후에 자동으로 투표 화면으로 넘어갑니다.";
                                await sleep(1); // 1초대기
                                window.location = "B_01_H.jsp";
                                })();
        
                        </script>

            </body>

            </html>