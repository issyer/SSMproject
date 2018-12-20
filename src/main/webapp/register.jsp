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
<body style="background:url(Image/microsoft.jpg);
    background-size:100% ,100%;
    background-repeat:no-repeat;">
<div style="border:2px solid #cc0000;width:70%;height:90%;margin-left:15%;margin-top:3%;float: left;background-color:rgba(255,255,255,0.95)">
    <form action="regist.do"method="post">
    <table >
        <tr>
            <th colspan="4">员工基本信息登记</th>
        </tr>
        <tr>
            <th>姓名</th>
            <td><input type="text" name="name"/></td>
            <th rowspan="3">照片</th>
            <td rowspan="3">
                <%--<input type="file" name="photo" accept="image"/>--%>
            </td>
        </tr>
        <tr>
            <th>年龄</th>
            <td><input type="text" name="age"/></td>
        </tr>
        <tr>
            <th>性别</th>
            <td><input type="text" name="sex"/></td>
        </tr>
        <tr>
            <th>生日</th>
            <td><input type="text" name="birth"  placeholder="格式为：yyyy-mm-dd"/></td>
            <th>联系电话</th>
            <td><input type="text" name="tel"/></td>
        </tr>
        <tr>
            <th>民族</th>
            <td><input type="text" name="nation"/></td>
            <th>政治面貌</th>
            <td><input type="text" name="politicalStatus"/></td>
        </tr>
        <tr>
            <th>毕业院校</th>
            <td><input type="text" name="college"/></td>
            <th>专业</th>
            <td><input type="text" name="profession"/></td>
        </tr>
        <tr>
            <th>地址</th>
            <td colspan="3"><input type="text" name="address"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="reset" name="reset" value="清空信息"/></td>
            <td colspan="2"><input type="submit" name="submit" value="上传信息"/></td>
        </tr>
    </table>
    </form>
</div>
</body>
</html>
