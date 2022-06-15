<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>

<html>
   <head>

      <title> </title>
   </head>
   <body>
      <h1> 전교생 성적 조회 </h1>
      
      <%
         Class.forName("com.mysql.jdbc.Driver");
         //Class.forName()을 통해 드라이버를 로드한다.
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
         Statement stmt = conn.createStatement();

         ResultSet rset1 = stmt.executeQuery("select * from examtable");
         int total = 0;
         while(rset1.next()){
            total++;
            }
         Integer front = Integer.parseInt(request.getParameter("front"));
         Integer back = Integer.parseInt(request.getParameter("back"));
         Integer k = Integer.parseInt(request.getParameter("page"));

         ResultSet rset = stmt.executeQuery("select * from examtable limit " + front +" , "+ back +" ;");
         //드라이버 매니저의 getConnection 메소드로 인자(mysql경로,id,pwd)를 보내어 DB에 연결한다.
		   //연결 완료한 설정을 인스턴스 conn에 담아 구조화 한다.
         //conn의 createStatement 메소드를 Query 작업을 실행하기 위한 Statement형 인스턴스에 담아 정적인 쿼리를 처리할 수 있게 한다.

      %>
      <table cellspacing=1 width = 400 border=1>
         <tr>
            <td align = center>이름</td> <!-- 출력하여 보여줄 ui 테이블 맨 윗 항목 설정-->
            <td align = center>학번</td>
            <td align = center>국어</td>
            <td align = center>영어</td>
            <td align = center>수학</td>
         </tr>
         <%
            
            while (rset.next()) {
               
               String han = rset.getString(1);
               //String ckey = URLEncoder.encode(han, "utf-8");
               //String cURL = "oneview.jsp?name='"+han+"'";
               //기본적으로 charset=utf-8이 설정 되어있기 때문에 인코딩과 디코딩을 할 필요는 없음.
               //학생의 이름을 String 변수에 저장을 한다.

               out.println("<tr>");
               out.println("<td width=50><p align=center><a href='oneview.jsp?nameppap="+han+"'>" + rset.getString(1) + "</a></p></td>");
               //url ? key이름 = 값
               //형식으로 다른 페이지와 한 개 이상의 키 값들을 주고 받으며 상호작용할 수 있다.
               out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(2)) + "</p></td>");
               out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(3)) + "</p></td>");
               out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(4)) + "</p></td>");
               out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(5)) + "</p></td>");
            }


            int count = 10;
            double finalPage = ((double)total/(double)count); // 111/10 = 11.1
            


            if (total !=0){
               if (total/count>10){
               if (k >1){
                  out.print("<a href='AllviewDB.jsp?front="+((k-2)*(10*count))+"&back="+count+"&page="+(k-1)+"'>" + "<<" + "</a>"); // << 모양 링크 누르면 1페이지로 돌아감
               } else {
                  out.print("<a href=AllviewDB.jsp?front=0&back=10&page=1>" + "<<" + "</a>"); // << 모양 링크 누르면 1페이지로 돌아감
               }
            }
            
            for (int i=1;i<11;i++){
               out.print("<a href='AllviewDB.jsp?front="+ ((k-1)*(10*count)+((i-1)*count)) +"&back="+count+"&page="+k+"'>"+ (((k-1)*count)+i) +"  </a>"); //시작 값을 get방식으로 보내기 위해 url에 붙임
               if ((((k-1)*count)+i) == Math.ceil(finalPage)){ //k=2 1*10+1 == 11.1
                  break;
               }
            }
            if(k < (finalPage/10)){
               out.print("<a href='AllviewDB.jsp?front="+ ((k)*(10*count)) +"&back="+count+"&page="+(k+1)+"'>" + ">>" + "</a>"); // >>모양 링크 누르면 11페이지로 감
            } else {
               k=k-1;
            }
            }
      










            rset.close();
            stmt.close();
            conn.close();
         %>
      </table>
   </body>
</html>