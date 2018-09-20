<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <c:set value="${pageContext.request.contextPath}" var="shop"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery-easyui-1.3.5/themes/icon.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery-easyui-1.3.5/themes/default/easyui.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.5/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
</head>

<body>
<div class="wrapper">
    <div class="header">
        <div class="header_container">
            <!--头部开始-->
            <div class="top_bar clear">
                <!--头部小导航-->
                <div class="welcom fl">欢迎光临LEISUPET SHOP! </div>
                <ul class="top_links fr">
                    <li class="highlight"><a href="#">首页</a></li>
                    <li><a href="${shop}/send2_user_showCart.action">购物车</a></li>
                    <c:choose>
                        <c:when test="${empty sessionScope.user}">
                            <li><a href="${shop}/send2_user_register.action">注册</a></li>
                            <li><a href="${pageContext.request.contextPath}/send_login.action">登录</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><span>欢迎您：${sessionScope.user.name}</span></li>
                            <li><a href="${shop}/send2_user_recharge.action">我的账户</a></li>
                            <li><a href="${shop}/user_cancel.action">注销</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <!--头部小导航结束-->
                <!-- logo -->
                <h1 class="logo clear fl"> <a href="test.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" /></a> </h1>
                <!-- 购物车 -->
                <div class="minicart">
                    <a class="minicart_link" href="${pageContext.request.contextPath}/send2_user_showCart.action">
                        <span class="item"><b>${fn:length(sessionScope.forder.sorders)}</b> 件/ </span>
                        <span class="price"> <b>￥${sessionScope.forder.total}</b> </span>
                    </a>
                </div>
                <!-- 购物车结束 -->
                <!-- 搜索框 -->
                <div class="header_search">
                    <div class="form-search ">
                        <form action="${shop}/product_queryByName.action" method="post">
                            <input  placeholder="请输入商品名称" class="input-text" type="text" name="name" />
                            <button type="submit" title="Search"></button>
                        </form>
                    </div>
                </div>

            </div>

        </div>
    </div>
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
    <div class="section_container">
        <!--左侧导航-->
        <div id="side_nav">
            <img src="${pageContext.request.contextPath}/images/lm_banner_2.jpg" height="240" width="240"/>
            <div style="margin-top: 7;"><img src="${pageContext.request.contextPath}/images/lm_banner_3.jpg" height="223" width="240"/></div>
        </div>
        <!-- 右侧焦点图区域 -->
        <div id="main_content ">
            <div style="float: right; margin-top: 7px;"> <img src="${pageContext.request.contextPath}/images/lm_banner_1.jpg" height="470" width="753"/> </div>
        </div>
    </div>



        <div class="products_list products_slider clear">
            <!-- 显示类别名称 -->
            <h2 class="sub_title">商品一览</h2>
            <ul id="first-carousel" class="first-and-second-carousel jcarousel-skin-tango">
                <c:forEach items="${sessionScope.typeList }" var="product" varStatus="status">
                    <li>
                        <a href="${shop}/product_get.action?productEntity.id=${product.id}" class="product_image">
                            <img src="${pageContext.request.contextPath}/images/${product.pic}" height="250" width="180" /></a>
                        <div class="product_info">
                            <h3><a href="#">商品名称：${product.name }</a></h3>
                            <small>简单描述：${product.remark}</small> </div>
                        <div class="price_info">
                            <a href="${shop}/sorder_addSorder.action?productEntity.id=${product.id}"><button><span class="pr_add">添加购物车</span></button></a>
                            <button class="price_add" title="" type="button">
                                <span class="pr_price">￥${product.price}</span>
                            </button>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>



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