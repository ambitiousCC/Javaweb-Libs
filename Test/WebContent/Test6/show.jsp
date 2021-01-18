<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书信息</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		//更新图书数目
		$("button[name='updateCount']").click(function(){
			//操作节点
			var update=$(this).parent().children()[0]
			var inputCount=$(this).parent().parent().children()[5]
			//返回数据
			$.getJSON("/Test/update/bookCount", {
				id : $(this).prop("id"),
				count : update.value
			}, function(res) {
				if(res){
					inputCount.innerHTML=update.value
					update.value=""
				}
				else
					alert("操作失败")
			}); 
		})
	})
</script>
</head>
<body>
	<center><h1>图书信息</h1></center>
	<table border="1" align="center">
		<tr>
			<th>图书ID</th>
			<th>图书名称</th>
			<th>图书价格</th>
			<th>图书作者</th>
			<th>出版社</th>
			<th>页面数</th>
			<th>存放数量</th>
			<th>修改存放数量</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${books}" var="book">
			<tr>
				<td>${book.id}</td>
				<td>${book.name}</td>
				<td>${book.price}</td>
				<td>${book.author}</td>
				<td>${book.press}</td>
				<td>${book.pages}</td>
				<td>${book.bookCount}</td>
				<td>
					<input type="number" size="1"/>
					<button name="updateCount" id="${book.id}">修改</button>
				</td>
				<td>
					<button>
						<a href="<%=request.getContextPath() %>/deleteBook?id=${book.id}">删除</a>
					</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>