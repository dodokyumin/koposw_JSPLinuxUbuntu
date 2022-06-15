<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<html>
   <head>

      <title> </title>
   </head>
   <body>
      <h1 align=center> 와이파이 페이지 </h1>
      
      <%
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw44","root","koposw44");
         Statement stmt = conn.createStatement();

         String fromPT = request.getParameter("from");
         String cntPT = request.getParameter("cnt");
         //자바에서 DB애 접속하기 위한 코드들을 jsp로 가져와 사용한다.
         //페이지에서 넘겨받은 키값으로 rewultset에 리미트를 부여했다.
         ResultSet rset = stmt.executeQuery("select * from wifi LIMIT "+(fromPT)+", "+(cntPT)+";");
      %>
      <table align=center cellspacing=1 width = 1200 border=1>
         <tr>
            <td align = center>번호</td>
            <td align = center>주소</td>
            <td align = center>위도</td>
            <td align = center>경도</td>
            <td align = center>거리</td>
            <!--출력표의 첫 필드 값 리스들을 테이블로 짠다.-->
         </tr>
         <%    
            while (rset.next()) {
               out.println("<tr>");
               out.println("<td width=30><p align=center>" + Integer.toString(rset.getInt(1)) + "</p></td>");
               out.println("<td width=100><p align=center>" + (rset.getString(2)) + "</p></td>");
               out.println("<td width=15><p align=center>" + (rset.getString(3)) + "</p></td>");
               out.println("<td width=15><p align=center>" + (rset.getString(4)) + "</p></td>");
               out.println("<td width=20><p align=center>" + Integer.toString(rset.getInt(5)) + "km</p></td>");
               //DB포맷에 맍게 각 값들을 반복문으로 모두 가져와 테이블에 찍어내기. 
            }
            rset.close();//메모리 절약 꺼주기
            stmt.close();
            conn.close();
         %>
      </table>
      <!--각 번호 버튼의 index값에 변동을 주고, 해당 인덱스를 DB로 키값 보내어 저장된 데이터 확인하는 방식.-->
      <table align="center">
         <tr><td align="center">
         <span ><a id="leftList" href="oneview2.jsp?from=0&cnt=10" target="main"><<</a></span>
         <span ><a id="num1" href="oneview2.jsp?from=&cnt=10" target="main">1</a></span>
         <span ><a id="num2" href="oneview2.jsp?from=10&cnt=10" target="main">2</a></span>
         <span ><a id="num3" href="oneview2.jsp?from=20&cnt=10" target="main">3</a></span>
         <span ><a id="num4" href="oneview2.jsp?from=30&cnt=10" target="main">4</a></span>
         <span ><a id="num5" href="oneview2.jsp?from=40&cnt=10" target="main">5</a></span>
         <span ><a id="num6" href="oneview2.jsp?from=50&cnt=10" target="main">6</a></span>
         <span ><a id="num7" href="oneview2.jsp?from=60&cnt=10" target="main">7</a></span>
         <span ><a id="num8" href="oneview2.jsp?from=70&cnt=10" target="main">8</a></span>
         <span ><a id="num9" href="oneview2.jsp?from=80&cnt=10" target="main">9</a></span>
         <span><a  id="num10" href="oneview2.jsp?from=90&cnt=10" target="main">10</a></span>
         <span><a id="rightList" href="oneview2.jsp?from=100&cnt=10" target="main">>></a></span>

         <script>
                     
         </script>
         
         <!--1페이지와 마지막 페이지는 디폴트로 설정해주었다.-->
         </td></tr>
