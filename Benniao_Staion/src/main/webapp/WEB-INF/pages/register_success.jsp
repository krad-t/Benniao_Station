<%--
  Created by IntelliJ IDEA.
  User: zhong
  Date: 2022/12/11
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html;
charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD
HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8">
    <title>注册成功</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../../lib/jquery-3.6.1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../../lib/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../../lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../lib/bootstrapvalidator-master/src/css/bootstrapValidator.css" rel="external nofollow" />
    <script src="../../lib/bootstrapvalidator-master/src/js/bootstrapValidator.js"></script>
</head>
<body>
<div id="a">
    <%
        request.setCharacterEncoding("UTF-8");
        String username=request.getParameter("username");
        session.setAttribute("username", username);
        String password=request.getParameter("password");
        session.setAttribute("password", password);
    %>

    <div class="panel panel-success col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2 well">
        <div class="panel-heading">
            <h3 class="panel-title text-success text-center">恭喜您注册成功！</h3>
        </div>
        <div class="panel-body">
            <h4 class="text-center text-primary">您的用户名为:<%=username %></h4>
            <h4 class="text-center text-primary">您的密码为:<%=password %></h4>
            <a href="index.jsp" class="text-center">返回登录页面</a>
        </div>
    </div>



</div>
</body>
</html>


