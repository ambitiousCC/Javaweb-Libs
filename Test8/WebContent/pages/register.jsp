<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>用户注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	// 用户名合法性的判断
	$(function() {
		$("#username").blur(function() {
			var username = $("#username").val();
			var len = $("#username").val().length;
			$.getJSON("userJudge.action", {
				"username" : username
			}, function(data) {
				if (data == false) {
					alert("用户名已注册，青重新输入！！");
					$("#userNameError").html("用户名已注册！");
					$("#regFrm").attr("onsubmit", "return false");

				} else if (len == 0 || username == null) {
					$("#userNameError").html("用户名不能为空！");
					$("#regFrm").attr("onsubmit", "return false");
				} else if (!checkContactNumber()) {
					$("#userNameError").html("不符合用户名格式！");
					$("#regFrm").attr("onsubmit", "return false");
				} else {
					$("#userNameError").html("恭喜！用户名可用！")
					$("#regFrm").attr("onsubmit", "return true");
				}
			});
		});
	});
	// 密码合法性的判断
	$(function() {
		$("#pwd").blur(function() {
			var len = $("#pwd").val().length;
			if (len == 0) {
				$("#pwdError").html("密码不能为空！");
				$("#regFrm").attr("onsubmit", "return false");
			}
			if (len > 0 && len < 6) {
				$("#pwdError").html("密码位数最少为6位！");
				$("#regFrm").attr("onsubmit", "return false");
			}
			if (len >= 6) {
				$("#pwdError").html("密码格式正确！");
				$("#regFrm").attr("onsubmit", "return true");
			}
		})
	})
	// 确认两次密码
	$(function() {
		$("#conpwd").blur(function() {
			var oldpwd = $("#pwd").val();
			var conpwd = $("#conpwd").val();
			var number = $("#conpwd").val().length;
			if (number == 0) {
				$("#pwdError").html("密码不能为空！");
				$("#regFrm").attr("onsubmit", "return false");
			} else if (oldpwd != conpwd) {
				$("#conpwdError").html("两次密码不一致！");
				$("#regFrm").attr("onsubmit", "return false");
			} else {
				$("#conpwdError").html("密码符合！");
				$("#regFrm").attr("onsubmit", "return true");
			}
		})
	})
	function check() {
		f = document.reg;
		if (f.username.value == "") {
			f.username.focus();
			return false;
		}
		if ((f.password.value == "")) {
			f.password.focus();
			return false;
		}
		if ((f.password2.value == "")) {
			f.password2.focus();
			return false;
		}
		f.submit();
	}
	function checkContactNumber() {
		var mobile = $.trim($("#username").val());
		var isMobile = /^\w\w{7,11}$/;
		if (!isMobile.exec(mobile) && mobile.length != 11) {
			$("#username").focus();
			return false;
		}
		return true;
	}
</script>
<body>
	<div class="container">
		<h1>用户注册</h1>
		<form name="reg" id="regFrm" action="userReg.action" method="post" onsubmit="">
			<div class="form-group">
				用户名：<input type="text" name="username" id="username" class="form-control">
				<span style="color: red;" id="userNameError"></span> 
			</div>
			<div class="form-group">
				密码：<input type="password" name="password" id="pwd" class="form-control"> 
				<span style="color: red;" id="pwdError"></span> 
			</div>
			<div class="form-group">
				确认密码：<input type="password" name="password2" id="conpwd" class="form-control"> 
				<span style="color: red;" id="conpwdError"></span>
			</div>
			<button type="submit" class="submit_button btn btn-warning" onclick="check()">注册</button>
		</form>
	</div>
</body>
</html>
