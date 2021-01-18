<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
</head>
<body>
	<center><h1>欢迎，${username}</h1></center>
	<form action="messageBoard.jsp" method="post">
		<table align="center">
			<caption>你好，请留言</caption>
			<tr>
				<td>用户：</td>
				<td>
					<input type="text" name="username" value="${username}" disabled />
				</td>
			</tr>
			<tr>
				<td>留言：</td>
				<td>
					<input type="text" name="message" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="留言" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>