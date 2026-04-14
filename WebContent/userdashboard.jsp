<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    if(session.getAttribute("userName") == null) {
        response.sendRedirect("userlogin.jsp?error=Please+login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Multi-NGO System</title>
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
            padding: 35px 30px;
            border-bottom: 4px solid #28a745;
            text-align: center;
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }
        
        .header h2 {
            font-size: 2.4rem;
            font-weight: 700;
            color: #28a745;
            margin-bottom: 12px;
            text-shadow: 0 4px 20px rgba(40,167,69,0.6);
        }
        
        .welcome-text {
            color: rgba(255,255,255,0.95);
            font-size: 1.25rem;
            font-weight: 400;
        }
        
        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 0 20px;
        }
        
        .stats-bar {
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(20px);
            padding: 30px;
            border-radius: 25px;
            margin-bottom: 50px;
            text-align: center;
            border: 1px solid rgba(255,255,255,0.2);
            box-shadow: 0 15px 40px rgba(0,0,0,0.4);
        }
        
        .stats-bar strong {
            color: #28a745;
            font-size: 1.2rem;
            font-weight: 600;
        }

        /* Top 2 cards row */
        .dashboard-grid-top {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 35px;
            margin-bottom: 50px;
        }
        
        /* Logout card - CENTERED */
        .logout-section {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .dashboard-card {
            background: rgba(255,255,255,0.15);
            backdrop-filter: blur(25px);
            padding: 50px 40px;
            border-radius: 30px;
            text-align: center;
            text-decoration: none;
            color: #fff;
            border: 2px solid rgba(255,255,255,0.25);
            transition: all 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            box-shadow: 0 20px 50px rgba(0,0,0,0.4);
            position: relative;
            overflow: hidden;
        }
        
        .dashboard-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: linear-gradient(90deg, transparent, #28a745, transparent);
            transform: scaleX(0);
            transition: transform 0.5s ease;
        }
        
        .dashboard-card:hover::before {
            transform: scaleX(1);
        }
        
        .dashboard-card:hover {
            transform: translateY(-15px);
            box-shadow: 0 35px 70px rgba(0,0,0,0.6);
            border-color: rgba(40,167,69,0.6);
        }
        
        .dashboard-card i {
            font-size: 4rem;
            display: block;
            margin-bottom: 25px;
            color: #28a745;
            filter: drop-shadow(0 5px 20px rgba(40,167,69,0.5));
        }
        
        .dashboard-card h3 {
            font-size: 1.8rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 18px;
            text-shadow: 0 2px 10px rgba(0,0,0,0.8);
        }
        
        .dashboard-card p {
            color: rgba(255,255,255,0.95);
            font-size: 1.15rem;
            margin-bottom: 0;
            font-weight: 400;
            line-height: 1.6;
        }
        
        /* Logout Card Special */
        .logout-card {
            border-left: 6px solid #ff6b6b;
            background: rgba(255,107,107,0.12);
            max-width: 350px;
        }
        
        .logout-card:hover {
            background: rgba(255,107,107,0.2);
            border-color: #ff6b6b;
        }
        
        .logout-card i {
            color: #ff6b6b;
        }
        
        .logout-card h3 {
            color: #ff6b6b;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .header h2 { font-size: 2rem; }
            .dashboard-grid-top { 
                grid-template-columns: 1fr; 
                gap: 30px;
            }
            .container { padding: 0 15px; margin: 30px auto; }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h2><i class="fas fa-user-check"></i> Welcome, <%= session.getAttribute("userName") %></h2>
        <p class="welcome-text">Multi-NGO Donation Management System</p>
    </div>
    
    <div class="container">
        <!-- Quick Stats -->
        <div class="stats-bar">
            <strong><i class="fas fa-chart-line"></i> Browse NGOs and track your donations</strong>
        </div>
        
        <!-- Top 2 Cards -->
        <div class="dashboard-grid-top">
            <a href="viewngo.jsp" class="dashboard-card">
                <i class="fas fa-building-columns"></i>
                <h3>View NGOs</h3>
                <p>Browse verified NGOs and make donations</p>
            </a>
            
            <a href="mydonations.jsp" class="dashboard-card">
                <i class="fas fa-heart"></i>
                <h3>My Donations</h3>
                <p>View your donation history</p>
            </a>
        </div>
        
        <!-- Logout Card - PERFECTLY CENTERED -->
        <div class="logout-section">
            <a href="index.jsp" class="dashboard-card logout-card">
                <i class="fas fa-sign-out-alt"></i>
                <h3>Logout</h3>
                <p>Secure logout from user dashboard</p>
            </a>
        </div>
    </div>
</body>
</html>
