<%--
  Created by IntelliJ IDEA.
  User: Kizzy_ccc
  Date: 2018/4/16
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath }" var="shop" />
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="js/jquery-easyui-1.3.5/themes/icon.css" type="text/css"/>
    <link rel="stylesheet" href="js/jquery-easyui-1.3.5/themes/default/easyui.css" type="text/css"/>
    <script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        #menu {
            width:60px;
            /*border:1px solid red;*/
        }
        #menu ul {
            list-style: none;
            padding: 0px;
            margin: 0px;
        }
        #menu ul li {
            border-bottom: 1px solid #fff;

        }
        #menu ul li a {
            /*先将a标签转换为块级元素，才能设置宽和内间距*/
            display: block;
            background-color: #00a6ac;
            color: #fff;
            padding: 5px;
            text-decoration: none;
        }
        #menu ul li a:hover {
            background-color: #008792;
        }

    </style>
    <script type="text/javascript">
        $(function(){
            $("a[title]").click(function(){
                var text = $(this).text();
                var href = $(this).attr("title");
                //判断当前右边是否已有相应的tab
                if($("#tt").tabs("exists", text)) {
                    $("#tt").tabs("select", text);
                } else {
                    //如果没有则创建一个新的tab，否则切换到当前tag
                    $("#tt").tabs("add",{
                        title:text,
                        closable:true,
                        content:'<iframe title=' + text + ' src=' + href + ' frameborder="0" width="100%" height="100%"/>'
                        //href:默认通过url地址加载远程的页面，但是仅仅是body部分
                        //href:'send_category_query.action'
                    });
                }

            });
        });
    </script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',title:'后台管理',split:true" style="height:100px;">
        <h2>${sessionScope.account.name},欢迎来到LEISUPET SHOP后台管理系统&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h2>
        <span><a href="account_cancel.action">注销</a></span>
    </div>
    <div data-options="region:'west',title:'系统操作',split:true" style="width:200px;">
        <!-- 此处显示的是系统菜单 -->
        <div id="menu" class="easyui-accordion" data-options="fit:true">
            <div title="基本操作" data-options="iconCls:'icon-save'">
                <ul>
                    <li><a href="#" title="send_category_query.action">类别管理</a>
                    <li><a href="#" title="send_product_query.action">商品管理</a>
                </ul>
            </div>
            <div title="其他操作" data-options="iconCls:'icon-reload'">
                <ul>
                    <li><a href="#" title="send_sale_sale.action">销量报告</a>
                </ul>
            </div>
        </div>
    </div>
    <div data-options="region:'center',title:'后台操作页面'" style="padding:5px;background:#eee;">
        <div id="tt" class="easyui-tabs" data-options="fit:true">
            <div title="系统缺省页面" style="padding:10px;">

            </div>

        </div>
    </div>
    <div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div>
</body>
</html>
