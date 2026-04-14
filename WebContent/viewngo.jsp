<%@ page import="java.sql.*" %>
<%@ page import="com.r3sys.db.DbConnection" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    if(session.getAttribute("userName") == null) {
        response.sendRedirect("userlogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select NGO to Donate - Multi-NGO System</title>
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
            border-bottom: 4px solid #007bff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }
        
        .header h2 {
            color: #007bff;
            font-size: 2.1rem;
            font-weight: 700;
            text-shadow: 0 3px 15px rgba(0,123,255,0.5);
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
            max-width: 1200px;
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
            background: linear-gradient(135deg, rgba(0,123,255,0.2), rgba(0,123,255,0.1));
            color: #fff;
            padding: 22px 20px;
            text-align: left;
            font-weight: 600;
            font-size: 1.1rem;
            border-bottom: 2px solid rgba(0,123,255,0.4);
            text-shadow: 0 2px 8px rgba(0,0,0,0.8);
        }
        
        /* PERFECT BALANCED ALIGNMENT */
        th:nth-child(1) { width: 45%; }  /* Name - wider */
        th:nth-child(2) { width: 30%; }  /* City */
        th:nth-child(3) { width: 25%; text-align: center; }  /* Action - CENTER */
        
        td {
            padding: 22px 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            color: rgba(255,255,255,0.95);
            font-size: 1rem;
        }
        
        /* BALANCED COLUMN WIDTHS */
        td:nth-child(1) { width: 45%; }
        td:nth-child(2) { width: 30%; }
        td:nth-child(3) { width: 25%; text-align: center; padding: 22px 15px; }
        
        tr:hover {
            background: rgba(0,123,255,0.1);
        }
        
        tr:nth-child(even) {
            background: rgba(255,255,255,0.05);
        }
        
        /* PERFECT CENTERED DONATE BUTTON */
        .donate-btn {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white !important;
            padding: 14px 25px;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 700;
            font-size: 0.95rem;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            box-shadow: 0 8px 25px rgba(40,167,69,0.4);
            border: 2px solid rgba(255,255,255,0.3);
            text-transform: uppercase;
            letter-spacing: 0.8px;
            width: 140px;  /* Fixed width for perfect center */
        }
        
        .donate-btn:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 18px 40px rgba(40,167,69,0.6);
            background: linear-gradient(135deg, #20c997 0%, #28a745 100%);
            color: white !important;
            text-decoration: none;
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
            color: rgba(0,123,255,0.3);
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
                width: 40%;
                font-weight: 600;
                color: #007bff;
            }
            
            /* Mobile Action button PERFECT CENTER */
            td[data-label="Action"] {
                text-align: center;
                padding: 10px;
            }
            
            td[data-label="Action"]:before {
                width: 35%;
                display: none;  /* Hide Action label on mobile */
            }
            
            .donate-btn {
                width: 120px;
                margin: 0 auto;
                display: block;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h2><i class="fas fa-hand-holding-heart"></i> Select NGO to Donate</h2>
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
                        <th style="width: 45%;">Name</th>
                        <th style="width: 30%;">City</th>
                        <th style="width: 25%; text-align: center;">Action</th>
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
                    ps = con.prepareStatement("SELECT * FROM ngo WHERE status='approved'");
                    rs = ps.executeQuery();

                    while(rs.next()) {
                        hasData = true;
                %>
                    <tr>
                        <td data-label="Name"><%= rs.getString("name") %></td>
                        <td data-label="City"><%= rs.getString("city") %></td>
                        <td data-label="Action">
                            <a href="donate.jsp?ngo_id=<%=rs.getInt("ngo_id")%>" class="donate-btn">
                                <i class="fas fa-heart"></i> Donate
                            </a>
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
                            <i class="fas fa-building-columns"></i>
                            No approved NGOs available
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
