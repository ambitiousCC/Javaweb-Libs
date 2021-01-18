<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书显示页面</title>
</head>
<body>
	<jsp:useBean id="book" class="henu.cs.cq.Test5.domain.Book"
		scope="request"></jsp:useBean>
	<%-- <jsp:setProperty property="*" name="book"/> --%>
	<table align="center">
		<caption>图书信息显示</caption>
		<tr>
			<td>图书名称：</td>
			<td>《<jsp:getProperty property="name" name="book" />》</td>
		</tr>
		<tr>
			<td>图书价格：</td>
			<td><jsp:getProperty property="price" name="book" />￥</td>
		</tr>
		<tr>
			<td>图书作者：</td>
			<td><jsp:getProperty property="author" name="book" /></td>
		</tr>
		<tr>
			<td>出版社：</td>
			<td><jsp:getProperty property="press" name="book" /></td>
		</tr>
		<tr>
			<td>总页数：</td>
			<td><jsp:getProperty property="pages" name="book" />页</td>
		</tr>
		<tr>
			<td>存放数量：</td>
			<td><jsp:getProperty property="bookCount" name="book" />本</td>
		</tr>
	</table>
</body>
</html>