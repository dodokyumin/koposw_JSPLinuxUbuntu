<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
String username=request.getParameter("username"); 
String userNameHan = new String(username.getBytes("8859_1"),"utf-8");
//한글로 변환해주기
String userpasswd=request.getParameter("userpasswd"); 
//jsp코드로 request.getParameter메소드를 통해 이름을 지정해줬던 html변수들을 jsp로 불러올 수 있다.
%>
<html>
  <head>
    <title>로그인</title>
  </head>
  <body>
    이름:<%=userNameHan%><br />
    <!-- submit을 통해 받은 username을 받는 코드-->
    비밀번호:<%=userpasswd%><br />
    <!-- 이렇게 두 페이지의 상호작용을 키를 주고 받음으로써 성립할 수 있다.-->
  </body>
</html>