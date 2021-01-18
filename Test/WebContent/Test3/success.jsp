<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="henu.cs.cq.utils.JDBCUtil,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册结果页</title>
</head>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Connection connection = JDBCUtil.getConnection();
		String sql = "insert into user values(default,?,?)";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, password);
		if (ps.executeUpdate() > 0) {
	%>
	<center><h1>注册成功，<span class="time"></span>秒后为您跳转到主页面。</h1></center>
	<%
		response.setHeader("refresh", "3;url=index.jsp");
		} else {
	%>
	<cneter><h1>注册失败，<span class="time"></span>秒后为您跳转回注册页。</h1></cneter>
	<%
		response.setHeader("refresh", "3;url=register.jsp");
		}
	%>
<script type="text/javascript">
var i=3;
$(function(){
    after();
});
//自动刷新页面上的时间
function after(){
    $(".time").empty().append(i);
    i=i-1;
    setTimeout(function(){
        after();
    },1000);
}
</script>
</body>
</html>