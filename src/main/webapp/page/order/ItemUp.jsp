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
<link rel="stylesheet" href="layui/css/layui.css" media="all" />
<link rel="stylesheet" href="css/public.css" media="all" />

</head>
<body class="childrenBody">

	<form  method="post">
	<input type="hidden" name="uid" value="${productById.id }">
		<table class="layui-table mag0">
			<colgroup>
				<col width="25%">
				<col width="45%">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>商品说明</th>
					<th>商品信息</th>
					<th>商品参考</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>商品名称</td>
					<td><input type="text" class=" layui-input cmsName" id="name" name="productName"
						lay-verify="required" value="${productById.name }" placeholder="请输入商品名称"></td>
					<td id="emailId">花生面包</td>
				</tr>
				<tr>
					<td>商品描述</td>
					<td><input type="text" class="layui-input cmsName" name="productDescribe"
						lay-verify="required" value="${productById.description }" placeholder="请输入商品描述"></td>
					<td pc>hsmb</td>
				</tr>
				<tr>
					<td>商品库存</td>
					<td><input type="text" class="layui-input version" name="productRepertory"
						value="${productById.stock}" placeholder="请输入当前商品库存"></td>
					<td pc>食物</td>
				</tr>
				<tr>
					<td>商品单价</td>
					<td><input type="text" class="layui-input author" name="productPrice"
					value="${productById.price}"	placeholder="请输入商品单价"></td>
					<td pc>15.6</td>
				</tr>
				<tr>
					<td>上传的文件</td>
					<td>  
				<div class="layui-upload">
 	<button type="button" class="layui-btn" name="srcimge" id="test8">选择文件</button>
  						<span id=nameimg>${productById.filename}</span> </td>
				
					<td pc>图片.jpg</td>
				</tr>
