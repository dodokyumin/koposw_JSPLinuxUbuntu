<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=" utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*,org. w3c.dom.*,javax.xml.parsers.DocumentBuilder,javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.ParserConfigurationException"%>
<html lang="en">
<head>
  <title>UIReportOne</title>
  <style>
    .menu{
      border: 2px black solid;
    }
    td{
      text-align: left;
    }
    .age{
      text-align: center;
    }
  </style>
</head>
<body>
<table cellspacing=1 width=600 border=1>
<tr>
<td style="text-align : center" width=50 align=center border-color=#0054FF border="2"> <font size = "4" color="#000000">
후보등록</a></td>
<td style="text-align : center" width=50 align=center> <font size = "4" color="#000000">
투표</a></td>
<td style="text-align : center" width=50 align=center bgcolor=#FFFF24> <font size = "4" color="#000000">
<a href="http://192.168.23.89:8081/ch6_Front/UIReportAll.jsp" style="text-decoration:none">개표결과</a></td>
</tr>
</table>
  
  <%
    

      DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();

      String selectedKiho = request.getParameter("kiho");
      String selectedKihoName = request.getParameter("kihoName");
      Document doc = docBuilder.parse("http://192.168.23.89:8080/ch6/gaepyoOne.jsp?kiho="+selectedKiho); //url
      out.println("<h3>"+selectedKihoName+" 의 득표성향 분석</h3>");
      String age = "";
      String pyosu = "";
      String pyoyul = "";

      out.println("<table cellspacing=1 width=600px border=1>");
      out.println("<tr>");
      out.println("<th width=200 height=30px>연령대</th>");
      out.println("<th width=400>투표율</th>");
      out.println("</tr>");

      //생성된 document에서 각 요소들을 접근하여 데이터를 저장함
      Element root = doc.getDocumentElement();
      NodeList tag_001 = doc.getElementsByTagName("data"); //xml의 루트를 기준으로  data테그를 찾는다.

      //표에 들어갈 값 계산
      for(int i=0; i<tag_001.getLength(); i++) {
        Element elmt=(Element)tag_001.item(i);
        // data 테그가 여러 개 있는데 하나를 선택(item(i)) 하여 어트리뷰트가 seq를 찾고 그것의 값을 찾는다
        // data seq=“0”, data seq=“1”등을 보고 결국 0,1,2,3 값이 나온다. 
        //아래 hour테그는 전체 xml이 아니라 현재 data테그 하나를 기준으로 하위의  hour를 찾아 
        //그놈의 노드값을 보여준다

        //kiho=tag_001.item(i).getAttributes().getNamedItem("kiho").getNodeValue();
        age=elmt.getElementsByTagName("age").item(0).getFirstChild().getNodeValue();
        pyosu=elmt.getElementsByTagName("pyosu").item(0).getFirstChild().getNodeValue();
        pyoyul= elmt.getElementsByTagName("pyoyul").item(0).getFirstChild().getNodeValue();

        //표 출력
        out.println("<tr>");
          //기호 + 이름 
          out.println("<td class=\"age\" width=100>"+age+" 대 </td>");

          //인기도 출력
          out.print("<td width = 500<p align=left><img src=bar.png width="+ (Double.parseDouble(pyoyul))*4  + " height=20>"+ pyosu +"("+ pyoyul +"%)"+ "</p></td></tr>"); 

        out.println("</tr>");
      }
  %>  
</body>
</html>