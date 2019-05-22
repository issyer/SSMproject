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
    <style>
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
                        <table style="width: 90%;height: 40%;margin-left: 5%;margin-top: 7%">
                            <tr><th>姓名</th><th>部门</th><th>职位</th><th>部门主管</th><th>小组主管</th><th>人事</th><th>操作</th></tr>
                            <c:forEach var="staffwork" items="${staffWorklist}">
                                <tr>
                                    <td>${staffwork.name}</td>
                                    <td>${staffwork.department}</td>
                                    <td>${staffwork.job}</td>


                                    <c:if test="${staffwork.departmentHead}">
                                        <td><input type="checkbox" name=${staffwork.workId} value="department" checked="checked"></td>
                                    </c:if>
                                    <c:if test="${!staffwork.departmentHead}">
                                        <td><input type="checkbox" name=${staffwork.workId} value="department" ></td>
                                    </c:if>

                                    <c:if test="${staffwork.jobHead}">
                                        <td><input type="checkbox" name=${staffwork.workId} value="job" checked="checked"></td>
                                    </c:if>
                                    <c:if test="${!staffwork.jobHead}">
                                        <td><input type="checkbox" name=${staffwork.workId} value="job" ></td>
                                    </c:if>

                                    <c:if test="${staffwork.HR}">
                                        <td><input type="checkbox" name=${staffwork.workId} value="hr" checked="checked"></td>
                                    </c:if>
                                    <c:if test="${!staffwork.HR}">
                                        <td><input type="checkbox" name=${staffwork.workId} value="hr" ></td>
                                    </c:if>

                                    <td><button type="button" onclick="applypower(${staffwork.workId})" >确认授权</button></td>
                                </tr>
                            </c:forEach>
                        </table>
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