</table>
         <script>
            
            let cnt = 0;

            let pageNum = 1;

            if(localStorage.getItem("newPageNum") == null){
               pageNum = 1;
            } else {
               pageNum = parseInt(localStorage.getItem("newPageNum"));
            }
            if(localStorage.getItem("newCnt") == null){
               cnt = 0;
            } else {
               cnt = parseInt(localStorage.getItem("newCnt"));
            }
            
               document.getElementById("num1").innerHTML = pageNum;
               document.getElementById("num2").innerHTML = pageNum+1;
               document.getElementById("num3").innerHTML = pageNum+2;
               document.getElementById("num4").innerHTML = pageNum+3;
               document.getElementById("num5").innerHTML = pageNum+4;
               document.getElementById("num6").innerHTML = pageNum+5;
               document.getElementById("num7").innerHTML = pageNum+6;
               document.getElementById("num8").innerHTML = pageNum+7;
               document.getElementById("num9").innerHTML = pageNum+8;
               document.getElementById("num10").innerHTML = pageNum+9;

             
             let left = document.getElementById('leftList');
             let num1 = document.getElementById('num1');
             let num2 = document.getElementById('num2');
             let num3 = document.getElementById('num3');
             let num4 = document.getElementById('num4');
             let num5 = document.getElementById('num5');
             let num6 = document.getElementById('num6');
             let num7 = document.getElementById('num7');
             let num8 = document.getElementById('num8');
             let num9 = document.getElementById('num9');
             let num10 = document.getElementById('num10');
             let right = document.getElementById('rightList');
            
             if(parseInt(localStorage.getItem("newCnt")) > 26){
                     cnt = 27;
                     pageNum = 271;
                     //마지막 번호 라인의 링크 인덱스는 271이다.
                     console.log("skdmaksmdkasmdkasmdkasmdks");
                     num1.innerText = 271;
                     num2.innerText = 272;
                     num3.innerText = 273;
                     num4.innerText = 274;
                     num5.innerText = 275;
                     num6.innerText = 276;
                     num7.innerText = 277;
                     num8.innerText = "";
                     num9.innerText = "";
                     num10.innerText = "";
                     right.innerText ="";
                     num1.href = "oneview2.jsp?from="+((270)*10)+"&cnt=10"; //2701~2710
                     num2.href = "oneview2.jsp?from="+((270+1)*10)+"&cnt=10"; //12이 되면 111~120, 22가 되면 211~220
                     num3.href = "oneview2.jsp?from="+((270+2)*10)+"&cnt=10";
                     num4.href = "oneview2.jsp?from="+((270+3)*10)+"&cnt=10";
                     num5.href = "oneview2.jsp?from="+((270+4)*10)+"&cnt=10";
                     num6.href = "oneview2.jsp?from="+((270+5)*10)+"&cnt=10";
                     num7.href = "oneview2.jsp?from="+((270+6)*10)+"&cnt=10";
                     
                     right.href = "oneview2.jsp?from="+(2700)+"&cnt=10";//11이면 101~110
                     //1페이지와 마지막 페이지는 디폴트로 설정해주었다.
                     window.localStorage.clear();
                     localStorage.setItem("newPageNum", pageNum);
                     localStorage.setItem("newCnt", cnt);
                 }
                     num1.href = "oneview2.jsp?from="+(pageNum*10-10)+"&cnt=10"; //11이 되면 101~110, 21이 되면 201~210
                     num2.href = "oneview2.jsp?from="+((pageNum+1)*10-10)+"&cnt=10"; //12이 되면 111~120, 22가 되면 211~220
                     num3.href = "oneview2.jsp?from="+((pageNum+2)*10-10)+"&cnt=10";
                     num4.href = "oneview2.jsp?from="+((pageNum+3)*10-10)+"&cnt=10";
                     num5.href = "oneview2.jsp?from="+((pageNum+4)*10-10)+"&cnt=10";
                     num6.href = "oneview2.jsp?from="+((pageNum+5)*10-10)+"&cnt=10";
                     num7.href = "oneview2.jsp?from="+((pageNum+6)*10-10)+"&cnt=10";
                     num8.href = "oneview2.jsp?from="+((pageNum+7)*10-10)+"&cnt=10";
                     num9.href = "oneview2.jsp?from="+((pageNum+8)*10-10)+"&cnt=10";
                     num10.href = "oneview2.jsp?from="+((pageNum+9)*10-10)+"&cnt=10";
                     right.href = "oneview2.jsp?from="+(pageNum*10-10)+"&cnt=10";

            
     
     
             function turnToForward( ){
                 
                 cnt += 1;
                 
                  
                 if(parseInt(localStorage.getItem("newCnt")) > 26){
                     cnt = 27;
                     pageNum = 271;

                     num1.innerText = 271;
                     num2.innerText = 272;
                     num3.innerText = 273;
                     num4.innerText = 274;
                     num5.innerText = 275;
                     num6.innerText = 276;
                     num7.innerText = 277;
                     num8.innerText = "";
                     num9.innerText = "";
                     num10.innerText = "";
                     right.innerText ="";
                     num1.href = "oneview2.jsp?from="+((270)*10)+"&cnt=10"; //2701~2710
                     num2.href = "oneview2.jsp?from="+((270+1)*10)+"&cnt=10"; //12이 되면 111~120, 22가 되면 211~220
                     num3.href = "oneview2.jsp?from="+((270+2)*10)+"&cnt=10";
                     num4.href = "oneview2.jsp?from="+((270+3)*10)+"&cnt=10";
                     num5.href = "oneview2.jsp?from="+((270+4)*10)+"&cnt=10";
                     num6.href = "oneview2.jsp?from="+((270+5)*10)+"&cnt=10";
                     num7.href = "oneview2.jsp?from="+((270+6)*10)+"&cnt=10";
                     
                     right.href = "oneview2.jsp?from="+(2700)+"&cnt=10";//11이면 101~110
                     //1페이지와 마지막 페이지는 디폴트로 설정해주었다.
                     window.localStorage.clear();
                     localStorage.setItem("newPageNum", pageNum);
                     localStorage.setItem("newCnt", cnt);
                 }else{
                     
                     pageNum += 10;
                     //오른 화살표 클릭의 이벤트 이므로 왼클릭의 링크 코드를 정정해줄 필요 없음.
                     num1.href = "oneview2.jsp?from="+(pageNum*10-10)+"&cnt=10"; //11이 되면 101~110, 21이 되면 201~210
                     num2.href = "oneview2.jsp?from="+((pageNum+1)*10-10)+"&cnt=10"; //12이 되면 111~120, 22가 되면 211~220
                     num3.href = "oneview2.jsp?from="+((pageNum+2)*10-10)+"&cnt=10";
                     num4.href = "oneview2.jsp?from="+((pageNum+3)*10-10)+"&cnt=10";
                     num5.href = "oneview2.jsp?from="+((pageNum+4)*10-10)+"&cnt=10";
                     num6.href = "oneview2.jsp?from="+((pageNum+5)*10-10)+"&cnt=10";
                     num7.href = "oneview2.jsp?from="+((pageNum+6)*10-10)+"&cnt=10";
                     num8.href = "oneview2.jsp?from="+((pageNum+7)*10-10)+"&cnt=10";
                     num9.href = "oneview2.jsp?from="+((pageNum+8)*10-10)+"&cnt=10";
                     num10.href = "oneview2.jsp?from="+((pageNum+9)*10-10)+"&cnt=10";
                     right.href = "oneview2.jsp?from="+(pageNum*10-10)+"&cnt=10";//11이면 101~110
     
                     //innertext를 통해 안의 값에 변동을 준다,
                     
                     num1.innerText = parseInt(pageNum);
                     num2.innerText = parseInt(pageNum)+parseInt(1);
                     num3.innerText = parseInt(pageNum)+parseInt(2);
                     num4.innerText = parseInt(pageNum)+parseInt(3);
                     num5.innerText = parseInt(pageNum)+parseInt(4);
                     num6.innerText = parseInt(pageNum)+parseInt(5);
                     num7.innerText = parseInt(pageNum)+parseInt(6);
                     num8.innerText = parseInt(pageNum)+parseInt(7);
                     num9.innerText = parseInt(pageNum)+parseInt(8);
                     num10.innerText = parseInt(pageNum)+parseInt(9);
                     right.innerText = ">>";
                     
                     window.localStorage.clear();
                     localStorage.setItem("newPageNum", pageNum);
                     localStorage.setItem("newCnt", cnt);
                 }
     
             }
     
             //뒤로가는 방향키도 설정
             function turnToBack( ){
                  
               
                 cnt -= 1;
                 //0페이지 일 때의 디폴트 설정
                 if(cnt < 0){
                     num1.innerText = 1;
                     num2.innerText = 2;
                     num3.innerText = 3;
                     num4.innerText = 4;
                     num5.innerText = 5;
                     num6.innerText = 6;
                     num7.innerText = 7;
                     num8.innerText = 8;
                     num9.innerText = 9;
                     num10.innerText = 10;
                     
                     cnt = 0;
                     window.localStorage.clear();
                     localStorage.setItem("newPageNum", pageNum);
                     localStorage.setItem("newCnt", cnt);
                 } else {
                  console.log( parseInt(localStorage.getItem("newPageNum"))+": 전");
                     pageNum -= 10;
                     console.log( parseInt(localStorage.getItem("newPageNum")));
                     left.href = "oneview2.jsp?from="+(pageNum*10-10)+"&cnt=10";    
                     num1.href = "oneview2.jsp?from="+(pageNum*10-10)+"&cnt=10"; //11이 되면 101~110, 21이 되면 201~210
                     num2.href = "oneview2.jsp?from="+((pageNum+1)*10-10)+"&cnt=10"; //12이 되면 111~120, 22가 되면 211~220
                     num3.href = "oneview2.jsp?from="+((pageNum+2)*10-10)+"&cnt=10";
                     num4.href = "oneview2.jsp?from="+((pageNum+3)*10-10)+"&cnt=10";
                     num5.href = "oneview2.jsp?from="+((pageNum+4)*10-10)+"&cnt=10";
                     num6.href = "oneview2.jsp?from="+((pageNum+5)*10-10)+"&cnt=10";
                     num7.href = "oneview2.jsp?from="+((pageNum+6)*10-10)+"&cnt=10";
                     num8.href = "oneview2.jsp?from="+((pageNum+7)*10-10)+"&cnt=10";
                     num9.href = "oneview2.jsp?from="+((pageNum+8)*10-10)+"&cnt=10";
                     num10.href = "oneview2.jsp?from="+((pageNum+9)*10-10)+"&cnt=10";
                     num1.innerText = parseInt(pageNum);
                     num2.innerText = parseInt(pageNum)+parseInt(1);
                     num3.innerText = parseInt(pageNum)+parseInt(2);
                     num4.innerText = parseInt(pageNum)+parseInt(3);
                     num5.innerText = parseInt(pageNum)+parseInt(4);
                     num6.innerText = parseInt(pageNum)+parseInt(5);
                     num7.innerText = parseInt(pageNum)+parseInt(6);
                     num8.innerText = parseInt(pageNum)+parseInt(7);
                     num9.innerText = parseInt(pageNum)+parseInt(8);
                     num10.innerText = parseInt(pageNum)+parseInt(9);
                     
                     right.innerText =">>";
                     window.localStorage.clear();
                     localStorage.setItem("newPageNum", pageNum);
                     localStorage.setItem("newCnt", cnt);
                 }
     
             }
             right.addEventListener("click", turnToForward);
             left.addEventListener("click", turnToBack);
             //addeventListener(트리거,함수)를 통해 ㅎ해당 트리거가 실행되었을 때 해당 함수를 실행하게 한다/
             
             
         </script>
     </body>
     </html>
   </body>
</html>
