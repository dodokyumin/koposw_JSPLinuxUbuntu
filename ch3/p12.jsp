<%@ page contentType = "text/html; charset=UTF-8" %>
<html>
    <head>
        <%! //함수나 변수 선언시 앞에 !를 넣어주어야 한다.
        private String call1(){
            String a = "abc";
            String b = "efg";
            return(a+b);   //리턴값은 "abcefg" 
        }

        private Integer call2(){
            Integer a = 1;
            Integer b = 2;
            return(a+b);    //리턴값은 3
        }
        %>
    </head>
    <body>
        <script>
            call1();
        </script>
        <script>
            call2();
        </script>
        <!--jsp는 자바이다, 자바스크립트가 아니므로 실행이안됨-->
        Good...
    </body>
</html>