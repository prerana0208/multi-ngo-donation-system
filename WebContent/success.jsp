<%@ page import="java.sql.*" %>
<%@ page import="com.r3sys.db.DbConnection" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userIdStr = request.getParameter("userId");
    String ngoIdStr = request.getParameter("ngoId");
    String amountStr = request.getParameter("amount");
    String paymentMode = request.getParameter("payment_mode");
    
    int userId = Integer.parseInt(userIdStr);
    int ngoId = Integer.parseInt(ngoIdStr);
    int amount = Integer.parseInt(amountStr);
    
    // INSERT INTO EXACT donation table structure
    Connection con = null;
    PreparedStatement ps = null;
    try {
        con = DbConnection.getConnection();
        ps = con.prepareStatement(
            "INSERT INTO donation (user_id, ngo_id, amount, payment_mode, date) VALUES (?, ?, ?, ?, NOW())"
        );
        ps.setInt(1, userId);
        ps.setInt(2, ngoId);
        ps.setInt(3, amount);
        ps.setString(4, paymentMode);
        ps.executeUpdate();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if(ps != null) ps.close();
        if(con != null) con.close();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donation Success</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        *{margin:0;padding:0;box-sizing:border-box;}
        body{
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.8)), 
                        url('images/ngo2.jpg') center/cover fixed;
            min-height:100vh;
            display:flex;align-items:center;justify-content:center;padding:20px;
            color:#fff;
        }
        .success-container{
            background:rgba(255,255,255,0.15);
            backdrop-filter:blur(25px);
            padding:80px 50px;
            border-radius:30px;
            border:1px solid rgba(255,255,255,0.3);
            box-shadow:0 30px 80px rgba(0,0,0,0.5);
            text-align:center;max-width:550px;width:100%;
        }
        .success-icon{
            width:120px;height:120px;
            background:linear-gradient(135deg,#28a745,#20c997);
            border-radius:50%;margin:0 auto 35px;
            display:flex;align-items:center;justify-content:center;
            font-size:4rem;color:#fff;
            box-shadow:0 20px 50px rgba(40,167,69,0.4);
            animation:bounce 2s infinite;
        }
        @keyframes bounce{
            0%,20%,50%,80%,100%{transform:translateY(0);}
            40%{transform:translateY(-12px);}
            60%{transform:translateY(-6px);}
        }
        h2{
            color:#28a745;font-size:2.8rem;font-weight:800;
            margin-bottom:15px;text-shadow:0 4px 20px rgba(0,0,0,0.5);
        }
        p{
            color:rgba(255,255,255,0.95);font-size:1.3rem;
            margin-bottom:35px;font-weight:500;
        }
        .btn{
            display:inline-flex;align-items:center;gap:12px;
            padding:20px 45px;background:linear-gradient(135deg,#007bff,#0056b3);
            color:#fff !important;text-decoration:none;border-radius:30px;
            font-weight:700;font-size:1.2rem;border:3px solid rgba(255,255,255,0.4);
            text-transform:uppercase;letter-spacing:1px;
            box-shadow:0 15px 40px rgba(0,123,255,0.4);
            transition:all 0.4s cubic-bezier(0.25,0.46,0.45,0.94);
            backdrop-filter:blur(10px);
        }
        .btn:hover{
            transform:translateY(-6px) scale(1.03);
            box-shadow:0 25px 60px rgba(0,123,255,0.6);
            background:linear-gradient(135deg,#0056b3,#007bff);
            color:#fff !important;
        }
        @media (max-width:768px){
            .success-container{padding:50px 30px;margin:20px;}
            h2{font-size:2.2rem;}
            .success-icon{width:100px;height:100px;font-size:3.2rem;}
            .btn{padding:16px 35px;font-size:1.1rem;}
        }
    </style>
</head>
<body>
    <div class="success-container">
        <div class="success-icon"><i class="fas fa-check-circle"></i></div>
        <h2>Thank You!</h2>
        <p>Rs. <%= amount %> donated successfully via <%= paymentMode %>.</p>
        <a href="userdashboard.jsp" class="btn">
            <i class="fas fa-tachometer-alt"></i> Back to Dashboard
        </a>
    </div>
</body>
</html>
