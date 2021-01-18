package henu.cs.cq.Test6.service.impl;

import java.util.List;

import henu.cs.cq.Test5.domain.Book;
import henu.cs.cq.Test6.dao.BookDao;
import henu.cs.cq.Test6.dao.impl.BookDaoImpl;
import henu.cs.cq.Test6.service.BookService;

public class BookServiceImpl implements BookService {
	private BookDao bookDao=new BookDaoImpl();
	@Override
	public List<Book> selectAllBook() {
		return bookDao.selectAll();
	}
	@Override
	public Integer insertBook(Book book) {
		return bookDao.insertBook(book);
	}
	@Override
	public Integer deleteBookById(int id) {
		return bookDao.deleteBookById(id);
	}
	@Override
	public Integer updateBookCountById(int id, int count) {
		return bookDao.updateBookCountById(id, count);
	}
	@Override
	public Integer updateBookPagesById(int id, int count) {
		return bookDao.updateBookPagesById(id, count);
	}
}
