<%--
  Created by IntelliJ IDEA.
  User: krad
  Date: 2022/12/5
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${username}的主页</title>

    <%--引入前端框架--%>
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
            <a class="navbar-brand navbar-left" href="#">BenNiao Station</a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li class="active"><a href="#myParcel" data-toggle="tab">
                    我的快递
                </a></li>
                <li ><a href="#replace" data-toggle="tab">我的信息</a></li>

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> ${username}</a></li>
                <li><a href="userHome/logout"><span class="glyphicon glyphicon-log-in"></span> 注销</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="tab-content">
            <div class="tab-pane fade in active" id="myParcel" >
                <iframe width="100%" height="600px" src="userHome/showAllParcel" ></iframe>
            </div>
            <div class="tab-pane fade" id="replace">
                <iframe width="100%" height="600px" src="userHome/userInfo" ></iframe>
            </div>

        </div>
    </div>
</div>

<body>

</body>
<footer>

</footer>
</html>
