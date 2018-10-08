<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>七组后台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="../../favicon.ico">
    <link rel="stylesheet" href="../../static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../../static/css/public.css" media="all"/>
</head>
<body class="loginBody"
      style="background: #1a0c2c url(../../static/images/body_bg.png);">


<form class="layui-form">
    <div class="login_face">
        <img src="../../static/images/face.jpg" class="userAvatar">
    </div>
    <div class="layui-form-item input-item" onkeyup="name()">
        <label for="userName">用户名</label> <input type="text"
                                                 placeholder="请输入用户名" id="userName" name="username"
                                                 class="layui-input" lay-verify="required">
    </div>
    <div class="layui-form-item input-item">
        <label for="password">密码</label> <input type="password"
                                                placeholder="请输入密码" id="password" name="password"
                                                class="layui-input" lay-verify="required">
    </div>


    <div class="layui-form-item">
        <input type="button" class="layui-btn layui-block" id="block"
               value="登录"/>

    </div>

</form>


<script type="text/javascript" src="../../static/layui/layui.js"></script>
<script type="text/javascript" src="../../static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../../static/js/login.js"></script>
<script type="text/javascript">
    if (window !== top) {
        top.location.href = location.href;
    }

    $(".layui-input").keydown(function (e) {
        if (e.keyCode == 13) {
            keycode();
        }
    });
    var _url = "/UserControServlet";
    $("#block").click(function () {
        keycode();
    })

    function keycode() {
        $(".layui-block").val("登录中...").addClass("layui-disabled");
        setTimeout(function () {
            $.ajax({
                url: _url + "/login",
                type: "POST",
                data: {
                    "username": $("[name=username]").val(),
                    "password": $("[name=password]").val()
                },
                dataType: "text",
                success: function (data) {
                    console.log(data);
                    if (data == "true") {
                        document.location = '../../index.jsp'
                    } else {
                        layer.msg('登陆失败');
                        $(".layui-block").val("登录").removeClass(
                            "layui-disabled");
                    }
                }
            })

        }, 1000);
    }

    function name() {
        $.ajax({
            url: _url + "/imges",
            type: "POST",
            data: {
                "productName": $("#userName").val()
            },
            dataType: "text",
            success: function (data) {
                console.log(data);
                var arr = data.split("+");
                console.log(arr);
                if ($("#userName").val() == arr[1]) {
                    var s = "../../static/upload/"
                        + arr[0];
                    $(".userAvatar").attr("src", s);
                } else {
                    $(".userAvatar").attr("src", "../../static/images/face.jpg");
                }
            }
        })
    }
</script>

</body>
</html>
