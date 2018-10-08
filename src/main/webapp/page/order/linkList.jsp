<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String servlteU = "/UserInfoServlet?oper";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
				<a class="layui-btn layui-btn-normal addLink_btn">添加分类</a>
			</div>
			<div class="layui-inline">
				<a class="layui-btn layui-btn-normal return_btn">返回一级</a>
			</div>
		</form>
	</blockquote>
	<table id="linkList" lay-filter="linkList"></table>

	<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" >
var _data="";
var _url="${pageContext.request.contextPath }/UserInfoServlet";
var i=1;
//返回上一级
$(".return_btn").click(function(){
	  window.location.reload();
        
})
$.ajax({
	url:_url,
	type:"POST",
	data:{"oper":"level2","tid": i,"id":0},
	dataType:"json",
	success:function(data){
		console.log(data);
		_data=	data;
		}
	}); 
layui.use(['form','layer','laydate','table','upload'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laydate = layui.laydate,
        upload = layui.upload,
        table = layui.table;
 		table.render({
        elem: '#linkList',
     	data:_data,
     	page: { 
			layout : ['prev','page','next','count' ],
			next:"下一页",
			prev:"上一页"
		},
        cellMinWidth : 95,
        height : "full-104",
        id : "linkListTab",
        cols : [[
            {type: "numbers", title: 'id', width:50},
            {field: 'name', title: '分类名称',align:'center'},
            {field: 'parenid', title: '父分类', align:'center',templet:function(d){
                return d.parenid==0 ? "一级" : d.name;
            }},
            {field: 'type', title: '分类级别', align:'center',templet:function(d){
                return d.type=d.type+"级别" ;
            }},
            {title: '操作', width:230,fixed:"right",align:"center", templet:function(){
                return  '<a class="layui-btn layui-btn-xs"  lay-event="classify">查看2级</a><a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>'
                }}
        ]]
    });
	
    table.on('tool(linkList)', function(obj){
      var dat = obj.data; 
      var layEvent = obj.event; 
      var tr = obj.tr; 
      if(layEvent === 'del'){ //删除
    	  var idd=dat.id;
    		var path = "${pageContext.request.contextPath}/UserInfoServlet";
    		$.ajax({
        	  	url:_url,
        	  	type:"POST",
        	  	data:{"oper":"level2","tid": i+1,"id":dat.id},
           	  	dataType:"json",
        	  	success:function(data){
        	  		 if(data==''){
        	  	        if(window.confirm('你确定要删除吗')){
        	  	          $.get(path, { oper: "dele","tid":dat.id,uname:"linkList" },
        	  	         function(data){
        	  	            window.location.reload();
        	  	              }); }
                     }else{
                    	  alert("下面有数据 请把数据清理掉在删除");
                      }
        	  		 }});
    		//判断
      } else if(layEvent === 'classify'){ //查询字集
    	 _url="${pageContext.request.contextPath }/UserInfoServlet";
    	 var dataname =dat.name;
    	i++;
    	$.ajax({
    	  	url:_url,
    	  	type:"POST",
    	  	data:{"oper":"level2","tid": i,"id":dat.id},
    	  	dataType:"json",
    	  	success:function(data){
    	  		dda=data;
    	  		 if(data==''){
                     alert("亲,没有下一级了");
                 }else{
                	   table.render({
               	        elem: '#linkList',
               	     	data:data,
               	   		page: { 
							layout : ['prev','page','next','count' ],
							next:"下一页",
							prev:"上一页"
						},
               	        cellMinWidth : 95,
               	        height : "full-104",
               	        id : "linkListTab",
               	        cols : [[
               	            {type: "numbers", title: 'id', width:50},
               	            {field: 'name', title: '分类名称',align:'center'},
               	            {field: 'parenid', title: '父分类', align:'center',templet:function(d){
               	                return d.parenid=dataname;
               	            }},
               	            {field: 'type', title: '分类级别', align:'center',templet:function(d){
               	                return d.type=d.type+"级别" ;
               	            }},
               	            {title: '操作', width:230,fixed:"right",align:"center", templet:function(d){
               	                return  '<a class="layui-btn layui-btn-xs" lay-event="classify">查看'+(d.type+1)+'级</a><a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>'
               	              
               	                }}
               	        ]]
               	    });
                 }
    	     
    	  		}
    	  	}); 
		  }
    });
    //添加友链
    $(".addLink_btn").click(function(){
        var index = layer.open({
            title : "添加分类",
            type : 2,
            area : ["350px","350px"],
            content : "page/order/linksAdd.jsp"
      
        })
    })
   
})
</script>
</body>
</html>