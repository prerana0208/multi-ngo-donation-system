<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NGO Registration - Multi-NGO System</title>
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
            padding: 20px;
            min-height: 100vh;
        }

        .form-container {
            max-width: 650px;
            margin: 40px auto;
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(20px);
            padding: 50px 45px;
            border-radius: 25px;
            border: 1px solid rgba(255,255,255,0.2);
            box-shadow: 0 20px 50px rgba(0,0,0,0.4);
        }

        .form-container h2 {
            text-align: center;
            font-size: 2.3rem;
            font-weight: 700;
            color: #ffd700;
            margin-bottom: 35px;
            text-shadow: 0 3px 15px rgba(255,215,0,0.5);
        }

        .form-group {
            margin-bottom: 28px;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            color: #fff;
            font-weight: 500;
            font-size: 1.05rem;
        }

        input[type="text"], 
        input[type="email"], 
        input[type="password"],
        textarea {
            width: 100%;
            padding: 18px 22px;
            border: 2px solid rgba(255,255,255,0.3);
            border-radius: 15px;
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(12px);
            color: #fff;
            font-size: 1.05rem;
            font-family: 'Poppins', sans-serif;
            transition: all 0.4s;
        }

        textarea {
            height: 130px;
            resize: vertical;
        }

        input::placeholder, textarea::placeholder {
            color: rgba(255,255,255,0.7);
        }

        input:focus, textarea:focus {
            outline: none;
            border-color: #ffd700;
            box-shadow: 0 0 20px rgba(255,215,0,0.4);
            background: rgba(255,255,255,0.18);
            transform: translateY(-2px);
        }

        /* FIXED REGISTER BUTTON - PERFECT GOLDEN STYLE */
        input[type="submit"], .register-btn {
            width: 100% !important;
            padding: 22px 35px !important;
            background: linear-gradient(135deg, #ffd700 0%, #ffed4a 50%, #f7c942 100%) !important;
            color: #1a1a2e !important;
            border: 3px solid rgba(255,255,255,0.4) !important;
            border-radius: 25px !important;
            font-size: 1.4rem !important;
            font-weight: 800 !important;
            cursor: pointer !important;
            text-transform: uppercase !important;
            letter-spacing: 1.5px !important;
            box-shadow: 0 18px 45px rgba(255,215,0,0.5) !important;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94) !important;
            position: relative !important;
            overflow: hidden !important;
            font-family: 'Poppins', sans-serif !important;
            margin-top: 15px !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            gap: 12px !important;
            text-shadow: none !important;
        }

        input[type="submit"]:hover, .register-btn:hover {
            transform: translateY(-10px) scale(1.03) !important;
            box-shadow: 0 30px 65px rgba(255,215,0,0.7) !important;
            background: linear-gradient(135deg, #ffed4a 0%, #ffd700 50%, #f7c942 100%) !important;
        }

        input[type="submit"]:active, .register-btn:active {
            transform: scale(0.98) !important;
        }

        .error {
            background: rgba(255,107,107,0.2);
            border: 1px solid rgba(255,107,107,0.4);
            color: #fff;
            padding: 18px;
            border-radius: 15px;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 500;
            backdrop-filter: blur(10px);
        }

        .success {
            background: rgba(40,167,69,0.2);
            border: 1px solid rgba(40,167,69,0.4);
            color: #fff;
            padding: 18px;
            border-radius: 15px;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 500;
            backdrop-filter: blur(10px);
        }

        .login-link {
            text-align: center;
            margin-top: 30px;
            padding-top: 25px;
            border-top: 1px solid rgba(255,255,255,0.2);
        }

        .login-link a {
            color: #ffd700;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }

        .login-link a:hover {
            text-shadow: 0 0 15px rgba(255,215,0,0.8);
        }

        .back-link {
            text-align: center;
            margin-top: 25px;
        }

        .back-link a {
            color: #ffd700;
            text-decoration: none;
            font-weight: 600;
            padding: 12px 30px;
            border: 2px solid rgba(255,215,0,0.4);
            border-radius: 25px;
            background: rgba(255,215,0,0.1);
            backdrop-filter: blur(10px);
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .back-link a:hover {
            background: #ffd700;
            color: #1a1a2e;
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(255,215,0,0.4);
        }

        @media (max-width: 768px) {
            .form-container {
                margin: 20px 15px;
                padding: 40px 30px;
            }
            
            .form-container h2 {
                font-size: 1.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2><i class="fas fa-building-columns"></i> NGO Registration</h2>
        
        <% 
        String error = request.getParameter("error");
        String success = request.getParameter("success");
        if(error != null) {
        %>
            <div class="error">
                <i class="fas fa-exclamation-triangle"></i>
                <%= error %>
            </div>
        <% } %>
        
        <% if(success != null) { %>
            <div class="success">
                <i class="fas fa-check-circle"></i>
                NGO registered successfully! Waiting for admin approval.
            </div>
        <% } %>
        
        <form action="NgoRegister" method="post">
            <div class="form-group">
                <label><i class="fas fa-building"></i> NGO Name</label>
                <input type="text" name="name" placeholder="Enter NGO name" required>
            </div>

            <div class="form-group">
                <label><i class="fas fa-envelope"></i> Email</label>
                <input type="email" name="email" placeholder="Enter email address" required>
            </div>

            <div class="form-group">
                <label><i class="fas fa-phone"></i> Mobile</label>
                <input type="text" name="mobile" placeholder="Enter 10-digit mobile number" required maxlength="10">
            </div>

            <div class="form-group">
                <label><i class="fas fa-map-marker-alt"></i> City</label>
                <input type="text" name="city" placeholder="Enter city name" required>
            </div>

            <div class="form-group">
                <label><i class="fas fa-certificate"></i> Registration Number</label>
                <input type="text" name="reg_no" placeholder="Enter registration number" required>
            </div>

            <div class="form-group">
                <label><i class="fas fa-align-left"></i> Description</label>
                <textarea name="description" placeholder="Brief description about your NGO..." required></textarea>
            </div>

            <div class="form-group">
                <label><i class="fas fa-lock"></i> Password</label>
                <input type="password" name="password" placeholder="Create password (min 6 chars)" required minlength="6">
            </div>

            <!-- PERFECT FIXED GOLDEN BUTTON -->
            <input type="submit" value="Register NGO">
        </form>

        <div class="login-link">
            Already registered? <a href="ngologin.jsp">Login here</a>
        </div>
        
        <div class="back-link">
            <a href="index.jsp">
                <i class="fas fa-arrow-left"></i>
                Back to Home
            </a>
        </div>
    </div>
</body>
</html>
