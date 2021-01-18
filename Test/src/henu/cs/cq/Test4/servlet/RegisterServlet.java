package henu.cs.cq.Test4.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.cs.cq.utils.JDBCUtil;

//方式二：直接配置web.xml文件
@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取前端数据
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Connection connection = JDBCUtil.getConnection();
		String sql = "insert into user values(default,?,?)";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			if (ps.executeUpdate() > 0) {
				System.out.println("注册成功");
				request.getSession().removeAttribute("registerFailure");
				request.getSession().removeAttribute("loginFailure");
				request.getRequestDispatcher("Test4/index.jsp").forward(request, response);
			} else {
				System.out.println("注册失败");
				request.getSession().setAttribute("registerFailure", true);
				request.getRequestDispatcher("Test4/register.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
