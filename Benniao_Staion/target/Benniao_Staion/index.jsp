<html>
<body>
<h2>Hello World!</h2>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="login" method="post">
    用户名：${usernameError}<br/>
    <input type="text" name="username">
    <br/>
    密码:${passwordError}<br/>
    <input type="password" name="password">
    <br/>
    普通用户<input type="radio" name="usertype" value="普通用户">
    管理员<input type="radio" name="usertype" value="管理员">
    <br/>
    <input type="submit" value="login">
    <input type="reset" value="reset">
</form>
</body>
</html>
