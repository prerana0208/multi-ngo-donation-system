<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    Integer userId = (Integer) session.getAttribute("userId");
    String ngoId = request.getParameter("ngo_id");
    String ngoName = "";
    
    if(userId == null) {
        response.sendRedirect("userlogin.jsp");
        return;
    }
    
    if(ngoId == null) {
        response.sendRedirect("viewngo.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donate - Multi-NGO System</title>
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
            padding: 20px 0;
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
            max-width: 1200px;
            margin: 0 auto;
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
            max-width: 700px;
            margin: 50px auto;
            padding: 0 20px;
        }
        
        .donation-form {
            background: rgba(255,255,255,0.15);
            backdrop-filter: blur(25px);
            padding: 60px 50px;
            border-radius: 30px;
            border: 1px solid rgba(255,255,255,0.2);
            box-shadow: 0 25px 60px rgba(0,0,0,0.4);
        }
        
        .ngo-info {
            background: rgba(40,167,69,0.2);
            backdrop-filter: blur(15px);
            padding: 30px;
            border-radius: 20px;
            margin-bottom: 40px;
            text-align: center;
            border: 2px solid rgba(40,167,69,0.3);
            box-shadow: 0 10px 30px rgba(40,167,69,0.2);
        }
        
        .ngo-info h3 {
            color: #fff;
            font-size: 1.6rem;
            margin-bottom: 10px;
            text-shadow: 0 2px 10px rgba(0,0,0,0.5);
        }
        
        .ngo-info p {
            color: rgba(255,255,255,0.9);
            font-size: 1.1rem;
            margin: 0;
        }
        
        .form-group {
            margin-bottom: 35px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 12px;
            color: #fff;
            font-weight: 600;
            font-size: 1.1rem;
        }
        
        /* FIXED - CLEAR TEXT INPUT */
        input[type="number"], select {
            width: 100%;
            padding: 22px 25px;
            border: 2px solid rgba(255,255,255,0.4);
            border-radius: 20px;
            background: rgba(255,255,255,0.25);
            backdrop-filter: blur(15px);
            color: #000 !important;  /* BLACK TEXT - PERFECTLY CLEAR */
            font-size: 1.3rem;       /* BIGGER FONT */
            font-family: 'Poppins', sans-serif;
            font-weight: 600;        /* BOLD TEXT */
            transition: all 0.4s;
            -webkit-appearance: none;
            -moz-appearance: textfield;
        }
        
        /* REMOVE NUMBER SPINNER */
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        
        input[type="number"] {
            -moz-appearance: textfield;
        }
        
        /* PLACEHOLDER PERFECTLY VISIBLE */
        input[type="number"]::placeholder, select::placeholder {
            color: #333 !important;    /* DARK GRAY PLACEHOLDER */
            font-weight: 500;
            opacity: 1 !important;
        }
        
        input[type="number"]:focus, select:focus {
            outline: none;
            border-color: #28a745;
            box-shadow: 0 0 25px rgba(40,167,69,0.4);
            background: rgba(255,255,255,0.35);
            transform: translateY(-2px);
        }
        
        /* SELECT DROPDOWN ARROW */
        select {
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='black' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6,9 12,15 18,9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 20px center;
            background-size: 20px;
            padding-right: 60px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }
        
        /* PERFECT DONATE BUTTON */
        button {
            width: 100%;
            padding: 25px 40px;
            background: linear-gradient(135deg, #28a745 0%, #20c997 50%, #28a745 100%);
            color: #fff !important;
            border: 3px solid rgba(255,255,255,0.4) !important;
            border-radius: 30px !important;
            font-size: 1.5rem !important;
            font-weight: 800 !important;
            cursor: pointer !important;
            text-transform: uppercase !important;
            letter-spacing: 1.5px !important;
            box-shadow: 0 20px 50px rgba(40,167,69,0.5) !important;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94) !important;
            position: relative !important;
            overflow: hidden !important;
            font-family: 'Poppins', sans-serif !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            gap: 15px !important;
            text-shadow: 0 2px 10px rgba(0,0,0,0.3) !important;
        }
        
        button:hover {
            transform: translateY(-8px) scale(1.03) !important;
            box-shadow: 0 35px 70px rgba(40,167,69,0.7) !important;
            background: linear-gradient(135deg, #20c997 0%, #28a745 50%, #20c997 100%) !important;
        }
        
        button:active {
            transform: scale(0.98) !important;
        }
        
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 20px;
                text-align: center;
                padding: 25px;
            }
            
            .container {
                margin: 30px auto;
                padding: 0 15px;
            }
            
            .donation-form {
                padding: 45px 35px;
            }
            
            .header h2 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h2><i class="fas fa-hand-holding-heart"></i> Make Donation</h2>
        <div class="back-link">
            <a href="viewngo.jsp">
                <i class="fas fa-arrow-left"></i>
                Back to NGOs
            </a>
        </div>
    </div>
    
    <div class="container">
        <div class="donation-form">
            <div class="ngo-info">
                <h3><i class="fas fa-building-columns"></i> Donating to NGO ID: <%= ngoId %></h3>
                <p>Your donation will help make a difference!</p>
            </div>
            
            <form action="success.jsp" method="post">
                <input type="hidden" name="ngoId" value="<%= ngoId %>">
                <input type="hidden" name="userId" value="<%= userId %>">
                
                <div class="form-group">
                    <label><i class="fas fa-rupee-sign"></i> Amount (Rs.)</label>
                    <input type="number" name="amount" min="100" max="100000" step="1" placeholder="Enter donation amount (Min ₹100)" required>
                </div>
                
                <div class="form-group">
                    <label><i class="fas fa-credit-card"></i> Payment Mode</label>
                    <select name="payment_mode" required>
                        <option value="">Select Payment Method</option>
                        <option value="UPI">💳 UPI</option>
                        <option value="CARD">💳 Credit/Debit Card</option>
                        <option value="NETBANKING">🏦 Net Banking</option>
                    </select>
                </div>
                
                <button type="submit">
                    <i class="fas fa-arrow-right"></i>
                    Proceed to Payment
                </button>
            </form>
        </div>
    </div>
</body>
</html>
