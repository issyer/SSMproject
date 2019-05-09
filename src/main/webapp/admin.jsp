<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/7
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>OA系统</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript"  src="js/myjs.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body style="background:url(Image/champion.jpg);
    background-size:100% ,100%;
    background-repeat:no-repeat;">
<div style="border:2px solid #cc0000;width:17%;height:90%;margin-left:3%;margin-top:3%;float: left;background-color:rgba(255,255,255,0.9)">
    <div style="width:70%;height:37%;margin-left: 15%">
        <img src="Image/login.png" style="width: 100%;height: 100%">
    </div>
    <h4 style="margin-left: 33%;">${admin.name}</h4>
    <h6 style="margin-left: 11%;">工号：${admin.workId}</h6>
    <h6 style="margin-left: 11%;">岗位：${admin.job}</h6>
    <h6 style="margin-left: 11%;">部门：${admin.department}</h6>
    <h6 style="margin-left: 11%;">您在公司已工作${admin.entryTime}</h6>
    <h6 style="margin-left: 11%;">感谢您在公司的辛勤付出</h6>
</div>
<div class="container" style="border:2px solid #cc0000;width:74%;height:90%;margin-left:3%;margin-top:3%;float: left;background-color:rgba(255,255,255,0.85)">
    <div style="width: 94%;height: 70%;margin-left: 2%;margin-right: 3%;">
        <c:if test="${flag=='powermanage'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">权限管理</h4>
        </c:if>
        <c:if test="${flag=='noticemanage'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">通知管理</h4>
        </c:if>
        <c:if test="${flag=='processmanage'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">流程管理</h4>
        </c:if>
        <hr style="background-color: #818182;"/>
        <div id="changebackground"

             style="border:1px solid #000000; width: 70%;height: 90%;word-wrap: break-word;word-break: normal; "
             class="display">
            <c:if test="${flag=='powermanage'}">
                <div style=" margin-top:3%;word-wrap: break-word;word-break: normal; ">
                    <form action="resign.do" method="post">
                        <table style="width: 80%;height: 40%;margin-left: 10%;margin-top: 7%">
                            <tr>
                                <th>预计离职日期</th>
                                <td><input type="text" name="leaveDate" style="width: 100%"></td>
                            </tr>
                            <tr>
                                <th>离职原因</th>
                                <td><textarea rows="5" style="width: 100%" placeholder="不少于10个字" name="reason"></textarea></td>
                            </tr>
                            <tr>
                                <th>联系方式</th>
                                <td><input type="text" style="width: 100%" name="tel" placeholder="必须为手机号"></td>
                            </tr>
                            <tr>
                                <th>离职证明邮寄地址</th>
                                <td><input type="text" style="width: 100%" name="postAddress" placeholder="省、市、区详细地址"></td>
                            </tr>
                            <tr>
                                <td><button type="submit" value="提交申请" name="submit" class="css3button" >提交申请</button></td>
                            </tr>
                        </table>

                    </form>
                </div>
            </c:if>
            <c:if test="${flag=='noticemanage'}">

            </c:if>
            <c:if test="${flag=='processmanage'}">

            </c:if>
        </div>
    </div>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="showpowermanage()">权限</br>分配</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="shownoticemanage()">通知</br>发布</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="showprocessmanage()">流程</br>发布</button>
</div>

</body>
</html>