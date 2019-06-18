package net.codejava.javaee.badminton;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private sqlQuery bookingSQL;

	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

		bookingSQL = new sqlQuery(jdbcURL, jdbcUsername, jdbcPassword);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/addbooking":
				addbooking(request, response);
				break;
			case "/insert":
				insertBook(request, response);
				break;
			case "/delete":
				deleteBook(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateBook(request, response);
				break;	
			case "/list":
				listBook(request, response);
				break;
				
			default:
				
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	
	private void addbooking(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			response.sendRedirect("addbooking.jsp");
	}

	private void listBook(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Book> listBook = bookingSQL.listAllBooks();
		request.setAttribute("listBook", listBook);
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookList.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookForm.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Book existingBook = bookingSQL.getBook(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookForm.jsp");
		request.setAttribute("book", existingBook);
		dispatcher.forward(request, response);

	}

	private void insertBook(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String name = request.getParameter("name");
		String court = request.getParameter("court");
		float price = Float.parseFloat(request.getParameter("price"));
		int hour = Integer.parseInt(request.getParameter("hour"));
		
		Book newBook = new Book(name, court, price,hour);
		bookingSQL.insertBook(newBook);
		response.sendRedirect("list");
	}

	private void updateBook(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String court = request.getParameter("court");
		float price = Float.parseFloat(request.getParameter("price"));
		int hour = Integer.parseInt(request.getParameter("hour"));
	
						

		Book book = new Book(id, name, court, price,hour);
		bookingSQL.updateBook(book);
		response.sendRedirect("list");
	}

	private void deleteBook(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		Book book = new Book(id);
		bookingSQL.deleteBook(book);
		response.sendRedirect("list");

	}

}
