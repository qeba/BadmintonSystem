package net.codejava.javaee.badminton;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class sqlQuery {
	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;
	
	public sqlQuery(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		this.jdbcURL = jdbcURL;
		this.jdbcUsername = jdbcUsername;
		this.jdbcPassword = jdbcPassword;
	}
	
	protected void connect() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection(
										jdbcURL, jdbcUsername, jdbcPassword);
		}
	}
	
	protected void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}
	
	public boolean insertBook(Book book) throws SQLException {
		String sql = "INSERT INTO book (name, court, price, hour) VALUES (?, ?, ?, ?)";
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, book.getName());
		statement.setString(2, book.getCourt());
		statement.setFloat(3, book.getPrice());
		statement.setInt(4, book.getHour());
		
		
		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowInserted;
	}
	
	public List<Book> listAllBooks() throws SQLException {
		List<Book> listBook = new ArrayList<>();
		
		String sql = "SELECT * FROM book";
		
		connect();
		
		Statement statement = jdbcConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);
		
		while (resultSet.next()) {
			int id = resultSet.getInt("book_id");
			String name = resultSet.getString("name");
			String court = resultSet.getString("court");
			float price = resultSet.getFloat("price");
			int hour = resultSet.getInt("hour");
			
			
			Book book = new Book(id, name, court, price,hour);
			listBook.add(book);
		}
		
		resultSet.close();
		statement.close();
		
		disconnect();
		
		return listBook;
	}
	
	public boolean deleteBook(Book book) throws SQLException {
		String sql = "DELETE FROM book where book_id = ?";
		
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, book.getId());
		
		boolean rowDeleted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowDeleted;		
	}
	
	public boolean updateBook(Book book) throws SQLException {
		String sql = "UPDATE book SET name = ?, court = ?, price = ?, hour = ?";
		sql += " WHERE book_id = ?";
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, book.getName());
		statement.setString(2, book.getCourt());
		statement.setFloat(3, book.getPrice());
		statement.setInt(4, book.getHour());
		statement.setInt(5, book.getId());
		
		boolean rowUpdated = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowUpdated;		
	}
	
	public Book getBook(int id) throws SQLException {
		Book book = null;
		String sql = "SELECT * FROM book WHERE book_id = ?";
		
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, id);
		
		ResultSet resultSet = statement.executeQuery();
		
		if (resultSet.next()) {
			String name = resultSet.getString("name");
			String court = resultSet.getString("court");
			float price = resultSet.getFloat("price");
			int hour = resultSet.getInt("hour");

			
			book = new Book(id, name, court, price,hour);
		}
		
		resultSet.close();
		statement.close();
		
		return book;
	}
}
