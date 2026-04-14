<%@ page import="java.sql.*" %>
<%@ page import="com.r3sys.db.DbConnection" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
Integer userId = (Integer) session.getAttribute("userId");
if(userId == null){
    response.sendRedirect("userlogin.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Donations - Multi-NGO System</title>
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
            padding: 30px;
            border-bottom: 4px solid #28a745;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }
        
        .header h2 {
            color: #28a745;
            font-size: 2.1rem;
            font-weight: 700;
            text-shadow: 0 3px 15px rgba(40,167,69,0.5);
        }
        
        .back-link a {
            color: #ffd700;
            text-decoration: none;
            font-weight: 600;
            padding: 15px 30px;
            border: 2px solid rgba(255,215,0,0.4);
            border-radius: 25px;
            background: rgba(255,215,0,0.1);
            backdrop-filter: blur(10px);
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }
        
        .back-link a:hover {
            background: #ffd700;
            color: #1a1a2e;
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(255,215,0,0.4);
        }
        
        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 20px;
        }
        
        .table-container {
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(20px);
            border-radius: 25px;
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.2);
            box-shadow: 0 20px 50px rgba(0,0,0,0.4);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th {
            background: linear-gradient(135deg, rgba(40,167,69,0.2), rgba(40,167,69,0.1));
            color: #fff;
            padding: 22px 20px;
            text-align: left;
            font-weight: 600;
            font-size: 1.1rem;
            border-bottom: 2px solid rgba(40,167,69,0.4);
            text-shadow: 0 2px 8px rgba(0,0,0,0.8);
        }
        
        th:nth-child(1) { width: 60%; }
        th:nth-child(2) { width: 20%; text-align: center; }
        th:nth-child(3) { width: 20%; text-align: center; }
        
        td {
            padding: 22px 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            color: rgba(255,255,255,0.95);
            font-size: 1rem;
        }
        
        td:nth-child(1) { width: 60%; }
        td:nth-child(2) { width: 20%; text-align: center; }
        td:nth-child(3) { width: 20%; text-align: center; }
        
        tr:hover {
            background: rgba(40,167,69,0.1);
        }
        
        tr:nth-child(even) {
            background: rgba(255,255,255,0.05);
        }
        
        .amount {
            font-weight: 800;
            color: #ffd700;
            font-size: 1.3rem;
            text-shadow: 0 2px 10px rgba(255,215,0,0.6);
        }
        
        .date {
            color: rgba(255,255,255,0.85);
            font-weight: 500;
        }
        
        .no-data {
            text-align: center;
            padding: 120px 40px;
            color: rgba(255,255,255,0.6);
            font-size: 1.5rem;
            font-style: italic;
        }
        
        .no-data i {
            font-size: 7rem;
            color: rgba(40,167,69,0.3);
            margin-bottom: 30px;
            display: block;
        }
        
        /* Mobile Responsive Table */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 20px;
                text-align: center;
                padding: 25px;
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
                margin-bottom: 25px;
                border-radius: 20px;
                padding: 30px;
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
            
            .amount {
                font-size: 1.4rem;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h2><i class="fas fa-heart"></i> My Donations</h2>
        <div class="back-link">
            <a href="userdashboard.jsp">
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
                        <th>NGO Name</th>
                        <th>Amount</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                <%
                boolean hasData = false;
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                
                try {
                    con = DbConnection.getConnection();
                    ps = con.prepareStatement(
                        "SELECT n.name, d.amount, d.date FROM donation d JOIN ngo n ON d.ngo_id = n.ngo_id WHERE d.user_id = ? ORDER BY d.date DESC"
                    );
                    ps.setInt(1, userId);
                    rs = ps.executeQuery();
                    
                    while(rs.next()) {
                        hasData = true;
                %>
                    <tr>
                        <td data-label="NGO Name"><%= rs.getString("name") %></td>
                        <td data-label="Amount" class="amount">
                            <i class="fas fa-rupee-sign"></i> <%= rs.getInt("amount") %>
                        </td>
                        <td data-label="Date" class="date">
                            <%= new java.text.SimpleDateFormat("dd-MM-yyyy").format(rs.getTimestamp("date")) %>
                        </td>
                    </tr>
                <%
                    }
                } catch(Exception e) {
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
                        <td colspan="3" class="no-data">
                            <i class="fas fa-inbox"></i>
                            No donations found
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
