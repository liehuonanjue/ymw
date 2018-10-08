<%@page import="com.entity.Easybuy_user" %>
<%@page import="java.util.List" %>
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
<blockquote class="layui-elem-quote ">
    <div class="layui-inline">
        <div class="layui-input-inline">
            <input type="text" class="layui-input searchVal"
                   placeholder="请输入搜索的内容"/>
        </div>
        <a class="layui-btn search_btn searchVale" data-type="reload">搜索</a>
    </div>
    <input type="radio" name="userrad" value="2" id="radall" checked><label for="radall">全部</label>
    <input type="radio" name="userrad" value="1" id="rad0"><label for="rad0">冻结用户</label>
    <input type="radio" name="userrad" value="0" id="rad1"><label for="rad1">正常用户</label>
</blockquote>
<table id="userList" lay-filter="userList"></table>
<div id="test1"></div>
<input id="PageContext" type="hidden"
       value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="../../static/layui/layui.js"></script>
<script type="text/javascript" src="../../static/js/jquery-1.8.3.min.js"></script>
<!-- <script type="text/javascript" src="userList.jsp"></script> -->
<script type="text/javascript">

    var num = 0; //总数量
    var curnum = 1; //当前页数
    var userraid = 2;

    function btn() {
        $(".search_btn").on("click", function () {
            unm()
        });
    }

    function userrad() {
        $("[name=userrad]").click(function () {
            unm()
            userraid = $(this).val();
        });
    }

    $(function () {
        unm();
        userrad();
        btn()
    });

    //查询有多少数据
    function unm() {
        $.ajax({
            url: "/UserControServlet/totalRecords",
            type: "POST",
            data: {
                "count": $(".searchVal").val()
            },
            dataType: "text",
            success: function (data) {
                console.log(data)
                num = data;
                namee();
            }
        });
    }


    function namee() {
        $.ajax({
            url: "/UserControServlet/listselectpage_EasybuyUser",
            data: {
                "page": curnum,
                "productName": $(".searchVal").val(),
                "userraid": userraid
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                console.log(data)
                layui.use(['table', 'laypage', 'laydate'], function () {
                    var table = layui.table, laypage = layui.laypage;
                    table.render({
                        elem: '#userList',
                        data: data,
                        page: false,
                        height: 440,
                        id: "userListTable",
                        dataType: "JSON",
                        done: function (res, curr, count) {
                            laypage.render({
                                elem: 'test1',
                                count: num,
                                curr: curnum,
                                layout: ['prev', 'page', 'next', 'count'],
                                jump: function (obj, first) {
                                    if (!first) {
                                        curnum = obj.curr;
                                        console.log("curnum" + curnum);
                                        namee($(".searchVal").val(), curnum);
                                    }
                                }
                            })
                        },
                        cols: [[
                            {
                                type: "numbers",
                                title: '序号',
                            }, {
                                field: 'username',
                                title: '用户名',
                                align: "center"
                            }, {
                                field: 'loginname',
                                title: '真实姓名',
                                align: "center"
                            }, {
                                field: 'password',
                                title: '密码',
                                align: 'center'
                            }, {
                                field: 'sex',
                                title: '性别',
                                align: 'center',
                                templet: function (d) {
                                    return d.sex == "1" ? "男" : "女";
                                }
                            }, {
                                field: 'mobile',
                                title: '手机号',
                                align: 'center',
                                templet: function (d) {
                                    return d.mobile = d.mobile.substr(0, 3) + '****' + d.mobile.substr(d.mobile.length - 4);
                                }
                            }, {
                                field: 'type',
                                title: '冻结状态',
                                fixed: "right",
                                align: 'center',
                                templet: function (d) {
                                    if (d.type == "0") {
                                        return '<span class="layui-btn layui-btn-xs" lay-event="upFreeze">正常使用</span>'
                                    } else {
                                        return '<span class="layui-btn layui-bg-red layui-btn-xs" lay-event="upUnfreeze">账号冻结</span>'
                                    }
                                }
                            }]]
                    });


                    table.on('tool(userList)', function (obj) {
                        var dat = obj.data;
                        var layEvent = obj.event;
                        var tr = obj.tr;
                        if (layEvent === 'upFreeze') {
                            layer.msg('是否冻结该用户', {
                                time: 20000, //20s后自动关闭
                                shade: [0.6, '#393D49'],
                                btn: ['冻结', '不冻结'],
                                btn1: function (index, layero) {
                                    $.get("/UserControServlet/uptotal", {
                                            "uid": dat.id,
                                            "type": 1
                                        },
                                        function (data) {
                                            console.log(data)
                                            unm();
                                            layer.close(index);
                                        });
                                }
                            });
                        } else if (layEvent === 'upUnfreeze') {
                            layer.msg('是否解冻该用户', {
                                time: 20000, //20s后自动关闭
                                shade: [0.6, '#393D49'],
                                btn: ['解结', '不解结'],
                                btn1: function (index, layero) {
                                    $.get("/UserControServlet/uptotal", {
                                            "uid": dat.id, "type": 0
                                        },
                                        function (data) {
                                            unm();
                                            layer.close(index);
                                        });
                                }
                            });
                        }
                    });


                })//lyaui表格的结束
            }
        });
    }//分页的结束


</script>
</body>
</html>