<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../../lib/jquery-3.6.1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../../lib/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../../lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../lib/bootstrapvalidator-master/src/css/bootstrapValidator.css" rel="external nofollow" />
    <script src="../../lib/bootstrapvalidator-master/src/js/bootstrapValidator.js"></script>
</head>
<body>
<%--注册框 --%>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2 well">
            <!-- 使用预定义类 .text-center 让文本在 h1 块中居中显示 -->
            <h1 class="text-center">用户注册</h1>
            <form class="form-group" action="register" method="post">
                <div class="input-group ${empty registerFailed?"":"has-error"}">
                    <span class="input-group-addon "><i class="glyphicon glyphicon-user"></i></span>
                    <input type="text" class="form-control" placeholder="Username"
                           data-bv-notempty
                           required
                           data-bv-notempty-message="123"
                           pattern="[a-zA-Z0-9\x{4e00}-\x{9fa5}]+"
                           name="username"
                           value=""
                    >

                    <% if(request.getAttribute("registerFailed")!=null){ %>
                    <i style="color:rgba(255, 0, 0, 0.8)" class="input-group-addon glyphicon glyphicon-remove">${registerFailed}</i>
                    <% }else{ %>

                    <%}%>

                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="password" class="form-control" placeholder="Password"
                           data-bv-notempty
                           required
                           name="password"
                    >

                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-flash"></i></span>
                    <input type="uid" class="form-control" placeholder="uid"
                           data-bv-notempty
                           required
                           name="uid"
                    >
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                    <input type="phone" class="form-control" placeholder="phone"
                           data-bv-notempty
                           required
                           pattern="[0-9]{11}"
                           name="phone"
                    >

                </div>
                <input type="submit" class="btn btn-success btn-block" value="注册">
                <input type="reset"  class="btn btn-secondary btn-block" value="重置">
            </form>
        </div>
    </div>
</div>

</body>
</html>





