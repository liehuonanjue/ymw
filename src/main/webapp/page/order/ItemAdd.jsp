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
	<form id="formstim"  method="post">
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
						lay-verify="required" placeholder="请输入商品名称"></td>
					<td id="emailId">花生面包</td>
				</tr>
				<tr>
					<td>商品描述</td>
					<td><input type="text" class="layui-input cmsName" name="productDescribe"
						lay-verify="required" placeholder="请输入商品描述"></td>
					<td pc>hsmb</td>
				</tr>
				<tr>
					<td>商品库存</td>
					<td><input type="text" class="layui-input version" name="productRepertory"
						placeholder="请输入当前商品库存"></td>
					<td pc>食物</td>
				</tr>
				<tr>
					<td>商品单价</td>
					<td><input type="text" class="layui-input author" name="productPrice"
						placeholder="请输入商品单价"></td>
					<td pc>15.6</td>
				</tr>
				<tr>
					<td>商品分类</td>
					<td>
				<select name="one" id="sa"  class="luau layui-input masterEmail">
				</select> 
				<select name="two" id="sb" class="luau layui-input masterEmail">
				</select>
				<select name="three" id="sc" class="luau layui-input masterEmail">
				</select>  </select></td>
					<td pc>手机/华为/k10</td>
				</tr>
				<tr>
					<td>上传的文件</td>
					<td>  
  						<button type="button" class="layui-btn" name="srcimge" id="test8">选择文件</button>
  							<input type="hidden" name="uid" value="">
  						
  						<span id=nameimg></span>
       				 </td>
					<td pc>图片.jpg</td>
				</tr>

		
			</tbody>
		</table>
		<div class="magt10 layui-right">
			<div class="layui-input-block">
				<input type="button" id="tod"  value="立即提交" class="layui-btn "/>
			<input type="reset" id="tob"  value="重置" class="layui-btn "/>
				
			</div>
		</div>
	</form>

		<script type="text/javascript" src="../../layui/layui.all.js"></script>
		<script type="text/javascript" src="../../layui/layui.js"></script>
		<script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
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
		
		$(function(){
		var  _url="${pageContext.request.contextPath }/UserInfoServlet";
		$("#tob").click(function(){
			$("#sb,#sc").html("");});

		$("#tod").click(function(){
            if (userclock()===true&&nameclock()===true&&price()===true){
			  $.ajax({
				   url:_url,
				   type:"POST",
				   data:{"oper":"add_product","productName": $("[name=productName]").val(),"productDescribe": $("[name=productDescribe]").val(),
					   "productRepertory": $("[name=productRepertory]").val(),"productPrice": $("[name=productPrice]").val(),
					   "one": $("[name=one]").val(),"two": $("[name=two]").val(),"three": $("[name=three]").val(),"username":$("[name=uid]").val()},
				   dataType:"text",
				   success:function(data){  
					   if(data=="true"){  
						   layui.use('layer', function(){
							   var layer = layui.layer;
							   layer.msg('添加成功');
							 });  
						   $("#tob").trigger("click");
						 }}})
		  } else{
			  layer.msg('添加失败，你有不符合规定的选项框');
				};});
		
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
				    	console.log(file.name);
				    	var s = file.name;
				    	if(file.name.length>10){
				    	  s=file.name.substring(0,10)+"...";
				    	}
				    	$("#nameimg").html(s);
				    	$("[name=uid]").val(file.name);
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