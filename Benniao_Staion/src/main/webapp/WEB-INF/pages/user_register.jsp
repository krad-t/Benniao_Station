<%--
  Created by IntelliJ IDEA.
  User: zhong
  Date: 2022/12/10
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
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
<div>
    <h1 class="text-center">用户注册</h1>
    <form action="register" method="post">
       <table>
           <label>用户名:</label>
            <input type="text" name="username">
            <br>

           <label>密码:</label>
             <input type="text"name="password">
             <br>

           <label>身份证号:</label>
             <input type="text" name="uid">
             <br>

           <label>手机号:</label>
             <input type="text" name="phone">
             <br>

           <input type="submit" class="btn btn-success btn-block" value="登录">
           <input type="reset"  class="btn btn-secondary btn-block" value="重置">
       </table>
    </form>
</div>

</body>
</html>





