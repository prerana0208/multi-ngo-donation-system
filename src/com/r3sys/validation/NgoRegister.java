package com.r3sys.validation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.r3sys.db.DbConnection;

public class NgoRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NgoRegister() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String city = request.getParameter("city");
		String reg_no = request.getParameter("reg_no");
		String description = request.getParameter("description");
		String password = request.getParameter("password");

		Connection con = null;
		PreparedStatement ps = null;

		try {
			System.out.println("NGO Register: " + name + " | " + email);
			
			con = DbConnection.getConnection();
			System.out.println("DB Connection successful");

			ps = con.prepareStatement(
				"INSERT INTO ngo(name,email,mobile,city,reg_no,description,password,status) VALUES (?,?,?,?,?,?,?,?)"
			);

			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, mobile);
			ps.setString(4, city);
			ps.setString(5, reg_no);
			ps.setString(6, description);
			ps.setString(7, password);
			ps.setString(8, "pending");

			int rows = ps.executeUpdate();
			System.out.println("Rows inserted: " + rows);
			System.out.println("Successfully Registered!!");

			// FIXED SUCCESS REDIRECT
			response.sendRedirect("index.jsp?success=" + name);
			return;
			
		} catch (Exception e) {
			System.out.println("ERROR: " + e.getMessage());
			e.printStackTrace();
			response.sendRedirect("ngoregister.jsp?error=1");
		} finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
				System.out.println("Resources closed");
			} catch(Exception e) {
				System.out.println("Close error: " + e.getMessage());
			}
		}
	}
}
