package com.r3sys.validation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.r3sys.db.DbConnection;

/**
 * Servlet implementation class UserLogin
 */
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Connection con = null;

		try {
			con = DbConnection.getConnection();

			PreparedStatement ps = con.prepareStatement(
				"SELECT * FROM user WHERE email=? AND password=?"
			);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				int userId = rs.getInt("user_id");
				String name = rs.getString("name");

				HttpSession session = request.getSession();
				session.setAttribute("userId", userId);
				session.setAttribute("userName", name);

				response.sendRedirect("userdashboard.jsp");
			} else {
				response.sendRedirect("userlogin.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	}


