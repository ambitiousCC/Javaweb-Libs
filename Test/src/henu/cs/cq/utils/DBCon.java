package henu.cs.cq.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCon {
	private static DataSource dataSource;
	static {
		try {
			Context context = new InitialContext();
			context = (Context) context.lookup("java:comp/env"); //配置文件在META-INF中
			dataSource = (DataSource) context.lookup("DBPool");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}

	public static Connection getConnection() {
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
}
