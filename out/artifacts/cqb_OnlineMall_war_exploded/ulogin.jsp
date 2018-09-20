<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Kizzy_ccc
  Date: 2018/5/18
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:set value="${pageContext.request.contextPath}" var="shop"/>
    <link rel="stylesheet" href="js/jquery-easyui-1.3.5/themes/icon.css" type="text/css"/>
    <link rel="stylesheet" href="js/jquery-easyui-1.3.5/themes/default/easyui.css" type="text/css"/>
    <link rel="stylesheet" href="css/detail.css" type="text/css"/>
    <link rel="stylesheet" href="css/public.css" type="text/css"/>
    <link rel="stylesheet" href="css/style.css" type="text/css"/>
    <script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        #dd div{
            padding: 5px;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="header">
        <div class="header_container">
            <!--头部开始-->
            <div class="top_bar clear">
                <!--头部小导航-->
                <div class="welcom fl">欢迎光临LEISUPET SHOP!</div>
                <ul class="top_links fr">
                    <li><a href="#">首页</a></li>
                    <li><a href="#">购物车</a></li>
                    <c:choose>
                        <c:when test="${empty sessionScope.user}">
                            <li><a href="${shop}/send2_user_register.action">注册</a></li>
                            <li class="highlight"><a href="${shop}/send_login.action">登录</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><span>欢迎您：${sessionScope.user.name}</span></li>
                            <li><a href="${shop}/send2_user_recharge.action">我的账户</a></li>
                            <li><a href="${shop}/user_cancel.action">注销</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <h1 class="logo clear fl">
                    <a href="test.jsp"><img src="${shop}/images/logo.png"/></a>
                </h1>
                <!-- 小购物车 -->
                <div class="minicart">
                    <a class="minicart_link" href="${pageContext.request.contextPath}/send2_user_showCart.action">
                        <span class="item"><b>${fn:length(sessionScope.forder.sorders)}</b> 件/ </span>
                        <span class="price"> <b>￥${sessionScope.forder.total}</b> </span>
                    </a>
                </div>
                <!-- 小购物车结束 -->
                <!-- 搜索框 -->
                <div class="header_search">
                    <div class="form-search ">
                        <input value="请输入商品名称" class="input-text" type="text" />
                        <button type="submit" title="Search"></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 头部结束 -->
    <!-- 导航栏 -->
    <div class="navigation_container">
        <!---->
        <div class="nav">
            <ul class="primary_nav">
                <li><a href="${shop}/product_queryByType.action?categoryEntity.id=2">蔬菜</a></li>
                <li><a href="${shop}/product_queryByType.action?categoryEntity.id=4">水果</a></li>
                <li><a href="${shop}/product_queryByType.action?categoryEntity.id=5">谷物</a></li>
                <li><a href="${shop}/product_queryByType.action?categoryEntity.id=1">肉制品</a></li>
                <li><a href="${shop}/product_queryByType.action?categoryEntity.id=6">海鲜</a></li>
            </ul>
        </div>
    </div>
    <!--导航栏结束-->
    <div class="section_container">
        <!-- 购物车 -->
        <div id="dd" class="action_buttonbar" style="text-align:center;">
            <form method="post" action="user_login.action">
                <div>
                    <label>账号:&nbsp;</label>
                    <input type="text" name="login" />
                    <br/>
                    <label>密码:&nbsp;</label>
                    <input type="password" name="pass" />
                </div>
                <div>
                    ${sessionScope.error}
                </div>
                <div>
                    <input type="submit" value="登陆" style="width:60px;height:30px" />
                    <input type="button" value="注册" onclick="window.open('/index.jsp','_self')" style="width:60px;height:30px" />
                </div>
            </form>
            <div style="clear:both"></div>
        </div>
    </div>
    <!-- 导航栏结束 -->
    <div class="footer_container">
        <div class="footer">
            <ul class="footer_links">
                <li><span>收藏本店</span>
                    <ul>
                        <li><a href="#">蔬菜</a></li>
                        <li><a href="#">水果</a></li>
                        <li><a href="#">谷物</a></li>
                        <li><a href="#">肉制品</a></li>
                        <li><a href="#">海鲜</a></li>
                        <li><a href="#">农家美食</a></li>
                    </ul></li>
                <li class="seperator"><span>销售地区</span>
                    <ul>
                        <li><a href="#">浙江</a></li>
                        <li><a href="#">上海</a></li>
                        <li><a href="#">江苏</a></li>
                        <li><a href="#">广东</a></li>
                        <li><a href="#">福建</a></li>
                        <li><a href="#">内蒙古</a></li>
                        <li><a href="#">辽宁</a></li>
                        <li><a href="#">港澳台</a></li>
                    </ul></li>
                <li><span>客户服务</span>
                    <ul>
                        <li><a href="#">帮助</a></li>
                        <li><a href="#">速递</a></li>
                        <li><a href="#">退换货</a></li>
                        <li><a href="#">付款方式</a></li>
                        <li><a href="#">订单跟踪</a></li>
                        <li><a href="#">礼物包选项</a></li>
                        <li><a href="#">国际服务</a></li>
                        <li><a href="#">退运险</a></li>
                    </ul></li>
                <li><span>个人账户</span>
                    <ul>
                        <li><a href="#">个人账户信息</a></li>
                        <li><a href="#">用户密码</a></li>
                        <li><a href="#">订单历史</a></li>
                        <li><a href="#">付款方式</a></li>
                        <li><a href="#">我的收货地址</a></li>
                        <li><a href="#">我的通知</a></li>
                    </ul></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
