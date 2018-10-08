<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../static/css/public.css" media="all"/>
</head>
<body class="childrenBody">
<blockquote class="layui-elem-quote layui-bg-green">
    <div id="nowTime"></div>
</blockquote>
<div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
    <a href="javascript;" data-url="page/user/userList.jsp">
        <div class="panel_icon layui-bg-red">
            <i class="layui-anim layui-icon">&#xe66f;</i>
        </div>
        <div class="panel_word userAll">
            <span id="sp1"></span> <em>用户数量</em> <cite class="layui-hide">用户信息</cite>
        </div>
    </a>
</div>

<div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
    <a href="javascript:;" data-url="page/news/newsList.jsp">
        <div class="panel_icon layui-bg-orange">
            <i class="layui-anim layui-icon">&#xe698;</i>
        </div>
        <div class="panel_word userAll">
            <span id="sp3"></span> <em>未签收数量</em> <cite class="layui-hide">全部订单</cite>
        </div>
    </a>
</div>
<div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
    <a href="javascript:;" data-url="page/news/newsList3.jsp">
        <div class="panel_icon layui-bg-orange">
            <i class="layui-anim layui-icon ">&#xe698;</i>
        </div>
        <div class="panel_word outIcons">
            <span id="sp4"></span> <em>已经签收数量</em> <cite class="layui-hide">已收货</cite>
        </div>
    </a>
</div>
<div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
    <a href="javascript:;" data-url="page/order/logs2.jsp">
        <div class="panel_icon layui-bg-blue">
            <i class="layui-anim  layui-icon">&#xe657;</i>
        </div>
        <div class="panel_word userAll">
            <span id="sp2"></span> <em>商品数量</em> <cite class="layui-hide">商品管理</cite>
        </div>
    </a>
</div>
<div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
    <a href="javascript:;">
        <div class="panel_icon layui-bg-blue">
            <i class="layui-anim layui-icon">&#xe65e;</i>
        </div>
        <div class="panel_word outIcons">
            <span id="sp5"></span> <em>总金额</em> <cite class="layui-hide">总金额</cite>
        </div>
    </a>
</div>
<div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
    <a href="javascript:;">
        <div class="panel_icon layui-bg-blue">
            <i class="layui-anim layui-icon">&#xe637;</i>
        </div>
        <div class="panel_word">
            <span class="loginTime"></span> <cite>上次登录时间</cite>
        </div>
    </a>
</div>


<div class="layui-row layui-col-space10">
    <div class="layui-col-lg6 layui-col-md12">

        <blockquote class="layui-elem-quote title">
            交易记录 <i class="layui-icon layui-red">&#xe756;</i>
        </blockquote>
        <table class="layui-table mag0" lay-skin="line">
            <colgroup>
                <col>
                <col width="110">
            </colgroup>
            <tbody class="hot_news"></tbody>
        </table>
    </div>

</div>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script type="text/javascript" src="../static/js/main.js"></script>
<script type="text/javascript" src="../static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $.ajax({
        url: "/amountServlet",
        type: "POST",
        dataType: "text",
        success: function (data) {
            var arr = data.split("+");
            $("#sp1").html(arr[0]);
            $("#sp2").html(arr[1]);
            $("#sp3").html(arr[2]);
            $("#sp4").html(arr[3]);
            $("#sp5").html(arr[4]);
            console.log(data);
        }
    })
</script>
</body>
</html>