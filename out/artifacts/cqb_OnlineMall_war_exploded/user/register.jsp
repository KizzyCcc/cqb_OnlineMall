<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Kizzy_ccc
  Date: 2018/5/22
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:set var="shop" value="${pageContext.request.contextPath}" />
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery-easyui-1.3.5/themes/icon.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery-easyui-1.3.5/themes/default/easyui.css" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.5/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            checkLogin();
            checkPass();
            checkRePass();
            checkPhone();
            checkMail();
        });
        function checkLogin() {
            $("#login").blur(function(){
                var login = $(this).val();
                //此处替换你自己的jsp路径，jsp返回值：存在输出1，不存在输出0
                var changeUrl = "user_checkLogin.action?login=" + login;
                $.get(changeUrl,function(str){
                    if(str == '0'){
                        $("#tips_1").html("<font color=\"red\">您输入的用户名存在！请重新输入！</font>");
                    }else{
                        $("#tips_1").html("<font color=\"green\">用户名可以使用</font>");
                    }
                });
                return false;
            });
        }
        function checkPass() {
            $('#pass').keyup(function() {
                var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
                var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
                var enoughRegex = new RegExp("(?=.{6,}).*", "g");
                if (false == enoughRegex.test($(this).val())) {
                    $('#tips_2').html("<font color=\"red\">密码长度不小于6位</font>");
                } else if (strongRegex.test($(this).val())) {
                    //$('#tips_2').className = 'ok';
                    $('#tips_2').html("<font color=\"green\">密码强度：强</font>");
                } else if (mediumRegex.test($(this).val())) {
                    //$('#tips_2').className = 'alert';
                    $('#tips_2').html("<font color=\"orange\">密码强度：中</font>");
                } else {
                    //$('#tips_2').className = 'error';
                    $('#tips_2').html("<font color=\"red\">密码强度：弱</font>");
                }
                return true;
            });
        }
        function checkRePass() {
            $('#re_pass').blur(function () {
                var pass = $('#pass').val();
                var re_pass = $(this).val();
                if(re_pass != pass)
                    $('#tips_3').html("<font color=\"red\">密码不一致</font>");
                else
                    $('#tips_3').html("<font color=\"green\">密码正确</font>");
                return false;
            });
        }
        function checkPhone() {
            $('#phone').keyup(function() {
                var reg = /^1[358][0-9]{9}$/;
                if(false == reg.test($(this).val()))
                    $('#tips_4').html("<font color=\"red\">请输入正确的手机号码</font>");
                else
                    $('#tips_4').html("<font color=\"green\">手机号码可用</font>");
            });
            $('#phone').blur(function () {
                var phone = $(this).val();
                //此处替换你自己的jsp路径，jsp返回值：存在输出1，不存在输出0
                var changeUrl = "user_checkPhone.action?phone=" + phone;
                //alert(phone)
                $.get(changeUrl,function(str){
                    if(str == '0'){
                        $("#tips_4").html("<font color=\"red\">该号码已被注册</font>");
                    }else{
                        $("#tips_4").html("<font color=\"green\">手机号码可用</font>");
                    }
                });
                return false;
            });
        }
        function checkMail() {
            $('#mail').keyup(function() {
                var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                if(false == reg.test($(this).val()))
                    $('#tips_5').html("<font color=\"red\">请输入正确的邮箱地址</font>");
                else
                    $('#tips_5').html("<font color=\"green\">邮箱地址可用</font>");
            });
            $('#mail').blur(function () {
                var mail = $(this).val();
                //此处替换你自己的jsp路径，jsp返回值：存在输出1，不存在输出0
                var changeUrl = "user_checkMail.action?email=" + mail;
                //alert(phone)
                $.get(changeUrl,function(str){
                    if(str == '0'){
                        $("#tips_5").html("<font color=\"red\">该号码已被注册</font>");
                    }else{
                        $("#tips_5").html("<font color=\"green\">邮箱地址可用</font>");
                    }
                });
                return false;
            });
        }
    </script>
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
                    <li><a href="${shop}/test.jsp">首页</a></li>
                    <li><a href="${shop}/send2_user_showCart.action">购物车</a></li>
                    <c:choose>
                        <c:when test="${empty sessionScope.user}">
                            <li class="highlight"><a href="#">注册</a></li>
                            <li><a href="${shop}/send_login.action">登录</a></li>
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
        <!-- 购物车 -->
        <ul class="breadcrumb">
            <li class="active">
                <a href="#">注册</a>
            </li>
        </ul>
        <!-- 确认订单信息 -->
        <div class="check-stup">
            <form action="user_save.action" method="post">
                <div class="person-check check">
                    <h1>用户信息</h1>
                    <div class="person-checkinner">
                        <div>
                            <label>登录名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="text" name="login" id="login" maxlength="16"/><span id="tips_1">*</span>
                        </div>
                        <div>
                            <label>密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="password" name="pass" id="pass" maxlength="20"/><span id="tips_2">*</span>
                        </div>
                        <div>
                            <label>确认密码：&nbsp;&nbsp;</label>
                            <input type="password" id="re_pass" maxlength="20"/><span id="tips_3">*</span>
                        </div>
                        <div>
                            <label>姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="text" name="name" maxlength="15"/>*
                        </div>
                        <div>
                            <label>性别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="radio" name="sex" value="男" checked="checked"/>男&nbsp;&nbsp;
                            <input type="radio" name="sex" value="女" />女
                        </div>
                        <div>
                            <label>联系方式：&nbsp;&nbsp;</label>
                            <input type="text" name="phone" id="phone" maxlength="11"/><span id="tips_4">*</span>
                        </div>
                        <div>
                            <label>邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="text" name="email" id="mail" maxlength="30dian"/><span id="tips_5">*</span>
                        </div>
                    </div>
                </div>
                <!-- 卖家留言 -->
                <div class="person-check check">
                    <div class="submit">
                        <input type="submit" class="sub-logo fr" style="margin: 0px;padding: 0px; border: 0px;" value="确认无误,注册" />
                    </div>
                </div>
            </form>
        </div>
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
