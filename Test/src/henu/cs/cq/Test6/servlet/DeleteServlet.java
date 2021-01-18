package henu.cs.cq.Test6.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.cs.cq.Test6.service.BookService;
import henu.cs.cq.Test6.service.impl.BookServiceImpl;

@SuppressWarnings("serial")
@WebServlet("/deleteBook")
public class DeleteServlet extends HttpServlet {
	private BookService bookServiceImpl=new BookServiceImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		if (bookServiceImpl.deleteBookById(id)>0) {
			req.getRequestDispatcher("test6/show").forward(req, resp);
		}else {
			req.setAttribute("content", "操作失败");
			req.getRequestDispatcher("/Test6/tips.jsp").forward(req, resp);
		}
	}
}
