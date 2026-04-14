package com.r3sys.validation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.r3sys.db.DbConnection;

/**
 * Servlet implementation class DonateServlet
 */
public class DonateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonateServlet() {
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
		 int userId = Integer.parseInt(request.getParameter("userId"));
	        int ngoId = Integer.parseInt(request.getParameter("ngoId"));
	        int amount = Integer.parseInt(request.getParameter("amount"));
	        String paymentMode = request.getParameter("payment_mode");
	        
	        Connection con = null;
	        PreparedStatement ps = null;
	        
	        try {
	            // Database connection
	            con = DbConnection.getConnection();
	            
	            // Insert donation record
	            String sql = "INSERT INTO donation (user_id, ngo_id, amount, payment_mode, donation_date) " +
	                        "VALUES (?, ?, ?, ?, NOW())";
	            ps = con.prepareStatement(sql);
	            ps.setInt(1, userId);
	            ps.setInt(2, ngoId);
	            ps.setInt(3, amount);
	            ps.setString(4, paymentMode);
	            
	            int result = ps.executeUpdate();
	            
	            if(result > 0) {
	                // Success - redirect to success page
	                response.sendRedirect("success.jsp?msg=Donation+successful&amount=" + amount);
	            } else {
	                // Failure
	                response.sendRedirect("donate.jsp?error=Donation+failed");
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("donate.jsp?error=Database+error");
	        } finally {
	            // Close resources
	            try {
	                if(ps != null) ps.close();
	                if(con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}


