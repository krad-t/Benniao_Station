<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="zh-CN">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>用户登录</title>
    <script src="./lib/jquery-3.6.1.js"></script>

    <link rel="stylesheet" href="./lib/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="./lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./lib/bootstrapvalidator-master/src/css/bootstrapValidator.css" rel="external nofollow" />
    <script src="./lib/bootstrapvalidator-master/src/js/bootstrapValidator.js"></script>


</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2 well">
            <!-- 使用预定义类 .text-center 让文本在 h1 块中居中显示 -->
            <h1 class="text-center">用户登录</h1>
            <form class="form-group" action="login" method="post">
                <div class="input-group ${empty usernameError?"":"has-error"}">
                    <span class="input-group-addon "><i class="glyphicon glyphicon-user"></i></span>
                    <input type="text" class="form-control" placeholder="Username"
                           data-bv-notempty
                           required
                           data-bv-notempty-message="123"
                           pattern="[a-zA-Z0-9\x{4e00}-\x{9fa5}]+"
                           name="username"
                           value="${lastInput}"
                    >

                    <% if(request.getAttribute("usernameError")!=null){ %>
                        <i style="color:rgba(255, 0, 0, 0.8)" class="input-group-addon glyphicon glyphicon-remove">${usernameError}</i>
                    <% }else{ %>

                    <%}%>

                </div>
                <div class="input-group ${empty passwordError?"":"has-error"}">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="password" class="form-control" placeholder="Password"
                           data-bv-notempty
                           required
<%--                           pattern="^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$"--%>
                           name="password"
                    >
                    <% if(request.getAttribute("passwordError")!=null){ %>
                    <i style="color:rgba(255, 0, 0, 0.8)" class="input-group-addon glyphicon glyphicon-remove">${passwordError}</i>
                    <% }else{ %>

                    <%}%>
                </div>
                <div class="radio">
                    <label><input type="radio" checked="true" name="usertype" value="普通用户">普通用户</label>
                    <label><input type="radio" name="usertype" value="管理员">管理员</label>
                </div>
                <input type="submit" class="btn btn-success btn-block" value="登录">
                <input type="reset"  class="btn btn-secondary btn-block" value="重置">
                <a href="userRegister" style="color: rgba(255, 0, 0, 0.7);"><p class="text-center text-">没有账号?点此注册</p></a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
