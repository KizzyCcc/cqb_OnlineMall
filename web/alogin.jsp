<%--
  Created by IntelliJ IDEA.
  User: Kizzy_ccc
  Date: 2018/6/7
  Time: 0:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/loginstyle.css">
</head>
<body>
    <div class="main">
        <div class="login">
            <h1>后台管理系统</h1>
            <div class="inset">
                <!--start-main-->
                <form action="account_login.action" method="post">
                    <div>
                        <h2>管理员登录</h2>
                        <span><label>用户名</label></span>
                        <span><input type="text" class="textbox" name="login" /></span>
                    </div>
                    <div>
                        <span><label>密码</label></span>
                        <span><input type="password" class="password" name="pass" /></span>
                    </div>
                    <div>
                        <span>${sessionScope.account_error}</span>
                    </div>
                    <div class="sign">
                        <input type="submit" value="登录" class="submit" />
                    </div>

                </form>
            </div>
        </div>
        <!--//end-main-->
    </div>

    <div class="copy-right">
        <p>&copy; 2018 Ethos Login Form. All Rights Reserved</p>
    </div>
</body>
</html>
