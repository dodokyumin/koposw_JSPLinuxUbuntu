<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*,org. w3c.dom.*,javax.xml.parsers.DocumentBuilder,javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.ParserConfigurationException"%>
    <html>

    <head>
        <title> 기상청 동네 예보 </title>
        <!%
          public static String seq (seq){
            if(tag_001.item(i).getAttributes().getNamedItem("seq").getNodeValue() == ){
              
            }
          }
        %>
    </head>

    <body>
        <%
            DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            //Document doc = docBuilder.parse(new File("/var/lib/tomcat9/webapps/Root/ch6/testdata.xml")); //local path
            Document doc = docBuilder.parse("http://www.kma.go.kr/wid/queryDFS.jsp?gridx=61&gridy=123"); //url
            
            String seq = "";  //48시간 중 몇번째 인지
            String hour = ""; //동네예보 3시간 단위
            String day = "";  //1번째날 (0: 오늘/1:내일/2:모레)
            String temp = ""; //현재 시간온도
            String tmx = "";  //최고 온도
            String tmn = "";  //최저 온도
            String sky = "";  //하늘 상태 코드(1: 맑음, 2: 구름조금, 3: 구름많음, 4:흐림)
            String pty = "";  //강수 상태코드 (0: 없음, 1: 비, 2: 비/눈, 3: 눈/비, 4: 눈)
            String wfKor = "";  //날씨 한국어
            String wfEn = ""; //날씨 영어
            String pop = "";  //강수 확률%
            String r12 = "";  //12시간 예상 강수량
            String s12 = "";  //12시간 예상 적설량
            String ws = "";  //풍속(m/s)
            String wd = ""; //풍향 (0~7: 북, 북동, 동, 남동, 남, 남서, 서, 북서)
            String wdKor = "";  //풍향 한국어
            String wdEn = ""; //풍향 영어
            String reh = "";  //습도%
            String r06 = "";  //6시간 예상 강수량
            String s06 = "";  //6시간 예상 적설량

            //생성된 document에서 각 요소들을 접근하여 데이터를 저장함
            Element root = doc.getDocumentElement();
            NodeList tag_001 = doc.getElementsByTagName("data"); //xml의 루트를 기준으로  data테그를 찾는다.

            out.println("<table cellspacing=1 width=1700 border=1>");
            out.println("<tr>");
              out.println("<td width=100>48h기준</td>");
              out.println("<td width=100>3시간 단위</td>");
              out.println("<td width=100>날짜</td>");
              out.println("<td width=100>현재 시간 온도</td>");
              out.println("<td width=100>최고 온도</td>");
              out.println("<td width=100>최저 온도</td>");
              out.println("<td width=100>하늘 상태</td>");
              out.println("<td width=100>강수 상태</td>");
              out.println("<td width=100>날씨 KOR</td>");
              out.println("<td width=100>날씨 ENG</td>");
              out.println("<td width=100>강수 확률</td>");
              out.println("<td width=100>12h 예상 강수량</td>");
              out.println("<td width=100>12h 예상 적설량</td>");
              out.println("<td width=100>풍속(m/s)</td>");
              out.println("<td width=100>풍향</td>");
              out.println("<td width=100>풍향 KOR</td>");
              out.println("<td width=100>풍향 ENG</td>");
              out.println("<td width=100>습도(%)</td>");
              out.println("<td width=100>6h 예상 강수량</td>");
              out.println("<td width=100>6h 예상 적설량</td>");
              out.println("</tr>");
  
            for(int i=0; i<tag_001.getLength(); i++) {
              Element elmt=(Element)tag_001.item(i);
              // data 테그가 여러 개 있는데 하나를 선택(item(i)) 하여 어트리뷰트가 seq를 찾고 그것의 값을 찾는다
              // data seq=“0”, data seq=“1”등을 보고 결국 0,1,2,3 값이 나온다. 
              //아래 hour테그는 전체 xml이 아니라 현재 data테그 하나를 기준으로 하위의  hour를 찾아 
              //그놈의 노드값을 보여준다
              
              seq=tag_001.item(i).getAttributes().getNamedItem("seq").getNodeValue();
              hour=elmt.getElementsByTagName("hour").item(0).getFirstChild().getNodeValue();
              day=elmt.getElementsByTagName("day").item(0).getFirstChild().getNodeValue();
              temp=elmt.getElementsByTagName("temp").item(0).getFirstChild().getNodeValue();
              tmx=elmt.getElementsByTagName("tmx").item(0).getFirstChild().getNodeValue();
              tmn=elmt.getElementsByTagName("tmn").item(0).getFirstChild().getNodeValue();
              sky=elmt.getElementsByTagName("sky").item(0).getFirstChild().getNodeValue();
              pty=elmt.getElementsByTagName("pty").item(0).getFirstChild().getNodeValue();
              wfKor=elmt.getElementsByTagName("wfKor").item(0).getFirstChild().getNodeValue();
              wfEn=elmt.getElementsByTagName("wfEn").item(0).getFirstChild().getNodeValue();
              pop=elmt.getElementsByTagName("pop").item(0).getFirstChild().getNodeValue();
              r12=elmt.getElementsByTagName("r12").item(0).getFirstChild().getNodeValue();
              s12=elmt.getElementsByTagName("s12").item(0).getFirstChild().getNodeValue();
              ws=elmt.getElementsByTagName("ws").item(0).getFirstChild().getNodeValue();
              wd=elmt.getElementsByTagName("wd").item(0).getFirstChild().getNodeValue();
              wdKor=elmt.getElementsByTagName("wdKor").item(0).getFirstChild().getNodeValue();
              wdEn=elmt.getElementsByTagName("wdEn").item(0).getFirstChild().getNodeValue();
              reh=elmt.getElementsByTagName("reh").item(0).getFirstChild().getNodeValue();
              r06=elmt.getElementsByTagName("r06").item(0).getFirstChild().getNodeValue();
              s06=elmt.getElementsByTagName("s06").item(0).getFirstChild().getNodeValue();

              if(day.equals("0")){
                day = "오늘";
              } else if (day.equals("1")){
                day = "내일";
              } else if (day.equals("2")){
                day = "모레";
              }

              if(sky.equals("1")){
                sky = "<img width=17 src='"+"icon/sunshine/sunny.jpg"+"'>";
              } else if (sky.equals("2")){
                sky = "<img width=17 src='"+"icon/sunshine/lcloudy.jpg"+"'>";
              } else if (sky.equals("3")){
                sky = "<img width=17 src='"+"icon/sunshine/mcloudy.jpg"+"'>";
              } else if (sky.equals("4")){
                sky = "<img width=17 src='"+"icon/sunshine/hrim.jpg"+"'>";
              }

              if(pty.equals("0")){
                pty = "강수 없음";
              } else if (pty.equals("1")){
                pty = "<img width=17 src='"+"icon/precipitation/rainy.jpg"+"'>";
              } else if (pty.equals("2")){
                pty = "<img width=17 src='"+"icon/precipitation/rsn.jpg"+"'>";
              } else if (pty.equals("3")){
                pty = "<img width=17 src='"+"icon/precipitation/srn.jpg"+"'>";
              } else if (sky.equals("4")){
                pty = "<img width=17 src='"+"icon/precipitation/snow.jpg"+"'>";
              }

              if(wd.equals("0")){
                wd = "<img width=17 src='"+"icon/windDirection/no.jpg"+"'>";
              } else if (wd.equals("1")){
                wd = "<img width=17 src='"+"icon/windDirection/ne.jpg"+"'>";
              } else if (wd.equals("2")){
                wd = "<img width=17 src='"+"icon/windDirection/ea.jpg"+"'>";
              } else if (wd.equals("3")){
                wd = "<img width=17 src='"+"icon/windDirection/we.jpg"+"'>";
              } else if (wd.equals("4")){
                wd = "<img width=17 src='"+"icon/windDirection/so.jpg"+"'>";
              } else if (wd.equals("5")){
                wd = "<img width=17 src='"+"icon/windDirection/sw.jpg"+"'>";
              } else if (wd.equals("6")){
                wd = "<img width=17 src='"+"icon/windDirection/we.jpg"+"'>";
              } else if (wd.equals("7")){
                wd = "<img width=17 src='"+"icon/windDirection/nw.jpg"+"'>";
              }

              ws = String.format("%.3f",Double.parseDouble(ws));

              hour = day + hour + "시";

              out.println("<tr>");
                out.println("<td width=100>"+seq+"</td>");
                out.println("<td width=100>"+hour+"</td>");
                out.println("<td width=100>"+day+"</td>");
                out.println("<td width=100>"+temp+"</td>");
                out.println("<td width=100>"+tmx+"</td>");
                out.println("<td width=100>"+tmn+"</td>");
                out.println("<td width=100>"+sky+"</td>");
                out.println("<td width=100>"+pty+"</td>");
                out.println("<td width=100>"+wfKor+"</td>");
                out.println("<td width=100>"+wfEn+"</td>");
                out.println("<td width=100>"+pop+"</td>");
                out.println("<td width=100>"+r12+"</td>");
                out.println("<td width=100>"+s12+"</td>");
                out.println("<td width=100>"+ws+"</td>");
                out.println("<td width=100>"+wd+"</td>");
                out.println("<td width=100>"+wdKor+"</td>");
                out.println("<td width=100>"+wdEn+"</td>");
                out.println("<td width=100>"+reh+"</td>");
                out.println("<td width=100>"+r06+"</td>");
                out.println("<td width=100>"+s06+"</td>");
              out.println("</tr>");
            }
        %>
        <img src="" alt="">
    </body>
    </html>