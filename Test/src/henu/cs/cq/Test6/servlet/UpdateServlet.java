package henu.cs.cq.Test6.servlet;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import henu.cs.cq.Test6.service.BookService;
import henu.cs.cq.Test6.service.impl.BookServiceImpl;

@SuppressWarnings("serial")
@WebServlet("/update/bookCount")
public class UpdateServlet extends HttpServlet {
	private BookService bookServiceImpl=new BookServiceImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		int count=Integer.parseInt(req.getParameter("count"));
		OutputStream outputStream = resp.getOutputStream();
		if(bookServiceImpl.updateBookCountById(id, count)>0)
			outputStream.write("true".getBytes());
		else
			outputStream.write("false".getBytes());
	}
}
