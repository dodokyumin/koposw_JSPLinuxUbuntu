<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="p17.jsp" %>
<html lang="en">
<head>
    
    <title>Document</title>
</head>
<body>
    <%
    String arr[]= new String[]{"111","222","333"};
    out.println(arr[4]+"<br>"); //에러 코드.
    %>
    <!--에러가 날 때 위 에러페이지의 경로를 설정해주어 에러페이지를 보여줄 수 있게 하였다.-->
    Good....
</body>
</html>