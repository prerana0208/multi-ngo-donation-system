package com.r3sys.validation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.r3sys.db.DbConnection;

/**
 * Servlet implementation class UserRegister
 */
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");

		Connection con = null;

		try {
			con = DbConnection.getConnection();

			PreparedStatement ps = con.prepareStatement(
				"INSERT INTO user(name, email, mobile, password) VALUES (?,?,?,?)"
			);

			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, mobile);
			ps.setString(4, password);

			int i = ps.executeUpdate();

			if (i > 0) {
				response.sendRedirect("userdashboard.jsp");
			} else {
				response.sendRedirect("user_register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	}


