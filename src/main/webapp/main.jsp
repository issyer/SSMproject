<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/30
  Time: 21:53
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
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript"  src="js/myjs.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        function showfiles() {
            flag = 'showfiles'
            window.location.href = "showfiles.do";
        };
    </script>
    <style>
        a:link {color:#000000;text-decoration:none;}      /* 未访问链接*/
        a:visited {color:#000000;text-decoration:none;}  /* 已访问链接 */
        a:hover {color:#FF00FF;text-decoration:none;}  /* 鼠标移动到链接上 */
        a:active {color:#FF00FF;text-decoration:none;}  /* 鼠标点击时 */
    </style>
</head>
<body style="background:url(Image/champion.jpg);
    background-size:100% ,100%;
    background-repeat:no-repeat;">
<div style="border:2px solid #cc0000;width:17%;height:90%;margin-left:3%;margin-top:3%;float: left;background-color:rgba(255,255,255,0.9)">
    <div style="width:70%;height:37%;margin-left: 15%">
        <img src="Image/login.png" style="width: 100%;height: 100%">
    </div>
    <h4 style="margin-left: 33%;">${staffwork.name}</h4>
    <h6 style="margin-left: 11%;">工号：${staffwork.workId}</h6>
    <h6 style="margin-left: 11%;">岗位：${staffwork.job}</h6>
    <h6 style="margin-left: 11%;">部门：${staffwork.department}</h6>
    <h6 style="margin-left: 11%;">您在公司已工作${staffwork.entryTime}</h6>
    <h6 style="margin-left: 11%;">感谢您在公司的辛勤付出</h6>
</div>
<div class="container" style="border:2px solid #cc0000;width:74%;height:90%;margin-left:3%;margin-top:3%;float: left;background-color:rgba(255,255,255,0.85)">
    <div style="width: 94%;height: 70%;margin-left: 2%;margin-right: 3%;">
        <h4 style="margin-left: 3%;margin-top: 3%;">公告</h4>
        <hr style="background-color: #818182;"/>
        <div id = "changebackground" style="border:1px solid #000000; width: 70%;height: 90%;word-wrap: break-word;word-break: normal; " class="display">
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
            <c:if test="${flag=='showfiles'}">
                <div style=" margin-top:3%;word-wrap: break-word;word-break: normal; ">

                </div>
            </c:if>
        </div>
    </div>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="showfiles()">常用</br>文件</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;">办事</br>流程</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" data-toggle="modal" data-target="#myModal5">修改</br>密码</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;">请假</br>流程</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" data-toggle="modal" data-target="#myModal4">考勤</br>申诉</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" data-toggle="modal" data-target="#myModal1">离职</br>办理</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" data-toggle="modal" data-target="#myModal2">工位</br>调整</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" data-toggle="modal" data-target="#myModal3">审批</br>系统</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;">实习</br>模块</button>
</div>



<!-- 修改密码模态框 -->
<div class="modal fade" id="myModal5">
    <div class="modal-dialog ">
        <div class="modal-content" style="background-color:rgba(255,255,255,0.9)">

            <form action="passwordchange.do" method="post">

                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h5 class="modal-title">员工账号密码更改</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- 模态框主体 -->
                <div class="modal-body">
                    <table style="width: 100%;height: 30%">
                        <tr>
                            <th>当前密码</th>
                            <td><input type="password" style="width: 100%" name="passwordNow"></td>
                        </tr>
                        <tr>
                            <th>新密码</th>
                            <td><input type="password" style="width: 100%" name="passwordNew"></td>
                        </tr>
                    </table>
                </div>

                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <input type="submit" value="提交申请" name="submit" />
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 离职申请模态框 -->
<div class="modal fade" id="myModal1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="background-color:rgba(255,255,255,0.9)">

            <form action="resign.do" method="post">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h5 class="modal-title">填写离职信息</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                <table style="width: 100%;height: 40%">
                    <tr>
                        <th>预计离职日期</th>
                        <td><input type="text" name="leaveDate" style="width: 100%"></td>
                    </tr>
                    <tr>
                        <th>离职原因</th>
                        <td><textarea rows="5"  style="width: 100%" placeholder="不少于10个字"name="reason"></textarea></td>
                    </tr>
                    <tr>
                        <th>联系方式</th>
                        <td><input type="text" style="width: 100%" name="tel" placeholder="必须为手机号"></td>
                    </tr>
                    <tr>
                        <th>离职证明邮寄地址</th>
                        <td><input type="text"  style="width: 100%" name="postAddress" placeholder="省、市、区详细地址"></td>
                    </tr>
                </table>
            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <input type="submit" value="提交申请" name="submit" />
            </div>
            </form>
        </div>
    </div>
</div>

<!-- 工位调整模态框 -->
<div class="modal fade" id="myModal2">
    <div class="modal-dialog ">
        <div class="modal-content" style="background-color:rgba(255,255,255,0.9)">

            <form action="deskchange.do" method="post">

                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h5 class="modal-title">员工工位调整申请</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- 模态框主体 -->
                <div class="modal-body">
                    <table style="width: 100%;height: 30%">
                        <tr>
                            <th>员工姓名</th>
                            <td><input type="text" name="staffName" style="width: 100%"  value=${staffwork.name}></td>
                        </tr>
                        <tr>
                            <th>您当前绑定的工位</th>
                            <td><input type="text" name="deskNow" style="width: 100%" value=${staffwork.workDesk}></td>
                        </tr>
                        <tr>
                            <th>工位信息</th>
                            <td><input type="text" style="width: 100%" name="deskWant"></td>
                        </tr>
                        <tr>
                            <th>外网配置</th>
                            <td><input type="radio" name="netOutside" value="物理机">物理机<input type="radio" name="netOutside" value="虚拟机">虚拟机<input type="radio" name="netOutside" value="不使用外网">不使用外网</td>
                        </tr>
                        <tr>
                            <th>内网配置</th>
                            <td><input type="radio" name="netInside" value="物理机">物理机<input type="radio" name="netInside" value="虚拟机">虚拟机<input type="radio" name="netInside" value="不使用外网">不使用外网</td>
                        </tr>
                    </table>
                </div>

                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <input type="submit" value="提交申请" name="submit" />
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 审批系统模态框 -->
<div class="modal fade" id="myModal3">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="background-color:rgba(255,255,255,0.9)">

            <form action="" method="post">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h5 class="modal-title">审批系统</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- 模态框主体 -->
                <div class="modal-body">
                    <div id="accordion">
                        <c:if test="${staffwork.jobHead}">
                        <div class="card">
                            <div class="card-header">
                                工位调整审批

                                <a class="card-link" data-toggle="collapse" href="#collapseOne" style="margin-left: 80.5%">
                                    展开
                                </a>

                            </div>
                            <div id="collapseOne" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <table border="1" style="width:100%;border-collapse: collapse;text-align: center" >
                                        <tr><th>申请时间</th><th>申请人</th><th>当前工位</th><th>申请工位</th><th>外网配置</th><th>内网配置</th><th>审核状态</th></tr>
                                        <c:forEach var="deskChange" items="${deskChangelist2}">
                                            <tr>
                                                <td>${deskChange.date}</td>
                                                <td>${deskChange.staffName}</td>
                                                <td>${deskChange.deskNow}</td>
                                                <td>${deskChange.deskWant}</td>
                                                <td>${deskChange.netOutside}</td>
                                                <td>${deskChange.netInside}</td>
                                                <td>${deskChange.status}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${staffwork.jobHead}">
                        <div class="card">
                            <div class="card-header">
                                请假审批

                                    <a class="card-link" data-toggle="collapse" href="#collapseTwo" style="margin-left: 85%">
                                        展开
                                    </a>

                            </div>
                            <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    #1 内容：菜鸟教程 -- 学的不仅是技术，更是梦想！！！
                                </div>
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${staffwork.jobHead}">
                        <div class="card">
                            <div class="card-header">
                                员工离职审批
                                    <a class="card-link" data-toggle="collapse" href="#collapseThree" style="margin-left: 80.5%">
                                        展开
                                    </a>
                            </div>
                            <div id="collapseThree" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <table border="1" style="width:100%;border-collapse: collapse;text-align: center" >
                                        <tr><th>申请时间</th><th>申请人</th><th>离职日期</th><th>离职原因</th><th>联系电话</th><th>邮寄地址</th><th>审核状态</th></tr>
                                        <c:forEach var="resign" items="${resignlist2}">
                                            <tr>
                                                <td>${resign.date}</td>
                                                <td>${resign.name}</td>
                                                <td>${resign.leaveDate}</td>
                                                <td>${resign.reason}</td>
                                                <td>${resign.tel}"/></td>
                                                <td>${resign.postAddress}</td>
                                                <td>${resign.status}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${staffwork.jobHead}">
                        <div class="card">
                            <div class="card-header">
                                员工考勤审批
                                <a class="card-link" data-toggle="collapse" href="#collapseFive" style="margin-left: 80.5%">
                                    展开
                                </a>
                            </div>
                            <div id="collapseFive" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <table border="1" style="width:100%;border-collapse: collapse;text-align: center" >
                                        <tr><th>申请时间</th><th>申请人</th><th>申诉日期</th><th>原因</th><th>是否有证明</th><th>证明类型</th><th>备注</th><th>审核状态</th></tr>
                                        <c:forEach var="appeal" items="${appealList2}">
                                            <tr>
                                                <td>${appeal.date}</td>
                                                <td>${appeal.name}</td>
                                                <td>${appeal.notAgreeDate}</td>
                                                <td>${appeal.reason}</td>
                                                <td>${appeal.zhengming}</td>
                                                <td>${appeal.type}</td>
                                                <td>${appeal.others}</td>
                                                <td>${appeal.status}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                        </c:if>
                        <div class="card">
                            <div class="card-header">
                                我的申请
                                <a class=" card-link" data-toggle="collapse" href="#collapseFour " style="margin-left: 85%">
                                    展开
                                </a>
                            </div>
                            <div id="collapseFour" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <table border="1" style="width:100%;border-collapse: collapse;text-align: center" >
                                        <tr><th colspan="6">工位调整申请</th></tr>
                                        <tr><th>申请时间</th><th>当前工位</th><th>申请工位</th><th>外网配置</th><th>内网配置</th><th>审核状态</th></tr>
                                        <c:forEach var="deskChange" items="${deskChangelist}">
                                            <tr>
                                                <td>${deskChange.date}</td>
                                                <td>${deskChange.deskNow}</td>
                                                <td>${deskChange.deskWant}</td>
                                                <td>${deskChange.netOutside}</td>
                                                <td>${deskChange.netInside}</td>
                                                <td>${deskChange.status}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                    <table border="1" style="width:100%;border-collapse: collapse;text-align: center" >
                                        <tr><th colspan="6">离职申请</th></tr>
                                        <tr><th>申请时间</th><th>离职日期</th><th>离职原因</th><th>联系电话</th><th>邮寄地址</th><th>审核状态</th></tr>
                                        <c:forEach var="resign" items="${resignlist}">
                                            <tr>
                                                <td>${resign.date}</td>
                                                <td>${resign.leaveDate}</td>
                                                <td>${resign.reason}</td>
                                                <td>${resign.tel}</td>
                                                <td>${resign.postAddress}</td>
                                                <td>${resign.status}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                    <table border="1" style="width:100%;border-collapse: collapse;text-align: center" >
                                        <tr><th colspan="7">考勤申诉申请</th></tr>
                                        <tr><th>申请时间</th><th>申诉日期</th><th>原因</th><th>是否有证明</th><th>证明类型</th><th>备注</th><th>审核状态</th></tr>
                                        <c:forEach var="appeal" items="${appealList}">
                                            <tr>
                                                <td>${appeal.date}</td>
                                                <td>${appeal.notAgreeDate}</td>
                                                <td>${appeal.reason}</td>
                                                <td>${appeal.zhengming}</td>
                                                <td>${appeal.type}</td>
                                                <td>${appeal.others}</td>
                                                <td>${appeal.status}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 考勤申诉模态框 -->
<div class="modal fade" id="myModal4">
    <div class="modal-dialog ">
        <div class="modal-content" style="background-color:rgba(255,255,255,0.9)">

            <form action="appeal.do" method="post">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h5 class="modal-title">员工考勤申诉平台</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- 模态框主体 -->
                <div class="modal-body">
                    <table style="width: 100%;height: 30%">
                        <tr>
                            <th>申诉日期</th>
                            <td><input type="text" name="notAgreeDate" style="width: 100%"></td>
                        </tr>
                        <tr>
                            <th>申诉原因</th>
                            <td><input type="text" name="reason" style="width: 100%"></td>
                        </tr>
                        <tr>
                            <th>是否有证明</th>
                            <td><input type="radio" name="zhengming" value="是">是<input type="radio" name="zhengming" value="否">否</td>
                        </tr>
                        <tr>
                            <th>证明类型</th>
                            <td>
                                <select name="type" style="width: 100%">
                                    <option value="邮件记录">邮件记录</option>
                                    <option value="开关机记录">开关机记录</option>
                                    <option value="工作交流记录" >工作交流记录</option>
                                    <option value="职能上级证明">职能上级证明</option>
                                    <option value="会议室等办公用品租借记录">会议室等办公用品租借记录</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>备注</th>
                            <td><textarea name = "others" rows="5"  style="width: 100%" placeholder="不少于10个字"></textarea></td>
                        </tr>
                    </table>
                </div>

                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <input type="submit" value="提交申请" name="submit" />
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>



</script>
</html>
