package henu.cs.cq.Test4.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.cs.cq.utils.JDBCUtil;

//方式一：注解
@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Connection connection = JDBCUtil.getConnection();
		String sql = "select * from user where username=? and password=?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				System.out.println("登录成功");
				request.getSession().removeAttribute("loginFailure");
				request.getSession().setAttribute("username", username);
				request.getRequestDispatcher("Test4/main.jsp").forward(request, response);
			} else {
				System.out.println("登录失败");
				request.getSession().setAttribute("loginFailure", true);
				request.getRequestDispatcher("Test4/index.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
