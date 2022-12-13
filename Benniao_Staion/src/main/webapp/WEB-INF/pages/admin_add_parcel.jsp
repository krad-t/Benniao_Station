<%--
  Created by IntelliJ IDEA.
  User: krad
  Date: 2022/12/13
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加包裹</title>
    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8">
    <title>注销</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../../lib/jquery-3.6.1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../../lib/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../../lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../lib/bootstrapvalidator-master/src/css/bootstrapValidator.css" rel="external nofollow" />
    <script src="../../lib/bootstrapvalidator-master/src/js/bootstrapValidator.js"></script>
</head>
<body>
<div class="col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2 well">
    <form class="form-horizontal" name="parcelInfoForm" action="addparcel">
        <div class="form-group">
            <label for="eid" class="col-sm-2 control-label">快递编号</label>
            <input type="text" disabled id="eid" class="form-control" name="eid" >
            <input type="hidden" id="eid_hid" class="form-control" name="eid" >
        </div>
        <div class="form-group ${empty codeError?"":"has-error"}">
            <label for="code" class="col-sm-2 control-label">取件码</label>
            <input type="text" id="code" class="form-control" name="code">
            <label class="input-group-addon">${codeError}</label>
        </div>
        <div class="form-group">
            <label for="company" class="col-sm-2 control-label">快递公司</label>
            <input type="text" id="company" class="form-control" name="company">
        </div>
        <div class="form-group ${empty phoneError?"":"has-error"}">
            <label for="user_phone" class="col-sm-2 control-label">用户电话</label>
            <input type="text" id="user_phone" class="form-control" name="user_phone">
            <label class="input-group-addon">${phoneError}</label>
        </div>
        <div class="form-group">
            <input type="submit" class="form-control btn btn-warning" name="addp">
        </div>
    </form>
</div>
</body>
</html>
