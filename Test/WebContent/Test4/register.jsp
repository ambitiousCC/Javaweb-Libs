<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/register" method="post">
		<table align="center">
			<%
				if (session.getAttribute("registerFailure") == null) {
			%>
			<caption>你好，请注册</caption>
			<%
				} else {
			%>
			<caption>注册失败，请重新注册</caption>
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
					<input type="submit" value="注册" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>