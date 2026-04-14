<%@ page import="java.sql.*" %>
<%@ page import="com.r3sys.db.DbConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    if(session.getAttribute("admin") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Approved NGOs - Admin Panel</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.7)), 
                        url('images/ngo2.jpg') center/cover fixed;
            color: #fff;
            min-height: 100vh;
        }

        /* Header */
        .header {
            background: rgba(0,0,0,0.4);
            backdrop-filter: blur(15px);
            padding: 25px 30px;
            border-bottom: 3px solid #28a745;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.3);
        }

        .header h2 {
            font-size: 2rem;
            font-weight: 700;
            color: #28a745;
            text-shadow: 0 2px 10px rgba(40,167,69,0.5);
        }

        .back-link a {
            color: #ffd700;
            text-decoration: none;
            font-weight: 600;
            padding: 12px 25px;
            border: 2px solid rgba(255,215,0,0.4);
            border-radius: 25px;
            background: rgba(255,215,0,0.1);
            backdrop-filter: blur(10px);
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .back-link a:hover {
            background: #ffd700;
            color: #1a1a2e;
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(255,215,0,0.4);
        }

        .container {
            max-width: 1400px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .table-container {
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(20px);
            border-radius: 25px;
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.2);
            box-shadow: 0 15px 40px rgba(0,0,0,0.4);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: linear-gradient(135deg, rgba(40,167,69,0.2), rgba(40,167,69,0.1));
            color: #fff;
            padding: 20px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 1rem;
            border-bottom: 2px solid rgba(40,167,69,0.4);
            text-shadow: 0 1px 3px rgba(0,0,0,0.5);
        }

        td {
            padding: 20px 15px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            color: rgba(255,255,255,0.95);
        }

        tr:hover {
            background: rgba(40,167,69,0.1);
        }

        tr:nth-child(even) {
            background: rgba(255,255,255,0.05);
        }

        .status-approved {
            background: rgba(40,167,69,0.8);
            color: white;
            padding: 10px 18px;
            border-radius: 25px;
            font-size: 0.9rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: inline-block;
            box-shadow: 0 4px 15px rgba(40,167,69,0.3);
        }

        .no-data {
            text-align: center;
            padding: 80px 40px;
            color: rgba(255,255,255,0.7);
            font-size: 1.3rem;
            font-style: italic;
        }

        .no-data i {
            font-size: 5rem;
            color: #28a745;
            margin-bottom: 25px;
            opacity: 0.7;
        }

        .back-btn {
            display: inline-block;
            background: linear-gradient(45deg, #ffd700, #ffed4a);
            color: #1a1a2e;
            padding: 15px 35px;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 700;
            font-size: 1.1rem;
            margin-top: 40px;
            transition: all 0.3s;
            box-shadow: 0 8px 25px rgba(255,215,0,0.4);
        }

        .back-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(255,215,0,0.6);
        }

        /* Mobile Responsive Table */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 20px;
                padding: 20px;
                text-align: center;
            }
            
            table, thead, tbody, th, td, tr {
                display: block;
            }
            
            thead tr {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
            
            tr {
                border: 1px solid rgba(255,255,255,0.2);
                margin-bottom: 20px;
                border-radius: 15px;
                padding: 25px;
                background: rgba(255,255,255,0.08);
            }
            
            td {
                border: none;
                position: relative;
                padding-left: 50%;
                padding-top: 15px;
                padding-bottom: 15px;
            }
            
            td:before {
                content: attr(data-label) ": ";
                position: absolute;
                left: 15px;
                width: 45%;
                font-weight: 600;
                color: #28a745;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h2><i class="fas fa-check-circle"></i> Approved NGO List</h2>
        <div class="back-link">
            <a href="admindashboard.jsp">
                <i class="fas fa-arrow-left"></i>
                Back to Dashboard
            </a>
        </div>
    </div>
    
    <div class="container">
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>NGO ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>City</th>
                        <th>Registration No</th>
                        <th>Description</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <%
                boolean hasData = false;
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try{
                    con = DbConnection.getConnection();
                    ps = con.prepareStatement("SELECT * FROM ngo WHERE status='approved'");
                    rs = ps.executeQuery();

                    while(rs.next()){
                        hasData = true;
                %>
                    <tr>
                        <td data-label="NGO ID"><%= rs.getInt("ngo_id") %></td>
                        <td data-label="Name"><%= rs.getString("name") %></td>
                        <td data-label="Email"><%= rs.getString("email") %></td>
                        <td data-label="Mobile"><%= rs.getString("mobile") %></td>
                        <td data-label="City"><%= rs.getString("city") %></td>
                        <td data-label="Registration No"><%= rs.getString("reg_no") %></td>
                        <td data-label="Description"><%= rs.getString("description") %></td>
                        <td data-label="Status"><span class="status-approved">APPROVED</span></td>
                    </tr>
                <%
                    }
                } catch(Exception e){
                    out.println("Error: " + e.getMessage());
                } finally {
                    try {
                        if(rs != null) rs.close();
                        if(ps != null) ps.close();
                        if(con != null) con.close();
                    } catch(Exception e) {
                        e.printStackTrace();
                    }
                }
                
                if(!hasData) {
                %>
                    <tr>
                        <td colspan="8" class="no-data">
                            <i class="fas fa-check-circle"></i>
                            No approved NGOs found
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
        
        <div style="text-align: center; margin-top: 40px;">
            <a href="admindashboard.jsp" class="back-btn">
                <i class="fas fa-arrow-left"></i> Back to Admin Dashboard
            </a>
        </div>
    </div>
</body>
</html>
