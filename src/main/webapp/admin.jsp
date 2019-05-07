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
        <c:if test="${flag=='showtitle'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">公告</h4>
        </c:if>
        <c:if test="${flag=='showcontent'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">公告</h4>
        </c:if>
        <c:if test="${flag=='showprocesstitle'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">办事流程</h4>
        </c:if>
        <hr style="background-color: #818182;"/>
        <div id="changebackground"
             style="border:1px solid #000000; width: 70%;height: 90%;word-wrap: break-word;word-break: normal; "
             class="display">
            <c:if test="${flag=='showtitle'}">
                <div style="margin-top:3%;float: left">
                    <ul>
                        <c:forEach var="notice" items="${noticelist}">
                            <li><a href="shownotice.do?id=${notice.noticeId}">${notice.title}</a></li>
                        </c:forEach>
                    </ul>

                </div>
                <div style="margin-top:3%;float: left;">
                    <ul style="list-style: none;">
                        <c:forEach var="notice" items="${noticelist}">
                            <li>${notice.date}</li>
                        </c:forEach>
                    </ul>

                </div>
            </c:if>
            <c:if test="${flag=='showcontent'}">
                <div style=" margin-top:3%;word-wrap: break-word;word-break: normal; ">
                    <h5 style="text-align: center">${notice.title}</h5>
                    <pre style="margin-left: 10%">
                            ${notice.content}
                    </pre>
                    <p style="margin-left: 80%;">${notice.date}</p>
                </div>
            </c:if>
            <c:if test="${flag=='showprocesstitle'}">
                <div style="margin-top:3%;float: left">
                    <ul>
                        <c:forEach var="process" items="${processlist}">
                            <li><a href="showprocess.do?id=${process.processId}">${process.title}</a></li>
                        </c:forEach>
                    </ul>

                </div>
                <div style="margin-top:3%;float: left;">
                    <ul style="list-style: none;">
                        <c:forEach var="process" items="${processlist}">
                            <li>${process.date}</li>
                        </c:forEach>
                    </ul>

                </div>
            </c:if>
            <c:if test="${flag=='showprocesscontent'}">
                <div style=" margin-top:3%;word-wrap: break-word;word-break: normal; ">
                    <h5 style="text-align: center">${process.title}</h5>
                    <pre style="margin-left: 10%">
                            ${process.content}
                    </pre>
                    <p style="margin-left: 80%;">${process.date}</p>
                </div>
            </c:if>
        </div>
    </div>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="showfiles()">权限</br>分配</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="showprocess()">通知</br>发布</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="shownotices()">流程</br>发布</button>
</div>

</body>
</html>