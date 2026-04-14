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
    <title>Pending NGOs - Admin Panel</title>
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
            border-bottom: 3px solid #ffd700;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.3);
        }

        .header h2 {
            font-size: 2rem;
            font-weight: 700;
            color: #ffd700;
            text-shadow: 0 2px 10px rgba(255,215,0,0.5);
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
            max-width: 1200px;
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
            background: linear-gradient(135deg, rgba(255,215,0,0.2), rgba(255,215,0,0.1));
            color: #fff;
            padding: 20px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 1rem;
            border-bottom: 2px solid rgba(255,215,0,0.3);
            text-shadow: 0 1px 3px rgba(0,0,0,0.5);
        }

        td {
            padding: 20px 15px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            color: rgba(255,255,255,0.95);
        }

        tr:hover {
            background: rgba(255,215,0,0.1);
        }

        tr:nth-child(even) {
            background: rgba(255,255,255,0.05);
        }

        .action-links {
            display: flex;
            gap: 10px;
        }

        .action-links a {
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.95rem;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .approve-link {
            background: rgba(40,167,69,0.8);
            color: white;
            border: 2px solid rgba(40,167,69,0.5);
        }

        .approve-link:hover {
            background: #28a745;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(40,167,69,0.4);
        }

        .reject-link {
            background: rgba(255,107,107,0.8);
            color: white;
            border: 2px solid rgba(255,107,107,0.5);
        }

        .reject-link:hover {
            background: #ff6b6b;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(255,107,107,0.4);
        }

        .no-data {
            text-align: center;
            padding: 80px 40px;
            color: rgba(255,255,255,0.7);
            font-size: 1.2rem;
            font-style: italic;
        }

        .no-data i {
            font-size: 4rem;
            color: #ffd700;
            margin-bottom: 20px;
            opacity: 0.6;
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
                padding: 20px;
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
                color: #ffd700;
            }
            
            .action-links {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h2><i class="fas fa-clock"></i> Pending NGO Requests</h2>
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
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>City</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                boolean hasData = false;
                try {
                    Connection con = DbConnection.getConnection();
                    PreparedStatement ps = con.prepareStatement(
                        "SELECT * FROM ngo WHERE status=?"
                    );
                    ps.setString(1, "pending");
                    ResultSet rs = ps.executeQuery();

                    while(rs.next()) {
                        hasData = true;
                %>
                    <tr>
                        <td data-label="ID"><%= rs.getInt("ngo_id") %></td>
                        <td data-label="Name"><%= rs.getString("name") %></td>
                        <td data-label="Email"><%= rs.getString("email") %></td>
                        <td data-label="Mobile"><%= rs.getString("mobile") %></td>
                        <td data-label="City"><%= rs.getString("city") %></td>
                        <td class="action-links" data-label="Action">
                            <a href="approve.jsp?id=<%=rs.getInt("ngo_id")%>" class="approve-link">
                                <i class="fas fa-check"></i> Approve
                            </a>
                            <a href="reject.jsp?id=<%=rs.getInt("ngo_id")%>" class="reject-link">
                                <i class="fas fa-times"></i> Reject
                            </a>
                        </td>
                    </tr>
                <%
                    }
                    rs.close();
                    ps.close();
                    con.close();
                } catch(Exception e) {
                    e.printStackTrace();
                }
                
                if(!hasData) {
                %>
                    <tr>
                        <td colspan="6" class="no-data">
                            <i class="fas fa-inbox"></i>
                            No pending NGO requests found
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
