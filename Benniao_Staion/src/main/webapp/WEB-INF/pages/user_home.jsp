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
    <title>Title</title>
</head>
<body>
    欢迎你,<div style="color: blueviolet">${username}</div> :
    我的快递:
<%--<% for(int i = 0;i<;i++){ %>--%>


<%--展示二维码--%>
    <a href="${pageContext.request.contextPath}/showQRCode">
        <img id="img" src = "${pageContext.request.contextPath}/showQRCode">
    </a>


<%--<% } %>--%>
</body>
</html>
