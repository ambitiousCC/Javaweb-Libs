<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书页面</title>
<style type="text/css">
.from-tr-td-input input {
	width: 2500px;
}
</style>
</head>
<body>
	<form action="<%=request.getContextPath()%>/test5/insertBook" method="post">
		<table align="center" class="book-table">
			<caption>图书信息编辑</caption>
			<tr>
				<td>图书名称：</td>
				<td class="from-tr-td-input">
					<input type="text" name="name" required
						value="Tomcat与Java Web开发技术详解（第2版）" />
				</td>
			</tr>
			<tr>
				<td>图书价格：</td>
				<td class="from-tr-td-input">
					<input type="number" min="0" name="price" required value="80" />
				</td>
			</tr>
			<tr>
				<td>图书作者：</td>
				<td class="from-tr-td-input">
					<input type="text" name="author" required value="孙卫琴" />
				</td>
			</tr>
			<tr>
				<td>出版社：</td>
				<td class="from-tr-td-input">
					<input type="text" name="press" required value="电子工业出版社" />
				</td>
			</tr>
			<tr>
				<td>页面数：</td>
				<td class="from-tr-td-input">
					<input type="number" min="0" name="pages" value="734" />
				</td>
			</tr>
			<tr>
				<td>存放数量：</td>
				<td class="from-tr-td-input">
					<input type="number" min="0" name="bookCount" required
						value="10" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="提交" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>