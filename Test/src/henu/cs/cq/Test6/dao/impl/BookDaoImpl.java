package henu.cs.cq.Test6.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import henu.cs.cq.Test5.domain.Book;
import henu.cs.cq.Test6.dao.BookDao;
import henu.cs.cq.utils.DBCon;
import henu.cs.cq.utils.JDBCUtil;

public class BookDaoImpl implements BookDao {
	private static Connection connection;
	private static Statement statement;
	private static PreparedStatement preparedStatement;
	private static ResultSet resultSet;
	private static List<Book> list = new ArrayList<>();

	@Override
	public List<Book> selectAll() {
		try {
			connection = DBCon.getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery("select * from book_details");
			list.clear();
			while (resultSet.next()) {
				Book book = new Book();
				book.setId(resultSet.getInt("id"));
				book.setName(resultSet.getString("name"));
				book.setPrice(resultSet.getFloat("price"));
				book.setAuthor(resultSet.getString("author"));
				book.setPress(resultSet.getString("press"));
				book.setPages(resultSet.getInt("pages"));
				book.setBookCount(resultSet.getInt("book_count"));
				list.add(book);
			}
			JDBCUtil.close(resultSet, statement, connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Integer insertBook(Book book) {
		try {
			connection = DBCon.getConnection();
			preparedStatement = connection.prepareStatement("insert into book_details(name,price,author,press,pages,book_count) values(?,?,?,?,?,?)");
			preparedStatement.setString(1, book.getName());
			preparedStatement.setFloat(2, book.getPrice());
			preparedStatement.setString(3, book.getAuthor());
			preparedStatement.setString(4, book.getPress());
			preparedStatement.setInt(5, book.getPages());
			preparedStatement.setInt(6, book.getBookCount());
			int result = preparedStatement.executeUpdate();
			JDBCUtil.close(preparedStatement, connection);
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Integer deleteBookById(int id) {
		try {
			connection = DBCon.getConnection();
			preparedStatement = connection.prepareStatement("delete from book_details where id=?");
			preparedStatement.setInt(1, id);
			int result = preparedStatement.executeUpdate();
			JDBCUtil.close(preparedStatement, connection);
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Integer updateBookCountById(int id,int count) {
		try {
			connection = DBCon.getConnection();
			preparedStatement = connection.prepareStatement("update book_details set book_count=? where id=?");
			preparedStatement.setInt(1, count);
			preparedStatement.setInt(2, id);
			int result = preparedStatement.executeUpdate();
			JDBCUtil.close(preparedStatement, connection);
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Integer updateBookPagesById(int id, int count) {
		try {
			connection = DBCon.getConnection();
			preparedStatement = connection.prepareStatement("update book_details set pages=? where id=?");
			preparedStatement.setInt(1, count);
			preparedStatement.setInt(2, id);
			int result = preparedStatement.executeUpdate();
			JDBCUtil.close(preparedStatement, connection);
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
}
