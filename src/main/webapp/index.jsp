<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>七组商店信息管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="/static/css/index.css" media="all"/>
    <link rel="stylesheet" href="/static/css/public.css" media="all"/>
</head>
<body class="main_body">
<div class="layui-layout layui-layout-admin">
    <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main mag0">
            <a href="#" class="logo">七组后台</a>
            <!-- 显示/隐藏菜单 -->
            <a href="javascript:;" class="seraph hideMenu layui-icon">&#xe653;</a>
            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu">
                <li class="layui-nav-item" pc><a href="javascript:;"
                                                 class="clearCache"><i class="layui-icon"
                                                                       data-icon="&#xe640;">&#xe640;</i><cite>清除缓存</cite><span
                        class="layui-badge-dot"></span></a></li>
                <li class="layui-nav-item lockcms" pc><a href="javascript:;"><i
                        class="seraph icon-lock"></i><cite>锁屏</cite></a></li>
                <li class="layui-nav-item" id="userInfo">
                    <a href="javascript:;">
                        <img src="/static/upload/${uid.head}"
                             class="layui-nav-img userAvatar" width="35" height="35">
                        <cite class="adminName">${uid.name}</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="page/user/changePwd.jsp"><i
                                    class="seraph icon-xiugai" data-icon="icon-xiugai"></i><cite>修改密码</cite></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" class="changeSkin"><i
                                    class="layui-icon">&#xe61b;</i><cite>更换皮肤</cite></a>
                        </dd>
                        <dd>
                            <a href="/UserControServlet/loginout" class="signOut"><cite>退出</cite></a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧导航 -->
    <div class="layui-side layui-bg-black">
        <div class="user-photo">
            <a class="img" title="我的头像"><img
                    src="/static/upload/${uid.head}"
                    class="userAvatar"></a>
            <p>
                你好！<span class="userName">${uid.name}</span>, 欢迎登录
            </p>
        </div>
        <!-- 搜索 -->
        <div class="navBar layui-side-scroll" id="navBar">
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-this">
                    <a href="page/main.jsp">
                        <i class="layui-icon" data-icon=""></i>
                        <cite>后台首页</cite></a></li>
            </ul>
        </div>
    </div>

    <!-- 右侧内容 -->
    <div class="layui-body layui-form" style="bottom: 4px;">
        <div class="layui-tab mag0" lay-filter="bodyTab" id="top_tabs_box">
            <ul class="layui-tab-title top_tab" id="top_tabs">
                <li class="layui-this" lay-id=""><i class="layui-icon">&#xe68e;</i>
                    <cite>后台首页</cite></li>
            </ul>
            <ul class="layui-nav closeBox">
                <li class="layui-nav-item"><a href="javascript:;"><i
                        class="layui-icon caozuo">&#xe643;</i> 页面操作</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" class="refresh refreshThis"><i
                                    class="layui-icon">&#x1002;</i> 刷新当前</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" class="closePageOther"><i
                                    class="seraph icon-prohibit"></i> 关闭其他</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" class="closePageAll"><i
                                    class="seraph icon-guanbi"></i> 关闭全部</a>
                        </dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <iframe src="page/main.jsp"></iframe>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- 移动导航 -->
<div class="site-tree-mobile">
    <i class="layui-icon">&#xe602;</i>
</div>
<div class="site-mobile-shade"></div>
<script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="static/layui/layui.js"></script>
<script type="text/javascript" src="index.js"></script>
<script type="text/javascript" src="static/js/cache.js"></script>
<script type="text/javascript" src="static/js/bodyTab.js"></script>
<script type="text/javascript">
    <%--alert("${uid.head}")--%>
    //退出
    // 	javascript :window.history.forward(1);
</script>
</body>

</html>