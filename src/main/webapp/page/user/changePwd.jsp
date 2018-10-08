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
	<form class="layui-form layui-row " id="frompwd"
		action="${pageContext.request.contextPath }/UserControServlet?oper=upIpwd"
		method="post">
		<div class="layui-col-xs12 layui-col-sm6 layui-col-md6">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" value="${uid.name}" disabled 
					 class="layui-input">
						 <input type="hidden" value="${uid.name}"  name="namee" >
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">旧密码</label>
				<div class="layui-input-block">
					<input type="password" value="" placeholder="请输入旧密码"
						class="layui-input pwd jpwd">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">新密码大于位6数</label>
				<div class="layui-input-block">
					<input type="password" value="" placeholder="请输入新密码"
						lay-verify="required|newPwd" id="oldPwd" name="pwd"
						class="layui-input pwd xpwd">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">确认密码</label>
				<div class="layui-input-block">
					<input type="password" value="" placeholder="请确认密码"
						lay-verify="required|confirmPwd" class="layui-input pwd cpwd">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<input type="button" class="layui-btn" value="	立即修改" id="go">
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="../../layui/layui.js"></script>
	<script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"> 
	    var go = document.getElementById('go');
	    var xpwd=$(".xpwd").val();
	    go.onclick = function(){
	        if($(".jpwd").val()==${uid.pwd}&&userclock()&&xpwdcpwd()){
	            //验证通过，提交表单数据
	       document.getElementById('frompwd').submit();
	        }else{
	        	alert('输入不符合规则');
	        }
	    }		
		function userclock() {
			if ($(".xpwd").val().length < 4) {
	        	alert('密码小于4位数');
				return false;			
				} else {
				return true;
			}
		}
		function xpwdcpwd() {
			if ($(".xpwd").val()!=$(".cpwd").val()) {
		       	alert('密码不一致');
				return false;			
				} else {
				return true;
			}
		}
	</script>
</body>

</html>