<%--
  Created by IntelliJ IDEA.
  User: krad
  Date: 2022/12/6
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>管理员${username}的主页</title>
    <script src="../../lib/jquery-3.6.1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../../lib/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../../lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../lib/bootstrapvalidator-master/src/css/bootstrapValidator.css" rel="external nofollow" />
    <script src="../../lib/bootstrapvalidator-master/src/js/bootstrapValidator.js"></script>

</head>

<html>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="sr-only ">切换导航的按钮</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand navbar-left" href="#">BenNiao Station-管理员后台</a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li class="active"><a href="#myParcel" data-toggle="tab">我管理的快递</a></li>
                <li ><a href="#replace" data-toggle="tab">我的个人信息</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        其他功能 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#addparcel" data-toggle="tab">入库快递</a></li>
                        <li><a href="#">...</a></li>
                        <li class="divider"></li>
                        <li><a href="#">关于Benniao</a></li>
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> ${username}</a></li>
                <li><a href="adminHome/logout"><span class="glyphicon glyphicon-log-in"></span> 注销</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="tab-content">
            <div class="tab-pane fade in active" id="myParcel" >
                <iframe width="100%" height="600px" src="adminHome/showManageParcel" ></iframe>
            </div>
            <div class="tab-pane fade" id="replace">
                <iframe width="100%" height="600px" src="adminHome/adminInfo" ></iframe>
            </div>
            <div class="tab-pane fade" id="addparcel">
                <iframe width="100%" height="600px" src="adminHome/toAddparcel" ></iframe>
            </div>

        </div>
    </div>
</div>

<body>

</body>
<footer>

</footer>
</html>
