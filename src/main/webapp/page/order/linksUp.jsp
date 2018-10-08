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
	<form class="linksAdd" action="<%=path%><%=servlteU%>=info"	method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">一级分类名称</label>
			<div class="layui-input-block">
				<select name="stair" id="sd"class="luau layui-input masterEmail">
				<option value ="+0+">${userinfo.id}</option>
				</select> 
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">二级分类名称</label>
			<div class="layui-input-block">
				<select name="second" id="sc"
					class="luau layui-input masterEmail">
				</select> <input class="hello" style="display: none;"> 
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">三级分类名称</label>
			<div class="layui-input-block">
				<input type="text" name="uname" >
			</div>
		</div>
		<div class="layui-form-item">
			<input type="submit"  value="添加"class="layui-btn layui-block"/>
		</div>
	</form>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
	$(function() {
		var  _url="${pageContext.request.contextPath }/UserInfoServlet";
		$.ajax({
	  	  	url:_url,
    	  	type:"POST",
    	  	data:{"oper":"level2","tid": 1,"id":0},
    	  	dataType:"JSON",
		    success : function(data) {
		   	 $("#sd").append("<option value ="+0+">"+"添加一级"+"</option>");
	    	 $("#sc").html("<option value ="+0+">"+""+"</option>");
		   $.each(data,function(i,dom){
				 $("#sd").append("<option value ="+dom.id+">"+dom.name+"</option>");
		  }); }	});
		
		$("#sd").change(function(){
			$("#sc").html("");
			var _ss= $("#sd option:selected").val();
		     if(_ss!=0){
			$.ajax({
		  	  	url:_url,
	    	  	type:"POST",
	    	  	data:{"oper":"level2","tid": 2,"id":_ss},
	    	  	dataType:"JSON",
			    success : function(date) {
			    	 $("#sc").append("<option value ="+0+">"+"添加二分级"+"</option>");
			    	$.each(date,function(i,doc){
					$("#sc").append("<option value ="+doc.id+">"+doc.name+"</option>");
			  });}		});}
		   
			});
	});
	</script>
</body>
</html>