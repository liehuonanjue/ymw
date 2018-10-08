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
<link rel="stylesheet" href="layui/css/layui.css" media="all" />
<link rel="stylesheet" href="css/public.css" media="all" />
<style type="text/css">
.bor {
	border: 3px dashed #c3dfff;
	background: #ffd3cf;
}

em {
	margin: 0px 10px 0px 0px;
}
</style>
</head>
<body class="childrenBody">
	<table id="newsList" lay-filter="newsList"></table>
	<div class="bor">
		<h1>
			用户名：<span>${order.loginname}</span> &nbsp;订单号 <em>${order.seriainumber}</em>
		</h1>
		<hr />
		<h3>
			&nbsp;<em>地址:</em> ${order.useraddress} &nbsp; 
			<em>创建时间:</em>ddd ${order.createtime} &nbsp; <em>金额:</em> ${order.cost} &nbsp;<em>状态:</em>
			<i class="status">${order.status}</i>
		</h3>
	</div>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

	<script type="text/javascript">
$(document).ready( function () {
        var text =${order.status};
        if(text == 1){
        	$(".status").html("待审核")
        }else if(text == 2){
        	$(".status").html("审核通过")
        }else if(text == 3){
        	$(".status").html("配货")
        }else if(text == 4){
        	$(".status").html("卖家已发货")
        }else if(text == 5){
        	$(".status").html("已收货")
        }
        
})

		
        	var _url = "${pageContext.request.contextPath }/indentServlet";
		$.ajax({
		url : _url,
		data : {
			"oper" : "selectall",
			"seriainumber" :${order.seriainumber}
			},
        type : "POST",
        dataType : "json",
        success : function(data) {
        layui.use([ 'table'],function() {
        var table = layui.table;
        table.render({
		elem : '#newsList',
		data : data,
		page : false,
		id : "userListTable",
		dataType : "JSON",
		cols : [ [
			{
				type : "numbers",
				title : '序号',
			},{
				field : 'name',
				title : '商品名称',
				width:250,
				align : "center"
			},{
				field : 'filename',
				title : '图片',
				width:350,
				align : "center",
			    templet: function(c){
				        return '<img src="${pageContext.request.contextPath}/upload/'+c.filename+'"/>'
				      }
			},{
				field : 'cost',
				width:150,
				title : '总计',
				align : 'center'
			}
			,{
				field : 'quantiy',
				width:150,
				title : '数量',
				align : 'center'
			}
			] ]});
        })//lyaui表格的结束
}})
	</script>
</body>

</html>