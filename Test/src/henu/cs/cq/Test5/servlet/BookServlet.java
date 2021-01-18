package henu.cs.cq.Test5.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.cs.cq.Test5.domain.Book;

@SuppressWarnings("serial")
@WebServlet("/test5/insertBook")
public class BookServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//建立book对象
		Book book = new Book();
		book.setName(req.getParameter("name"));
		book.setPrice(Float.parseFloat(req.getParameter("price")));
		book.setAuthor(req.getParameter("author"));
		book.setPress(req.getParameter("press"));
		book.setPages(Integer.parseInt(req.getParameter("pages")));
		book.setBookCount(Integer.parseInt(req.getParameter("bookCount")));
		
		//存入book,返回
		req.setAttribute("book", book);
		req.getRequestDispatcher("/Test5/show.jsp").forward(req, resp);
	}
}
