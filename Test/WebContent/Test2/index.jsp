<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页</title>
</head>
<body>
	<form action="verify.jsp" method="post">
		<table align="center">
			<caption>你好，请登录</caption>
			<tr>
				<td>用户：</td>
				<td>
					<input type="text" name="username" placeholder="请输入用户名"/>
				</td>
			</tr>
			<tr>
				<td>密码：</td>
				<td>
					<input type="password" name="password" placeholder="请输入密码" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="提交查询" />
				</td>
			</tr>
		</table>
	</form>
	<br>
	<table align="center">
		<tr>
			<th>测试用户名</th>
			<th>测试密码</th>
		</tr>
		<tr>
			<td>root</td>
			<td>123456</td>
		</tr>
		<tr>
			<td>cuiqin</td>
			<td>cuiqin233</td>
		</tr>
	</table>
</body>
</html>