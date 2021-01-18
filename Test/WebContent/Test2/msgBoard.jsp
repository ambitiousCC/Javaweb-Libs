<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>留言板</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String message = session.getAttribute("username") + "@" + request.getRemoteHost() + "说：";
	message += request.getParameter("message");
	Object messages = application.getAttribute("messages");
	List<String> list = null;
	if (messages != null) {
		list = (ArrayList<String>) messages;
		list.add(message);
		application.setAttribute("messages", list);
	} else {
		list = new ArrayList<>();
		list.add(message);
		application.setAttribute("messages", list);
	}
%>
<body>
	<table align="center">
		<caption>留言板</caption>
		<%
			for (String temp : list) {
		%>
		<tr>
			<td><%=temp%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>