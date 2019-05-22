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
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="less/datetimepicker.less">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/myjs.js"></script>
    <script src="js/bootstrap-datetimepicker.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>


</head>
<body style="background:url(Image/champion.jpg);
    background-size:100% ,100%;
    background-repeat:no-repeat;">
<div style="border:1px solid #cc0000;width:17%;height:90%;margin-left:3%;margin-top:3%;float: left;background-color:rgba(255,255,255,0.9)">
    <div style="width:70%;height:37%;margin-left: 15%">
        <img src="Image/${staffwork.photo}" style="width: 100%;height: 100%">
    </div>
    <h4 style="margin-left: 33%;">${staffwork.name}</h4>
    <h6 style="margin-left: 11%;">工号：${staffwork.workId}</h6>
    <h6 style="margin-left: 11%;">岗位：${staffwork.job}</h6>
    <h6 style="margin-left: 11%;">部门：${staffwork.department}</h6>
    <h6 style="margin-left: 11%;">您在公司已工作${staffwork.entryTime}</h6>
    <h6 style="margin-left: 11%;">感谢您在公司的辛勤付出</h6>
</div>
<div class="container" style="border:1px solid #cc0000;width:74%;height:90%;margin-left:3%;margin-top:3%;float: left;background-color:rgba(255,255,255,0.85)">
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
        <c:if test="${flag=='showprocesscontent'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">办事流程</h4>
        </c:if>
        <c:if test="${flag=='qingjia'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">请假申请</h4>
        </c:if>
        <c:if test="${flag=='resign'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">离职申请</h4>
        </c:if>
        <c:if test="${flag=='deskchange'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">工位调整</h4>
        </c:if>
        <c:if test="${flag=='appeal'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">考勤申诉</h4>
        </c:if>
        <c:if test="${flag=='passwordchange'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">员工信息修改</h4>
        </c:if>
        <c:if test="${flag=='shixiapply'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">实习模块</h4>
        </c:if>
        <c:if test="${flag=='employeeManage'}">
            <h4 style="margin-left: 3%;margin-top: 3%;">员工管理</h4>
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
                    <pre style="margin-left: 0%">
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
            <c:if test="${flag=='qingjia'}">
                <div style=" margin-top:3%;word-wrap: break-word;word-break: normal; ">
                    <form action="qingjia.do" method="post">
                        <table style="width: 80%;height: 40%;margin-left: 10%;margin-top: 7%">
                            <tr>
                                <th>请假类型</th>
                                <td>
                                    <select name="type" style="width: 100%">
                                        <option value="请选择">请选择</option>
                                        <option value="年假">年假</option>
                                        <option value="事假">事假</option>
                                        <option value="病假">病假</option>
                                        <option value="调休假">调休假</option>
                                        <option value="婚假">婚假</option>
                                        <option value="产假">产假</option>
                                        <option value="陪产假">陪产假</option>
                                        <option value="丧假">丧假</option>
                                        <option value="产检假">产检假</option>
                                        <option value="看护假">看护假</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>开始时间</th>
                                <td><input type="text" name="startdate" placeholder="请选择日期"  readonly class="form_datetime" style="width: 100%"></td>
                                <script>
                                    $(".form_datetime").datetimepicker({
                                        format: 'yyyy-mm-dd',
                                        minView: "month",
                                        todayBtn: "linked",
                                        autoclose: "true"
                                    });
                                </script>
                            </tr>
                            <tr>
                                <th>结束时间</th>
                                <td><input type="text" name="startdate" placeholder="请选择日期"  readonly class="form_datetime" style="width: 100%"></td>
                                <script>
                                    $(".form_datetime").datetimepicker({
                                        format: 'yyyy-mm-dd',
                                        minView: "month",
                                        todayBtn: "linked",
                                        autoclose: "true"
                                    });
                                </script>
                            </tr>
                            <tr>
                                <th>请假时长</th>
                                <td><input type="text" name="times" style="width: 100%"></td>
                            </tr>

                            <tr>
                                <th>请假事由</th>
                                <td><textarea name="others" rows="5" style="width: 100%"
                                              placeholder="请输入请假事由"></textarea></td>
                            </tr>
                            <tr>
                                <td><button type="submit" name="submit" value="提交申请" class="css3button">提交申请</button></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </c:if>
            <c:if test="${flag=='resign'}">
                <div style=" margin-top:3%;word-wrap: break-word;word-break: normal; ">
                    <form action="resign.do" method="post">
                        <table style="width: 80%;height: 40%;margin-left: 10%;margin-top: 7%">
                            <tr>
                                <th>预计离职日期</th>
                                <td><input type="text" name="startdate" placeholder="请选择离职日期"  readonly class="form_datetime" style="width: 100%"></td>
                                <script>
                                    $(".form_datetime").datetimepicker({
                                        format: 'yyyy-mm-dd',
                                        minView: "month",
                                        todayBtn: "linked",
                                        autoclose: "true"
                                    });
                                </script>
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
            <c:if test="${flag=='deskchange'}">
                <div style=" margin-top:3%;word-wrap: break-word;word-break: normal; ">
                    <form action="deskchange.do" method="post">
                        <table style="width: 80%;height: 40%;margin-left: 10%;margin-top: 7%">
                            <tr>
                                <th>员工姓名</th>
                                <td><input type="text" name="staffName" style="width: 100%" value=${staffwork.name}>
                                </td>
                            </tr>
                            <tr>
                                <th>您当前绑定的工位</th>
                                <td><input type="text" name="deskNow" style="width: 100%" value=${staffwork.workDesk}>
                                </td>
                            </tr>
                            <tr>
                                <th>工位信息</th>
                                <td><input type="text" style="width: 100%" name="deskWant"></td>
                            </tr>
                            <tr>
                                <th>外网配置</th>
                                <td><input type="radio" name="netOutside" value="物理机">物理机<input type="radio"
                                                                                                name="netOutside"
                                                                                                value="虚拟机">虚拟机<input
                                        type="radio" name="netOutside" value="不使用外网">不使用外网
                                </td>
                            </tr>
                            <tr>
                                <th>内网配置</th>
                                <td><input type="radio" name="netInside" value="物理机">物理机<input type="radio"
                                                                                               name="netInside"
                                                                                               value="虚拟机">虚拟机<input
                                        type="radio" name="netInside" value="不使用外网">不使用外网
                                </td>
                            </tr>
                            <tr>
                                <td><button type="submit" value="提交申请" name="submit" class="css3button">提交申请</button></td>
                            </tr>
                        </table>

                    </form>
                </div>
            </c:if>
            <c:if test="${flag=='appeal'}">
                <div style=" margin-top:3%;word-wrap: break-word;word-break: normal; ">
                    <form action="appeal.do" method="post">
                        <table style="width: 80%;height: 40%;margin-left: 10%;margin-top: 7%">
                            <tr>
                                <th>申诉日期</th>
                                <td><input type="text" name="startdate" placeholder="请选择时间"  readonly class="form_datetime" style="width: 100%"></td>
                                <script>
                                    $(".form_datetime").datetimepicker({
                                        format: 'yyyy-mm-dd',
                                        minView: "month",
                                        todayBtn: "linked",
                                        autoclose: "true"
                                    });
                                </script>
                            </tr>
                            <tr>
                                <th>申诉原因</th>
                                <td><input type="text" name="reason" style="width: 100%"></td>
                            </tr>
                            <tr>
                                <th>是否有证明</th>
                                <td><input type="radio" name="zhengming" value="是">是<input type="radio" name="zhengming"
                                                                                           value="否">否
                                </td>
                            </tr>
                            <tr>
                                <th>证明类型</th>
                                <td>
                                    <select name="type" style="width: 100%">
                                        <option value="邮件记录">邮件记录</option>
                                        <option value="开关机记录">开关机记录</option>
                                        <option value="工作交流记录">工作交流记录</option>
                                        <option value="职能上级证明">职能上级证明</option>
                                        <option value="会议室等办公用品租借记录">会议室等办公用品租借记录</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>备注</th>
                                <td><textarea name="others" rows="5" style="width: 100%"
                                              placeholder="不少于10个字"></textarea></td>
                            </tr>
                            <tr>
                                <td><button type="submit" name="submit" value="提交申请" class="css3button">提交申请</button></td>
                            </tr>
                        </table>

                    </form>
                </div>
            </c:if>
            <c:if test="${flag=='passwordchange'}">
                <div style=" margin-top:3%;word-wrap: break-word;word-break: normal; ">
                    <form action="passwordchange.do" method="post">
                        <table  style="width: 80%;height: 40%;margin-left: 10%;margin-top: 7%">
                            <tr>
                                <th>当前密码</th>
                                <td><input type="password" style="width: 100%" name="passwordNow"></td>
                            </tr>
                            <tr>
                                <th>新密码</th>
                                <td><input type="password" style="width: 100%" name="passwordNew"></td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="submit" name="submit" value="提交申请" class="css3button">提交申请</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </c:if>
            <c:if test="${flag=='shixiapply'}">
                <div style=" margin-top:3%;word-wrap: break-word;word-break: normal; ">
                    <form action="shixi.do" method="post">
                        <table style="width: 80%;height: 40%;margin-left: 10%;margin-top: 7%">
                            <tr>
                                <th>预计返校日期</th>
                                <td><input type="text" name="startdate" placeholder="请选择返校日期"  readonly class="form_datetime" style="width: 100%"></td>
                                <script>
                                    $(".form_datetime").datetimepicker({
                                        format: 'yyyy-mm-dd',
                                        minView: "month",
                                        todayBtn: "linked",
                                        autoclose: "true"
                                    });
                                </script>
                            </tr>
                            <tr>
                                <th>返回工作日期</th>
                                <td><input type="text" name="startdate" placeholder="请选择工作日期"  readonly class="form_datetime" style="width: 100%"></td>
                                <script>
                                    $(".form_datetime").datetimepicker({
                                        format: 'yyyy-mm-dd',
                                        minView: "month",
                                        todayBtn: "linked",
                                        autoclose: "true"
                                    });
                                </script>
                            </tr>
                            <tr>
                                <th>联系方式</th>
                                <td><input type="text" style="width: 100%" name="tel" placeholder="必须为手机号"></td>
                            </tr>
                            <tr>
                                <td><button type="submit" value="提交申请" name="submit" class="css3button" >提交申请</button></td>
                            </tr>
                        </table>

                    </form>
                </div>
            </c:if>
            <c:if test="${flag=='employeeManage'}">
                <div style=" margin-top:3%;word-wrap: break-word;word-break: normal; ">
                    <form action="registForWork.do" method="post">
                        <table style="margin-top: 2%; border-collapse: collapse; text-align: center;width: 80%;margin-left: 10%">
                            <tr>
                                <th colspan="4" >员工工作信息注册</th>
                            </tr>
                            <tr>
                                <th style=" text-align: center;border: 1px solid black;width: 20%">工号</th>
                                <td style=" text-align: center;border: 1px solid black; width: 30%"><input type="text" name="workId" style=" text-align: center;width: 100%;height: 100%;border: none;"/></td>
                                <th rowspan="3" style=" text-align: center;border: 1px solid black;width: 20%">照片</th>
                                <td rowspan="3" style=" text-align: center;border: 1px solid black;width: 30%">
                                    <img src="Image/${staffpersonal.photo}" style="width: 65%;height: 22%">
                                </td>
                            </tr>
                            <tr>
                                <th style=" text-align: center;border: 1px solid black;">姓名</th>
                                <td style=" text-align: center;border: 1px solid black;"><input type="text" name="name" style=" text-align: center;width: 100%;height: 100%;border: none;" value=${staffpersonal.name}></td>
                            </tr>
                            <tr>
                                <th style=" text-align: center;border: 1px solid black;">性别</th>
                                <td style=" text-align: center;border: 1px solid black;"><input type="text" name="sex" style=" text-align: center;width: 100%;height: 100%;border: none;" value=${staffpersonal.sex}></td>
                            </tr>
                            <tr>
                                <th style=" text-align: center;border: 1px solid black;">入职日期</th>
                                <td style=" text-align: center;border: 1px solid black;"><input type="text" name="entryTime"  placeholder="格式为：yyyy-mm-dd" style=" text-align: center;width: 100%;height: 100%;border: none;"/></td>
                                <th style=" text-align: center;border: 1px solid black;">联系电话</th>
                                <td style=" text-align: center;border: 1px solid black;"><input type="text" name="tel" style=" text-align: center;width: 100%;height: 100%;border: none;"/></td>
                            </tr>
                            <tr>
                                <th style=" text-align: center;border: 1px solid black;">工位</th>
                                <td style=" text-align: center;border: 1px solid black;"><input type="text" name="workDesk" style=" text-align: center;width: 100%;height: 100%;border: none;"/></td>
                                <th style=" text-align: center;border: 1px solid black;">部门</th>
                                <td style=" text-align: center;border: 1px solid black;"><input type="text" name="department" style=" text-align: center;width: 100%;height: 100%;border: none;"/></td>
                            </tr>
                            <tr>
                                <th style=" text-align: center;border: 1px solid black;">职位</th>
                                <td style=" text-align: center;border: 1px solid black;"><input type="text" name="job" style=" text-align: center;width: 100%;height: 100%;border: none;"/></td>
                                <th style=" text-align: center;border: 1px solid black;">工资</th>
                                <td style=" text-align: center;border: 1px solid black;"><input type="text" name="pay" style=" text-align: center;width: 100%;height: 100%;border: none;"/></td>
                            </tr>
                            <tr>
                                <th style=" text-align: center;border: 1px solid black;">工作邮箱</th>
                                <td colspan="3" style=" text-align: center;border: 1px solid black;"><input type="text" name="workEmail" style=" text-align: center;width: 100%;height: 100%;border: none;"/></td>
                            </tr>
                            <tr>
                                <td colspan="2" style=" text-align: center;border: 1px solid black;"><input type="reset" name="reset" value="清空信息" style=" text-align: center;width: 100%;height: 100%;border: none;"/></td>
                                <td colspan="2" style=" text-align: center;border: 1px solid black;"><input type="submit" name="submit" value="上传信息" style=" text-align: center;width: 100%;height: 100%;border: none;"/></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </c:if>
        </div>
    </div>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="showfiles()">常用</br>文件</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="showprocess()">办事</br>流程</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="shownotices()">公告</br>查看</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;"  onclick="changepassword()">修改</br>密码</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="applyleave()">请假</br>流程</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="appeal()">考勤</br>申诉</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="resign()">离职</br>办理</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="changedesk()">工位</br>调整</button>
    <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" data-toggle="modal" data-target="#myModal3">审批</br>系统</button>
    <c:if test="!${staffwork.jobHead}">
        <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="shixi()">实习</br>模块</button>
    </c:if>
    <c:if test="${staffwork.HR}">
        <button type="button" class="btn btn-primary" style="background-color: #cc0000; margin-left: 2%;margin-top:5%;float: left;width:70px;height: 70px;" onclick="manage()">员工</br>管理</button>
    </c:if>

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
                                        <tr><th>申请时间</th><th>申请人</th><th>当前工位</th><th>申请工位</th><th>外网配置</th><th>内网配置</th><th>操作</th></tr>
                                        <c:forEach var="deskChange" items="${deskChangelist2}">
                                            <tr>
                                                <td>${deskChange.date}</td>
                                                <td>${deskChange.staffName}</td>
                                                <td>${deskChange.deskNow}</td>
                                                <td>${deskChange.deskWant}</td>
                                                <td>${deskChange.netOutside}</td>
                                                <td>${deskChange.netInside}</td>
                                                <td><button type="button" onclick="applydeskchange(${deskChange.id},'通过')" >通过</button><button type="button" onclick="applydeskchange(${deskChange.id},'驳回')" >驳回</button></td>
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
                                        <tr><th>申请时间</th><th>申请人</th><th>离职日期</th><th>离职原因</th><th>联系电话</th><th>邮寄地址</th><th>操作</th></tr>
                                        <c:forEach var="resign" items="${resignlist2}">
                                            <tr>
                                                <td>${resign.date}</td>
                                                <td>${resign.name}</td>
                                                <td>${resign.leaveDate}</td>
                                                <td>${resign.reason}</td>
                                                <td>${resign.tel}</td>
                                                <td>${resign.postAddress}</td>
                                                <td><button type="button" onclick="applyresign(${resign.workId},'通过')" >通过</button><button type="button" onclick="applyresign(${resign.workId},'驳回')" >驳回</button></td>
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
                                        <tr><th>申请时间</th><th>申请人</th><th>申诉日期</th><th>原因</th><th>是否有证明</th><th>证明类型</th><th>备注</th><th>操作</th></tr>
                                        <c:forEach var="appeal" items="${appealList2}">
                                            <tr>
                                                <td>${appeal.date}</td>
                                                <td>${appeal.name}</td>
                                                <td>${appeal.notAgreeDate}</td>
                                                <td>${appeal.reason}</td>
                                                <td>${appeal.zhengming}</td>
                                                <td>${appeal.type}</td>
                                                <td>${appeal.others}</td>
                                                <td><button type="button" onclick="applyworkday(${appeal.id},'通过')" >通过</button><button type="button" onclick="applyworkday(${appeal.id},'驳回')" >驳回</button></td>
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

</body>
</html>
