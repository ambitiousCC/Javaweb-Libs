<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="henu.cs.cq.utils.JDBCUtil,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录校验页面</title>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Connection connection = JDBCUtil.getConnection();
		String sql = "select * from user where username=? and password=?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
	%>
	<center><h1>登录成功，<span class="time"></span>秒后为您跳转到主页面。</h1></center>
	<%
		session.setAttribute("username", request.getParameter("username"));
			response.setHeader("refresh", "3;url=main.jsp");
		} else {
	%>
	<center><h1>登录失败，<span class="time"></span>秒后为您跳转回登录页。</h1></center>
	<%
		response.setHeader("refresh", "3;url=index.jsp");
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