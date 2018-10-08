/*正则表达式*/
var bl=false;
// 用户名验证
$("#boolo").val("false");
function userclock() {
	var userName = $("[name=productName]");
	var userNameText = userName.val();
	if (userNameText == "") {
		layer.tips('货品名称不能为空', "[name=productName]");
		$("#boolo").val("false");
	} else {
		$("#boolo").val("true");
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
function ch() {
	$("#sa").change(function() {
		var sa = $("#sa").val();
		if (sa != 0) {
			return true;
		} else {
			return false;
		}
	})
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
	$("#sa").blur(function() {
		return ch();
	});
	// 全部成功跳转
/*    $("##tod"). click(function () {
        var flag = true;
        if (userclock&&nameclock&&price){
        	$("#boolo").val("false");
        	alert("d");
        }else{
        	$("#boolo").val("true");
        }
    });*/
})
