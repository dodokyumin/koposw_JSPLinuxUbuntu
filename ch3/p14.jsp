
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <title>Document</title>
    <%!
    String str="abcdefg";
    int strLen = str.length();
    String strSub = str.substring(5);
    int strLoc = str.indexOf("cd");
    String strL = str.toLowerCase();
    String strU = str.toUpperCase();
    %>
    <!-- 변수 선언은 앞에 ! 붙어주기. 이와같이 자바의 내장 함수들이 잘 적용된다.-->
</head>
<body>
    str:<%=str%><br>
    strLen:<%=strLen%><br>
    strSub:<%=strSub%><br>
    strLoc:<%=strLoc%><br>
    strL:<%=strL%><br>
    strU:<%=strU%><br>
    Good....
    <!--호출시에 <% %>로 불러오기.-->
</body>
</html>