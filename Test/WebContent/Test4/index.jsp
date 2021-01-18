<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/login" method="post">
		<table align="center">
			<%
				if (session.getAttribute("loginFailure") == null) {
			%>
			<caption>你好，请登录</caption>
			<%
				} else {
			%>
			<caption>登录失败，请检查用户名和密码重新登录</caption>
			<%
				}
			%>
			<tr>
				<td>用户：</td>
				<td>
					<input type="text" name="username" />
				</td>
			</tr>
			<tr>
				<td>密码：</td>
				<td>
					<input type="password" name="password" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="登录" />
				</td>
			</tr>
			<tr>
				<td colspan="2">没有账号？<a href="register.jsp">注册</a>一个吧</td>
			</tr>
		</table>
	</form>
</body>
</html>