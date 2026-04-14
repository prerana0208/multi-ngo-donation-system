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
 * Servlet implementation class Approve
 */
public class Approve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Approve() {
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
		int ngo_id = Integer.parseInt(request.getParameter("ngo_id"));

		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps =
			  con.prepareStatement("UPDATE ngo SET status=? WHERE ngo_id=?");

			ps.setString(1, "approved");
			ps.setInt(2, ngo_id);
			ps.executeUpdate();

			response.sendRedirect("pendingngo.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	}


