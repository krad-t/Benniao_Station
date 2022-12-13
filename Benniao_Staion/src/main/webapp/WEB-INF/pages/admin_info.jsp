<%--
  Created by IntelliJ IDEA.
  User: krad
  Date: 2022/12/13
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>管理员信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <script src="../../lib/jquery-3.6.1.js" type="text/javascript"></script>

    <link rel="stylesheet" href="../../lib/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../../lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="../../lib/bootstrapvalidator-master/src/css/bootstrapValidator.css" rel="external nofollow" />
    <script src="../../lib/bootstrapvalidator-master/src/js/bootstrapValidator.js"></script>
</head>
<body>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">我的信息</h3>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" role="form" action="updateAdminInfo" method="post">
            <div class="form-group">
                <label for="uid" class="col-sm-2 control-label">身份证号</label>
                <div class="col-sm-8">
                    <input type="text" disabled class="form-control" id="uid" name="uid" placeholder="" value="${uid}"
                           data-bv-notempty
                           required
                    >
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="username" placeholder="" name="username" value="${username}"
                           data-bv-notempty
                           required
                    >
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="password" placeholder="" name="password" value="${password}"
                           data-bv-notempty
                           required
                    >
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">联系电话</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="phone" placeholder="" name="phone" value="${phone}"
                           data-bv-notempty
                           required
                    >
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" id="save" class="btn btn-success">保存</button>
                    <button type="reset" class="btn btn-default">恢复</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
<script>
    $('#save').click(function (event) {
        var aid = $('#uid').val()
        var username = $('#username').val()
        var password = $('#password').val()
        var phone = $('#phone').val()
        var form = $('.form')
        form.find('uid').val(aid)
        form.find('username').val(username)
        form.find('password').val(password)
        form.find('phone').val(phone)
    });
</script>
</html>
