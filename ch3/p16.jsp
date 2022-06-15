<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    
    <title>Document</title>
</head>
<body>
    <%
    String arr[]= new String[]{"111","222","333"};
    try{
        out.println(arr[4]+"<br>");
    } catch (Exception e){
        out.println("error==>"+e+"<===<br>");
    }
    %>
    <!-- 자바의 try catch문으로 에러를 변수에 담아 출력하였다.-->
    Good....
</body>
</html>