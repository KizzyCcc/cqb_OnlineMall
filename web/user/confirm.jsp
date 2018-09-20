<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Kizzy_ccc
  Date: 2018/5/18
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:set value="${pageContext.request.contextPath}" var="shop" />
    <link rel="stylesheet" href="../css/detail.css" type="text/css"/>
    <link rel="stylesheet" href="../css/public.css" type="text/css"/>
    <link rel="stylesheet" href="../css/style.css" type="text/css"/>
    <link rel="stylesheet" href="../js/jquery-easyui-1.3.5/themes/icon.css" type="text/css"/>
    <link rel="stylesheet" href="../js/jquery-easyui-1.3.5/themes/default/easyui.css" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-easyui-1.3.5/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
    <% response.setHeader("cache-control", "no-store"); %>
</head>
<body>
    <c:if test="${empty sessionScope.forder.sorders }">
        <!-- 如果购物车中的购物项为空，则跳转到首页 -->
        <c:redirect url="/test.jsp"/>
    </c:if>
    <div class="wrapper">
        <div class="header">
            <div class="header_container">
                <!--头部开始-->
                <div class="top_bar clear">
                    <!--头部小导航-->
                    <div class="welcom fl">欢迎光临LEISUPET SHOP!</div>
                    <ul class="top_links fr">
                        <li><a href="${shop}/test.jsp">首页</a></li>
                        <li class="highlight"><a href="${shop}/send2_user_showCart.action">购物车</a></li>
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
                    <h1 class="logo clear fl">
                        <a href="${shop}/test.jsp">
                            <img src="${shop}/images/logo.png" />
                        </a>
                    </h1>
                    <!-- 小购物车 -->
                    <div class="minicart">
                        <a class="minicart_link" href="${shop}/send2_user_showCart.action">
                            <span class="item"><b>${fn:length(sessionScope.forder.sorders)}</b> 件/ </span>
                            <span class="price"> <b>￥${sessionScope.forder.total}</b> </span>
                        </a>
                    </div>
                    <!-- 小购物车结束 -->
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
            <!-- 购物车 -->
            <ul class="breadcrumb">
                <li>
                    <a href="#">加入购物车</a>
                </li>
                <li class="active">
                    <a href="#">确认订单信息</a>
                </li>
            </ul>
            <!-- 确认订单信息 -->
            <div class="check-stup">
                <!-- 商品确认 -->
                <div class="pro-check check ">
                    <h1>确认订单信息</h1>
                    <table class="data-table cart-table" cellpadding="0" cellspacing="0">
                        <tr>
                            <th class="align_center" width="10%">商品编号</th>
                            <th class="align_left" width="35%" colspan="2">商品名称</th>
                            <th class="align_center" width="10%">销售价格</th>
                            <th class="align_center" width="20%">数量</th>
                            <th class="align_center" width="15%">小计</th>
                        </tr>
                        <c:forEach items="${sessionScope.forder.sorders}" var="sorder" varStatus="num">
                            <tr lang="${sorder.productEntity.id}">
                                <td class="align_center"><a href="#" class="edit">${num.count}</a>
                                </td>
                                <td width="80px"><img src="${shop}/images/${sorder.productEntity.pic}" width="80"
                                                      height="80" />
                                </td>
                                <td class="align_left"><a class="pr_name" href="#">${sorder.name}</a>
                                </td>
                                <td class="align_center vline">￥ ${sorder.price}</td>
                                <td class="align_center vline">
                                        ${sorder.number}
                                </td>
                                <td class="align_center vline">￥${sorder.price*sorder.number}</td>
                            </tr>
                        </c:forEach>
                    </table>

                    <div class="sum">
                        <div class="fr"><span>总计：</span><b>￥${sessionScope.forder.total}</b></div>
                    </div>

                </div>
                <!-- 订购人确认 -->
                <form action="forder_save.action" method="post">
                    <div class="person-check check">
                        <h1>订购人信息</h1>
                        <div class="person-checkinner">
                            <div>
                                <label>配送姓名:</label>
                                <input type="text" name="name" value="${sessionScope.user.name }"/>
                            </div>
                            <div>
                                <label>联系方式:</label>
                                <input type="text" name="phone" value="${sessionScope.user.phone }"/>
                            </div>
                            <div>
                                <label>区域邮编:</label>
                                <input type="text" name="post" />
                            </div>
                            <div>
                                <label>配送地址:</label>
                                <input type="text" name="address" />
                            </div>
                        </div>
                    </div>
                    <!-- 卖家留言 -->
                    <div class="person-check check">
                        <h1>卖家留言</h1>
                        <textarea style="margin: 5px;" name="remark" cols="120" rows="2">输入留言信息</textarea>
                        <div class="submit">
                            <input type="submit" class="sub-logo fr" style="margin: 0px;padding: 0px; border: 0px;" value="确认无误,购买" />
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
