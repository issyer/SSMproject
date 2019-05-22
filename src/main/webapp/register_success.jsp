<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/1
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>OA系统</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        table {
            margin-left: 10%;
            margin-top: 5%;
            width:70%;
            height: 60%;
            border-collapse: collapse;
        }
        table, td, th {
            text-align: center;
            border: 1px solid black;
        }
        input{
            text-align: center;
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
</head>
<body style="background:url(Image/champion.jpg);
    background-size:100% ,100%;
    background-repeat:no-repeat;">
<div style="border:2px solid #cc0000;width:70%;height:90%;margin-left:15%;margin-top:3%;float: left;background-color:rgba(255,255,255,0.95)">
    <form action="regist.do" method="post">
        <table >
            <tr>
                <th colspan="4">注册成功</th>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
