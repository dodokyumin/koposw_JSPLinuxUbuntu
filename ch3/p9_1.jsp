<%@ page import="java.sq.*,javax.mail.*,javax.mail.internet.*"
    contentType = "text/html; charset=EUC-KR" %>

<html>
<head>
    
</head>
<body>
    <% String myUrl = "http://www.kopo.ac.kr";
    //jsp로 string변수에 이동할 url주소를 저장한다
    %>
    <!--jsp파일에서 자바 코드를 호출할 때에는 <% %>로 감싼다.-->
    <a href="<%= myUrl %>">Hello </a> World.
    <!--a태그에 자바 변수로 가져온 url코드를 넣어준다.-->
</body>
</html>