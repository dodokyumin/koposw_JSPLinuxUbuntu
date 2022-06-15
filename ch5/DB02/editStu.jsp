<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
            <html>

            <head>

                <title> </title>
            </head>

            <body>
                <h1> 학생 성적 조회 정정/삭제</h1>

                <form action="editPageStu.jsp" method="post">
                <table cellspacing=1 width=400 border=0>
                    <tr>
                        <td width = 100><p align="center">조회할 학번</p></td>
                        <td width = 200><p align="center"><input type="number" name="searchid"></p></td>
                        <td width = 100><input type="submit" value="조회"></td>
                    </tr>
                </form>
                <form>


                    <table cellspacing=1 width=600 border=1>
                        <tr>
                            <td align=center>이름</td><td  align=center>
                                <input name = "stuName" type="text"  value= "" readonly></input></td>
                        </tr>
                        <tr>
                            <td align=center>학번</td><td align="center" ><input value="" readonly></input></td>
                        <tr>
                            <td align=center>국어</td><td  align=center >
                                <input name = "stuKor" type="number" min='0' max="100" value="" readonly></input></td> 
                        </tr>
                        <tr>
                            <td align=center>영어</td><td  align=center>
                            <input name = "stuEng" type="number" min='0' max="100" value="" readonly></input></td> 
                        </tr>
                        <tr>
                            <td align=center>수학</td><td  align=center>
                                <input name = "stuMat" type="number" min='0' max="100" value="" readonly></input></td> 
                        </tr>
                        
                    </table>
                </form>

            </body>

            </html>