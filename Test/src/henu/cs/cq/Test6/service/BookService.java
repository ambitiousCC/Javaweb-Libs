package henu.cs.cq.Test6.service;

import java.util.List;

import henu.cs.cq.Test5.domain.Book;

public interface BookService {
	List<Book> selectAllBook();

	Integer insertBook(Book book);
	
	Integer deleteBookById(int id);
	
	Integer updateBookCountById(int id,int count);

	Integer updateBookPagesById(int id,int count);
}
