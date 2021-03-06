<%--
  Created by IntelliJ IDEA.
  User: Kizzy_ccc
  Date: 2018/5/7
  Time: 15:11
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
            margin:10px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            var dg = parent.$("iframe[src='send_product_query.action']").get(0).contentWindow.$("#dg");

            $.extend($.fn.validatebox.defaults.rules,{
                //函数的名称：{函数的实现体(又是一个json对象，里面包括函数的实现，和错误消息的设置)}
                format:{
                    //函数实现，如果返回为false，则验证失败
                    validator: function(value,param){
                        //获取当前文件的后缀名
                        var ext = value.substring(value.lastIndexOf('.') + 1);
                        //获取支持的文件后缀名，然后比较即可
                        var arr = param[0].split(",");
                        for(var i = 0; i < arr.length; i++) {
                            if(ext == arr[i])
                                return true;
                        }
                        return false;
                    },
                    //错误消息
                    message: '文件后缀必须为:{0}'
                }
            });
            $("#cc").combobox({
                //将请求发送给categoryAction中的query方法处理，这里需要将处理好的数据返回到这边来显示了 ，所以后台需要将数据打包成json格式发过来
                url:'category_query.action',
                valueField:'id',
                textField:'type', //我们下拉列表中显示的是商品的类别名
                panelHeight:'auto', //自适应高度
                panelWidth:120,//下拉列表是两个组件组成的
                width:120, //要同时设置两个宽度才行
                editable:false, //下拉框不允许编辑
                //combobox继承combo继承validatebox，所以可以直接在这里设置验证
                required:true,
                missingMessage:'请选择所属类别'
            });

            var rows = dg.datagrid("getSelections");
            //alert(rows[0].categoryEntity.id);

            $("#ff").form('load',{
                id:rows[0].id,
                name:rows[0].name,
                price:rows[0].price,
                remark:rows[0].remark,
                xremark:rows[0].xremark,
                commend:rows[0].commend,
                open:rows[0].open,
                'categoryEntity.id':rows[0].categoryEntity.id //EasyUI不支持account.id这种点操作，所以要加个引号
            });

            $("input[name=name]").validatebox({
                required:true,
                missingMessage:'请输入类别名称'
            });

            $("input[name=price]").numberbox({
                required:true,
                missingMessage:'请输入商品价格',
                min:0,
                precision:2, //保留两位小数
                //prefix:'$'
            });

            $("input[name='fileImage.upload']").validatebox({
                required:true,
                missingMessage:'请上传商品图片',
                //设置自定义方法
                validType:"format['gif,jpg,jpeg,png']"//中括号里面是参数
            });

            $("textarea[name=remark]").validatebox({
                required:true,
                missingMessage:'请输入商品的简单描述'
            });

            $("textarea[name=xremark]").validatebox({
                required:true,
                missingMessage:'请输入商品的简单描述'
            });

            $("#ff").form("disableValidation");

            $("#btn").click(function(){
                //开启验证
                $("#ff").form("enableValidation");
                //如果验证成功，则提交数据
                if($("#ff").form("validate")) {
                    //调用submit方法提交数据
                    $("#ff").form('submit', {
                        url: 'product_update.action', //提交时将请求传给productAction的update方法执行
                        success: function(){
                            //如果成功了，关闭当前窗口，并刷新页面
                            parent.$("#win").window("close");
                            dg.datagrid("reload");
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
<form title="更新商品" id="ff" method="post" enctype="multipart/form-data">
    <div>
        <label>商品名称:</label> <input type="text" name="name" />
    </div>
    <div>
        <label>商品价格:</label> <input type="text" name="price" />
    </div>
    <div><label>更新图片:</label> <input type="file" name="fileImage.upload" /></div>
    <div>
        <label>所属商品类:</label>
        <!-- 远程加载管理员数据 -->
        <input id="cc" name="categoryEntity.id" />
    </div>
    <div>
        <label>简单描述:</label>
        <textarea name="remark" cols="40" rows="4"></textarea>
    </div>
    <div>
        <label>详细描述:</label>
        <textarea name="xremark" cols="40" rows="8"></textarea>
    </div>
    <div>
        <label>推荐商品:</label>
        是:<input type="radio" name="commend" value="true" />
        否:<input type="radio" name="commend" value="false" />
    </div>
    <div>
        <label>有效商品:</label>
        上架:<input type="radio" name="open" value="true" />
        下架:<input type="radio" name="open" value="false" />

    </div>

    <div>
        <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">更新</a>
        <input type="hidden" name="id" />
    </div>
</form>
</body>
</html>
