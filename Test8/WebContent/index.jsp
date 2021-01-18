<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>用户登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	// 用户名合法性的判断
	$(function() {
		$("#username").blur(function() {
			var phone = $("#username").val();
			var len = $("#username").val().length;
			if (len == 0 || phone == null) {
				$("#userNameError").html("用户名不能为空！");
				$("#loginFrm").attr("onsubmit", "return false");
			}
		});

		$("#pwd").blur(function() {
			var len = $("#pwd").val().length;
			if (len == 0) {
				$("#pwdError").html("密码不能为空！");
				$("#loginFrm").attr("onsubmit", "return false");
			}
		});
	});
	function checkSubmit() {
		f = document.form1;
		if (f.username.value == "") {
			f.username.focus();
			return false;
		}
		if ((f.password.value != "")) {
			f.password.focus();
			return false;
		}
		f.submit();
	}
</script>
<body>
	<div class="container">
		<h1>登录</h1>
		<form name="form1" id="loginFrm" action="userLogin.action" method="post" onsubmit="">
			<div class="form-group">
				用户名:<input type="text" name="username" id="username" class="form-control">
				<span style="color: red;" id="userNameError"></span>
			</div>
			<div class="form-group">
				密码:<input type="password" name="password" id="pwd" class="form-control">
				<span style="color: red;" id="pwdError"></span>
			</div>
			<button type="submit" class="submit_button btn btn-info" onclick="checkSubmit()">登录</button>
		</form>
		<h2>
			<a href="pages/register.jsp">注册</a>
		</h2>
	</div>
</body>
</html>