<tr>
					<td>上架状态</td>
					<td>	
     			<input id="sex1" type="Radio" name="Isdelete" value="1" ${(productById.isdelete=='0')?'checked' : ''} /><label for="sex1">上架</label>
				<input id="sex0" type="Radio" name="Isdelete" value="0" ${(productById.isdelete=='1')?'checked' : ''} /><label for="sex0">下架</label>
					</td>
					<td pc>上架/下架</td>
				</tr>
		
			
		
			</tbody>
		</table>
		<div class="magt10 layui-right">
			<div class="layui-input-block">
				<input type="button" id="tod"  value="立即提交" class="layui-btn "/>
			<input type="reset" id="tob"  value="重置" class="layui-btn "/>
			<a class="layui-btn" href="javascript:history.back(-1)">点击返回</a>	
			</div>
		</div>
	</form>

		<script type="text/javascript" src="layui/layui.all.js"></script>
		<script type="text/javascript" src="layui/layui.js"></script>
		<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
				/*正则表达式*/
				// 用户名验证
				$("#boolo").val("false");
				function userclock() {
					var userName = $("[name=productName]");
					var userNameText = userName.val();
					if (userNameText == "") {
						layer.tips('货品名称不能为空', "[name=productName]");
						return false;			
						} else {
						return true;
					}
				}
				// 库存验证
				function nameclock() {
					var userName = $("[name=productRepertory]");
					var k = /^\d+$/;
					var userNameText = userName.val();
					if (userNameText == "") {
						layer.tips('库存不能为空', "[name=productRepertory]");
						return false;
					}
					if (!k.test(userNameText)) {
						layer.tips('库存不能输出除正数以为的数字', "[name=productRepertory]");
						return false;
					} else {
						return true;
					}
				}
				// 金额
				function price() {
					var userName = $("[name=productPrice]");
					var k = /^\d+(\.\d+)?$/;
					var userNameText = userName.val();
					if (userNameText == "") {
						layer.tips('金额不能为零', "[name=productPrice]");
						return false;
					}
					if (!k.test(userNameText)) {
						layer.tips('金额不能输出出正数以为的数字', "[name=productPrice]");
						return false;
					} else {
						return true;
					}
				}
			
				$(function() {
					// 用户名验证调用
					$("[name=productName]").blur(function() {
						return userclock();
					});

					$("[name=productRepertory]").blur(function() {
						return nameclock();
						
					});

					$("[name=productPrice]").blur(function() {
						return price();
						
					});
				})

				</script>
		<script type="text/javascript">
		
		var str = $("#nameimg").html();
		if(str.length>10){
			var ims=str.substring(0,10)+"...";
			$("#nameimg").html(ims);
	    	}
		$(function(){
		var  _url="${pageContext.request.contextPath }/UserInfoServlet";
		$("#tob").click(function(){
			$("#sb,#sc").html("");});

		$("#tod").click(function(){
			
        if (userclock()===true&&nameclock()===true&&price()===true){	
			  $.ajax({
				   url:_url,
				   type:"POST",
				   data:{"oper":"updateUser","productName": $("[name=productName]").val(),"productDescribe": $("[name=productDescribe]").val(),
					   "productRepertory": $("[name=productRepertory]").val(),"productPrice": $("[name=productPrice]").val(),
					  "Isdelete": $("[name=Isdelete]").val(),"uid":$("[name=uid]").val(),"username":imgsrc},
				   dataType:"text",
				   success:function(data){  
					   if(data=="true"){  
						   layer.msg('修改成功');
						 window.history.go(-1);
						  window.location.reload();
						 }}})
		  } else{
			  layer.msg('修改失败');
				}; });
		
		var imgsrc=""
			layui.use('upload', function(){
				var  _file="${pageContext.request.contextPath}/fileservlet";
				  var $ = layui.jquery
				  ,upload = layui.upload;
				  upload.render({
					  elem: '#test8'
					  ,url: _file
					  ,auto: false //选择文件后不自动上传
					  ,bindAction: '#tod' //指向一个按钮触发上传
					  ,choose: function(obj){
					    obj.preview(function(index, file, result){
					    	var s = file.name;
					    	imgsrc=file.name;
					    	if(file.name.length>10){
					    	  s=file.name.substring(0,10)+"...";
					    	}
					    	$("#nameimg").html(s);
					   });
					  }
					});  
			});
			
			
		
		
		$.ajax({
	  	  	url:_url,
    	  	type:"POST",
    	  	data:{"oper":"level2","tid": 1,"id":0},
    	  	dataType:"JSON",
		    success : function(data) {
		   	 $("#sa").append("<option value ="+0+">"+"添加一级"+"</option>");
	    	 $("#sb,#sc").html("<option value ="+0+">"+""+"</option>");
		   $.each(data,function(i,dom){
				 $("#sa").append("<option value ="+dom.id+">"+dom.name+"</option>");
		  }); }	});
		$("#sa").change(function(){
			$("#sb,#sc").html("");
			var _ss= $("#sa option:selected").val();
		     if(_ss!=0){
			$.ajax({
		  	  	url:_url,
	    	  	type:"POST",
	    	  	data:{"oper":"level2","tid": 2,"id":_ss},
	    	  	dataType:"JSON",
			    success : function(date) {
			    	 $("#sb").append("<option value ="+0+">"+"添加二分级"+"</option>");
			    	$.each(date,function(i,doc){
					$("#sb").append("<option value ="+doc.id+">"+doc.name+"</option>");
			  });}		});}else{
				  $("#sb,#sc").html("<option value ="+0+">"+""+"</option>");
			  }});
		$("#sb").change(function(){
			$("#sc").html("");
			var _sc= $("#sb option:selected").val();
		     if(_sc!=0){
			$.ajax({
		  	  	url:_url,
	    	  	type:"POST",
	    	  	data:{"oper":"level2","tid": 3,"id":_sc},
	    	  	dataType:"JSON",
			    success : function(date) {
			    	 $("#sc").append("<option value ="+0+">"+"添加三分级"+"</option>");
			    	$.each(date,function(i,doc){
					$("#sc").append("<option value ="+doc.id+">"+doc.name+"</option>");
			  });}		});}else{
				  $("#sc").html("<option value ="+0+">"+""+"</option>");
					 
			  }})});
	</script>
</body>

</html>