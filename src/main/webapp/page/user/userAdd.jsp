<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../layui/css/layui.css" media="all" />
<link rel="stylesheet" href="../../css/public.css" media="all" />
</head>
<body class="childrenBody">
	<form class="layui-form" style="width: 80%;">
		<div class="layui-form-item layui-row layui-col-xs12">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input userName"
					lay-verify="required" placeholder="请输入登录名">
			</div>
		</div>
		<div class="layui-form-item layui-row layui-col-xs12">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input userPwd" lay-verify="required"
					placeholder="请输入密码">
			</div>
		</div>
		</div>
		<div class="layui-form-item layui-row layui-col-xs12">
			<label class="layui-form-label">头像</label>
			<button type="button" class="layui-btn" name="srcimge" id="test8">选择文件</button>
			<input type="hidden" name="head" value=""> <span id=nameimg></span>
		</div>
		<div class="layui-form-item layui-row layui-col-xs12">
			<div class="layui-input-block">
				<input type="button" id="tod" value="立即提交" class="layui-btn " /> <input
					type="reset" id="tob" value="重置" class="layui-btn " />
			</div>
		</div>
	</form>
	<script type="text/javascript" src="../../layui/layui.js"></script>
	<script type="text/javascript" src="../../js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		/*正则表达式*/
		// 用户名验证
	
		function userclock() {
			var userName = $(".userName");
			var userNameText = userName.val();
			if (userNameText == "") {
				layer.tips('名称', ".userName");
				return false;
			} else {
				return true;
			}
		}
		function userpwd() {
			var userName = $(".userPwd");
			var userNameText = userName.val();
			if (userNameText == "") {
				layer.tips('密码', ".userPwd");
				return false;
			} else {
				return true;
			}
		}
		$(function() {
			// 用户名验证调用
			$(".userName").blur(function() {
				return userclock();
			});
			$(".userPwd").blur(function() {
				return userpwd();
			});
		})
	</script>
	<script type="text/javascript">
	var _url = "${pageContext.request.contextPath }/UserControServlet";
		$("#tod").click(function() {
			if (userclock() === true && userpwd() === true) {
				$.ajax({
					url : _url,
					type : "POST",
					data : {
						"oper" : "addinfo",
						 "name" : $(".userName").val(),
						"pwd" : $(".userPwd").val(),
						"head" : $("[name=head]").val() 
					},
					dataType : "text",
					success : function(data) {
						if (data == "true") {
							layer.msg('添加成功');
							window.parent.location.reload();
							var index=parent.layer.getFrameIndex(window.name);
							parent.layer.close(index);
						}else{
							layer.msg('系统已经存在此用户 请修改');
						}
					}
				})
			} else {
				layer.msg('添加失败，你有不符合规定的选项框');
			}
			;
		});

		layui.use('upload', function() {
			var _file = "${pageContext.request.contextPath}/fileservlet";
			var $ = layui.jquery, upload = layui.upload;
			upload.render({
				elem : '#test8',
				url : _file,
				auto : false, //选择文件后不自动上传
				bindAction : '#tod', //指向一个按钮触发上传
				choose : function(obj) {
					obj.preview(function(index, file, result) {
						console.log(file.name);
						var s = file.name;
						if (file.name.length > 10) {
							s = file.name.substring(0, 6) + "...";
						}
						$("#nameimg").html(s);
						$("[name=head]").val(file.name);
					});
				}
			});
		});
	</script>

</body>
</html>