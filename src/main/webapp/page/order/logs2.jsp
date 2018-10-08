<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String servlteU = "/UserInfoServlet?oper";
%>
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
	<blockquote class="layui-elem-quote quoteBox">
		<form class="layui-form">
			<div class="layui-inline">
				<div class="layui-input-inline">
					<input type="text" class="layui-input searchVal"
						placeholder="请输入搜索的内容" />
				</div>
				<a class="layui-btn search_btn" data-type="reload">搜索</a>
			</div>
			<div class="layui-inline">
				<a class="layui-btn layui-btn-danger layui-btn-normal delAll_btn">批量删除</a>
			</div>
		</form>
	</blockquote>
	<table id="logs" lay-filter="logs"></table>
	<div id="test1"></div>
	<script type="text/javascript" src="../../layui/layui.js"></script>
	<script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		var _url = "${pageContext.request.contextPath }/UserInfoServlet";
		var curnum = 1; //当前页数
		var userraid=2;
		var curr = 0; //当前页数
		var limit = 10; //一页显示多少数据
		var num = 0; //总数量
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
					"count" : $(".searchVal").val()
				},
				dataType : "text",
				success : function(date) {
					num = date;
					name();
				}
			});}
		
		//分页数据
		function name(curr) {
			$.ajax({
			url : _url,data : {
			"oper" : "listselectpage_product",
			"page" : curnum,
			"productName" : $(".searchVal").val()
			},type : "POST",
			dataType : "json",
			success : function(data) {
			layui.use([ 'table', 'laypage', 'laydate'],function() {
				   var table = layui.table, laypage = layui.laypage;
					table.render({
					elem : '#logs',
					data : data,
				    height : "full-104",
					id : "systemLog",
					dataType : "JSON",
					page : false,
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
					cols : [ [{
						type : "numbers",
						title : 'id',
							},{
						field : 'name',
						title : '商品名称',
						align : "center"
							},{
						field : 'filename',
						title : '图片',
						align : "center",
						templet: function(c){
					        return '<img src="${pageContext.request.contextPath}/upload/'+c.filename+'"/>'
					      }},{
						field : 'stock',
						title : '库存',
						align : "center"
							},{
						field : 'price',
						title : '价格',
						align : "center"
							 },{
						field : 'isdelete',
						title : '是否上架',
						align : 'center',
						templet : function(d) {
						if (d.isdelete == "0") {
						return '<span class="layui-btn   layui-btn-xs">上架</span>'
						} else {
						return '<span class="layui-btn layui-bg-red layui-btn-xs">下架</span>'
						}}},{
						title : '操作',
						align : "center",
						templet : function() {
						return '<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a><a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>'
						}} ] ]});
								  
					table.on('tool(logs)', function(obj){ 
						var dat = obj.data; 
						var layEvent = obj.event; 
						var tr = obj.tr; 
						if(layEvent === 'del'){ 
					if(window.confirm('你确定要删除吗')){
						var idd=dat.id;
						var path = "${pageContext.request.contextPath}/UserInfoServlet";
						$.get(path, { oper: "dele","tid":dat.id,"uname":"log2" },
						function(data){
						window.location.reload();
						});	}}
						else if(layEvent === 'edit'){
						UpLink(dat);
						}}); 
							})//lyaui表格的结束
				function UpLink(dat){
				location.href = "<%=path%><%=servlteU%>=byid&id="+ dat.id;
		 		 }
			
						}
					});
	
			}//分页的结束
	</script>

</body>
</html>