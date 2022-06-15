
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<html>
<head>
    <title>Document</title>
        <%! 
        private class AA{
            private int Sum(int i, int j){
            return i+j;
            }//정수형 자료형을 두개 인자로 받아 두개를 더한 값을 리턴하는 함수.
        }
        AA aa = new AA();
        %>
    </head>
    <body>
        <% out.println("2+3=" + aa.Sum(2,3));%> <br>
        <!-- 호출결과를 out.print 로 화면에 출력할 수 있다.-->
        Good...
    </body>
</html>