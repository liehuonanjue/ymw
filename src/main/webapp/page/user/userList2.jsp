<%@page import="java.util.List" %>
<%@page import="com.entity.Easybuy_user" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <meta charset="utf-8">
    <title>用户中心--layui后台管理模板 2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../../static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../../static/css/public.css" media="all"/>
</head>
<body class="childrenBody">
<blockquote class="layui-elem-quote quoteBox">
    <div class="layui-inline">
        <div class="layui-input-inline">
            <input type="text" class="layui-input searchVal"
                   placeholder="请输入搜索的内容"/>
        </div>
        <a class="layui-btn search_btn" data-type="reload">搜索</a>
    </div>
    <div class="layui-inline">
        <a class="layui-btn layui-btn-normal addNews_btn">添加用户</a>
    </div>
</blockquote>
<table id="userList" lay-filter="userList"></table>
<script type="text/html" id="userListBar">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
</script>
<script type="text/javascript" src="../../static/layui/layui.js"></script>
<script type="text/javascript" src="../../static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

    $(function () {
        name();
    })
    $(".search_btn").on("click", function () {
        name();
    });

    function name() {
        var _data = "";
        var _url = "/UserControServlet/selename";
        $.ajax({
            url: _url,
            type: "POST",
            data: {
                "productName": $(".searchVal").val()
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                layui.use(['form', 'table', 'laytpl'], function () {
                    var form = layui.form,
                        $ = layui.jquery,
                        laytpl = layui.laytpl,
                        table = layui.table;
                    //用户列表
                    table.render({
                        elem: '#userList',
                        data: data,
                        cellMinWidth: 95,
                        page: {
                            layout: ['prev', 'page', 'next', 'count'],
                            next: "下一页",
                            prev: "上一页"
                        }, height: "full-125",
                        id: "userListTable",
                        cols: [[
                            {
                                type: "numbers",
                                title: '序号'
                            }, {
                                field: 'name',
                                title: '用户名',
                                align: "center"
                            }, {
                                field: 'pwd',
                                title: '密码',
                                align: 'center',
                                templet: function (d) {
                                    return d.pwd = d.pwd.substr(0, 3) + '****';
                                }
                            }, {
                                field: 'tbit',
                                title: '职位',
                                align: 'center',
                                templet: function (d) {
                                    return d.tbit == "1" ? "操作员" : "管理员";
                                }
                            }]]
                    });
                });
            }
        });
    }
</script>
</body>


</html>