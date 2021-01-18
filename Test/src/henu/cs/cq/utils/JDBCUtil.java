package henu.cs.cq.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
	
	private static String DRIVER = "com.mysql.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost:3306/dbbook?useUnicode=true&characterEncoding=utf8&useSSL=false";
	private static String USERNAME = "root";
	private static String PASSWORD = "root";
	static {
		try {
			Class.forName(DRIVER);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	public static void close(AutoCloseable... items) {
		for (AutoCloseable item : items) {
			try {
				item.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
