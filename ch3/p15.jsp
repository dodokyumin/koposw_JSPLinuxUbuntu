<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <title>Document</title>
</head>
<body>
    <%

    String arr[]= new String[]{"111","222","333"};
    String str = "abc,efg,hij";
    String str_arr[] = str.split(",");
    //꺽쇠 나머지를 통해 jsp에서 java를 호출할 수 있다. 물론 배열도 가능.
    %>

    arr[0]:<%=arr[0]%> <br> <!-- html에서는 해당 부분만 꺽쇠 나머지처리하여 가져오기 가능,-->
    arr[1]:<%=arr[1]%> <br>
    arr[2]:<%=arr[2]%> <br>

    str_arr[0]:<%=str_arr[0]%> <br>
    str_arr[1]:<%=str_arr[1]%> <br>
    str_arr[2]:<%=str_arr[2]%> <br>

    Good....
</body>
</html>