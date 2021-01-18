package henu.cs.cq.Test6.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.cs.cq.Test5.domain.Book; //使用实验五的book对象
import henu.cs.cq.Test6.service.BookService;
import henu.cs.cq.Test6.service.impl.BookServiceImpl;

@SuppressWarnings("serial")
@WebServlet("/test6/insertBook")
public class InsertServlet extends HttpServlet {
	private BookService bookServiceImpl=new BookServiceImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Book book=new Book();
		book.setName(req.getParameter("name"));
		book.setPrice(Float.parseFloat(req.getParameter("price")));
		book.setAuthor(req.getParameter("author"));
		book.setPress(req.getParameter("press"));
		book.setPages(Integer.parseInt(req.getParameter("pages")));
		book.setBookCount(Integer.parseInt(req.getParameter("bookCount")));
		Integer result = bookServiceImpl.insertBook(book);
		if (result>0) {
			req.setAttribute("content", "操作成功");
		}else {
			req.setAttribute("content", "操作失败");
		}
		req.getRequestDispatcher("/Test6/tips.jsp").forward(req, resp);
	}
}
