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
</head>
<body>
<div id="a">
    <form action="login" method="post">
        <%
            request.setCharacterEncoding("UTF-8");
            String uid=request.getParameter("uid");
            session.setAttribute("uid", uid);
            String username=request.getParameter("username");
            session.setAttribute("username", username);
            String password=request.getParameter("password");
            session.setAttribute("password", password);
        %>
        恭喜您注册成功！<br>
        您的用户名为:<%=username %><br>
        您的密码为:<%=password %><br>
    </form>
    <a href="index.jsp">返回登录页面</a>
</div>
</body>
</html>


