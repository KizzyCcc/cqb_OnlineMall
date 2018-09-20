<%--
  Created by IntelliJ IDEA.
  User: Kizzy_ccc
  Date: 2018/5/5
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../js/jquery-easyui-1.3.5/themes/icon.css" type="text/css"/>
    <link rel="stylesheet" href="../js/jquery-easyui-1.3.5/themes/default/easyui.css" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-easyui-1.3.5/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        form div {
            margin:5px;
        }
    </style>
    <script type="text/javascript">
        $(function(){
            $("input[name=type]").validatebox({ //这里是“类别名称”的验证功能，如果用户没填好就提交的话，会有提示
                required:true,
                missingMessage:'请输入类别名称' //提示的内容
            });
            $("#cc").combobox({
                //将请求发送给accountAction中的query方法处理，这里需要将处理好的数据返回到这边来显示了 ，所以后台需要将数据打包成json格式发过来
                url:'account_query.action',
                valueField:'id',
                textField:'login', //我们下拉列表中显示的是管理员的登录名
                panelHeight:'auto', //自适应高度
                panelWidth:120,//下拉列表是两个组件组成的
                width:120, //要同时设置两个宽度才行
                editable:false //下拉框不允许编辑
            });
            $("#ff").form("disableValidation");
            $("#btn").click(function(){
                //开启验证
                $("#ff").form("enableValidation");
                //如果验证成功，则提交数据
                if($("#ff").form("validate")) {
                    //调用submit方法提交数据
                    $("#ff").form('submit', {
                        url: 'category_save.action', //将请求提交给categoryAction中的save方法处理
                        success: function(){ //成功后
                            //如果成功了，关闭当前窗口
                            parent.$("#win").window("close");
                            //刷新页面，刚刚添加的就显示出来了。
                            //获取aindex-->iframe-->datagrid
                            //parent.$("iframe[title='类别管理']").get(0).contentWindow.$("#dg").datagrid("reload");
                            parent.$("iframe[src='send_category_query.action']").get(0).contentWindow.$("#dg").datagrid("reload");
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
<form id="ff" method="post">
    <div>
        <label>商品名称:</label> <input type="text" name="type" />
    </div>
    <div>
        <label>所属管理员：</label>
        <input id="cc" name="accountEntity.id"/>
    </div>
    <div>
        <label>热点:</label>
        是<input type="radio" name="hot" value="true" />
        否 <input type="radio" name="hot" value="true" />
    </div>
    <div>
        <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
    </div>
</form>
</body>
</html>
