<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link rel="stylesheet" href="../../layui/css/layui.css" media="all" />
<link rel="stylesheet" href="../../css/public.css" media="all" />

</head>
<body class="childrenBody">
	<form class="layui-form">
		<blockquote class="layui-elem-quote quoteBox">
			<form class="layui-form">
				<div class="layui-inline">
					<em>按着订单号查询：</em>
					<div class="layui-input-inline">
						<input type="text" class="layui-input searchVal"
							placeholder="按照订单号查询" />
					</div>
					<a class="layui-btn search_btn" data-type="reload">搜索</a>
				</div>
			</form>
		</blockquote>
		<table id="newsList" lay-filter="newsList"></table>
	<div id="test1"></div>

		<!--操作-->
		<script type="text/html" id="newsListBar">
		<a class="layui-btn layui-btn-xs" lay-event="edit">查看商品信息</a>
	</script>
	</form>
	<script type="text/javascript" src="../../layui/layui.js"></script>
	<script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
	<!-- 	<script type="text/javascript" src="newsList.js"></script> -->
	 
	<script type="text/javascript">
	var _url = "${pageContext.request.contextPath }/indentServlet";
	var num = 1; //总数量
	var curnum = 1; //当前页数
	var userraid=2;
		 $(function(){
				unm();
			$(".search_btn").on("click", function() {
			unm()
			});
		});
		
		
	//查询有多少数据
function unm() {
	$.ajax({
		url : _url,
		type : "POST",
		data : {
			"oper"  : "totalRecords",
			"count" : $(".searchVal").val(),
			"number":5
		},
		dataType : "text",
		success : function(date) {
			num = date;
			name();
		}
	});}
	

	function name() {
		$.ajax({
		url : _url,
		data : {
				"oper" : "listpage",
				"page" : curnum,
				"productName" : $(".searchVal").val()
				},
        type : "POST",
        dataType : "json",
        success : function(data) {
        layui.use([ 'table', 'laypage', 'laydate' ],function() {
        var table = layui.table, laypage = layui.laypage;
        table.render({
		elem : '#newsList',
		data : data,
		page : false,
		height : 440,
		id : "userListTable",
		dataType : "JSON",
		done : function(res, curr,count) {
			laypage.render({
			elem : 'test1',
			count : num,
			curr : curnum,
			layout : ['prev','page','next','count' ],
			jump : function(obj,first) {
				if (!first) {
				curnum = obj.curr;
				console.log("curnum"+ curnum);
				name($(".searchVal").val(),curnum);
						}}})},
		cols : [ [
			{
				type : "numbers",
				title : '序号',
			},{
				field : 'loginname',
				title : '用户名',
				align : "center"
			},{
				field : 'useraddress',
				title : '用户地址',
				align : "center"
			},{
				field : 'cost',
				title : '总计',
				align : 'center'
			}
			,{
				field : 'seriainumber',
				title : '订单号',
				align : 'center'
			},{
				field : 'status',
				title : '当前状态',
				align : 'center',
				templet : function(d) {
					if (d.status == "5") {
						return '<span class="layui-btn layui-btn-xs" >已收货</span>'
						} 
			}},{title: '操作', width:170, templet:'#newsListBar',fixed:"right",align:"center"}
		       ] ]});
        
        
        //列表操作
        table.on('tool(newsList)', function(obj){
            var layEvent = obj.event,
                data = obj.data;

            if(layEvent === 'edit'){ //编辑
                addNews(data);
            } 
        });
        //
        function addNews(edit){
            var index = layui.layer.open({
                title : "查看信息",
                type : 2,
                content :  _url+"?oper=getuserbyid&triId="+edit.id,
                success : function(layero, index){
                    setTimeout(function(){
                        layui.layer.tips('点击此处返回文章列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500)
                }
            })
            layui.layer.full(index);
            $(window).on("resize",function(){
                layui.layer.full(index);
            })
        }
        })//lyaui表格的结束
}});}//分页的结束
	
	</script>
</body>

</html>