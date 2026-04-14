<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
    // Session check
    if(session.getAttribute("admin") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Dashboard - Multi-NGO System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            line-height: 1.6;
            min-height: 100vh;
        }

        /* Header */
        .header {
            background: rgba(0,0,0,0.4);
            backdrop-filter: blur(15px);
            padding: 30px;
            border-bottom: 3px solid rgba(255,215,0,0.6);
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.3);
        }

        .header h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #ffd700;
            margin-bottom: 10px;
            text-shadow: 0 3px 15px rgba(255,215,0,0.5);
        }

        .welcome-text {
            color: rgba(255,255,255,0.9);
            font-size: 1.2rem;
            font-weight: 400;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .stats-bar {
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(15px);
            padding: 25px;
            border-radius: 20px;
            margin-bottom: 40px;
            text-align: center;
            border: 1px solid rgba(255,255,255,0.2);
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        .stats-bar strong {
            color: #ffd700;
            font-size: 1.1rem;
            font-weight: 600;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
        }

        .dashboard-card {
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(20px);
            padding: 45px 35px;
            border-radius: 25px;
            text-align: center;
            text-decoration: none;
            color: #fff;
            border: 2px solid rgba(255,255,255,0.2);
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            box-shadow: 0 15px 40px rgba(0,0,0,0.4);
            position: relative;
            overflow: hidden;
        }

        .dashboard-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, transparent, #ffd700, transparent);
            transform: scaleX(0);
            transition: transform 0.4s ease;
        }

        .dashboard-card:hover::before {
            transform: scaleX(1);
        }

        .dashboard-card:hover {
            transform: translateY(-12px);
            box-shadow: 0 25px 60px rgba(0,0,0,0.6);
            border-color: rgba(255,215,0,0.5);
        }

        /* Color variants */
        .pending { 
            border-left: 5px solid #ffd700; 
            background: rgba(255,215,0,0.15);
        }

        .approved { 
            border-left: 5px solid #28a745; 
            background: rgba(40,167,69,0.15);
        }

        .rejected { 
            border-left: 5px solid #ff6b6b; 
            background: rgba(255,107,107,0.15);
        }

        .logout-card {
            border-left: 5px solid #ffd700;
            background: rgba(255,215,0,0.1);
        }

        .logout-card:hover {
            background: rgba(255,215,0,0.25);
            border-color: #ffd700;
        }

        .icon {
            font-size: 3.5rem;
            margin-bottom: 25px;
            display: block;
            filter: drop-shadow(0 5px 15px rgba(255,255,255,0.3));
        }

        .dashboard-card h3 {
            font-size: 1.6rem;
            font-weight: 700;
            margin: 0 0 15px 0;
            text-shadow: 0 2px 10px rgba(0,0,0,0.8);
        }

        .dashboard-card p {
            color: rgba(255,255,255,0.9);
            font-size: 1.1rem;
            margin-bottom: 0;
            font-weight: 400;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header h2 { font-size: 2rem; }
            .dashboard-grid { 
                grid-template-columns: 1fr; 
                gap: 25px;
                margin-top: 20px;
            }
            .container { padding: 0 15px; }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h2><i class="fas fa-user-shield"></i> Welcome Admin</h2>
        <p class="welcome-text">Multi-NGO Donation Management System</p>
    </div>
    
    <div class="container">
        <!-- Stats Bar -->
        <div class="stats-bar">
            <strong><i class="fas fa-chart-line"></i> Manage NGO Approvals | Secure Dashboard | Real-time Updates</strong>
        </div>
        
        <!-- Dashboard Cards -->
        <div class="dashboard-grid">
            <a href="pendingngo.jsp" class="dashboard-card pending">
                <i class="fas fa-clock" style="color: #ffd700;"></i>
                <h3>Pending NGOs</h3>
                <p>Review & Approve NGO Applications</p>
            </a>
            
            <a href="approvedngo.jsp" class="dashboard-card approved">
                <i class="fas fa-check-circle" style="color: #28a745;"></i>
                <h3>Approved NGOs</h3>
                <p>View Active & Verified Organizations</p>
            </a>
            
            <a href="rejectedngo.jsp" class="dashboard-card rejected">
                <i class="fas fa-times-circle" style="color: #ff6b6b;"></i>
                <h3>Rejected NGOs</h3>
                <p>Manage Rejected Applications</p>
            </a>
            
            <a href="index.jsp" class="dashboard-card logout-card">
                <i class="fas fa-sign-out-alt" style="color: #ffd700;"></i>
                <h3>Logout</h3>
                <p>Secure Session Logout</p>
            </a>
        </div>
    </div>
</body>
</html>
