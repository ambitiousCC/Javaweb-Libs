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
@WebServlet("/test6/show")
public class ShowServlet extends HttpServlet {
	private BookService bookServiceImpl = new BookServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("books", bookServiceImpl.selectAllBook());
		req.getRequestDispatcher("/Test6/show.jsp").forward(req, resp);
	}
}
