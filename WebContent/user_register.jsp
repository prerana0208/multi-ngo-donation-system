<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration - Multi-NGO System</title>
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
            max-width: 550px;
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
            color: #28a745;
            margin-bottom: 35px;
            text-shadow: 0 3px 15px rgba(40,167,69,0.5);
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
        input[type="password"] {
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

        input::placeholder {
            color: rgba(255,255,255,0.7);
        }

        input:focus {
            outline: none;
            border-color: #28a745;
            box-shadow: 0 0 20px rgba(40,167,69,0.4);
            background: rgba(255,255,255,0.18);
            transform: translateY(-2px);
        }

        /* PERFECT GREEN REGISTER BUTTON */
        button {
            width: 100% !important;
            padding: 22px 35px !important;
            background: linear-gradient(135deg, #28a745 0%, #20c997 50%, #28a745 100%) !important;
            color: #fff !important;
            border: 3px solid rgba(255,255,255,0.4) !important;
            border-radius: 25px !important;
            font-size: 1.4rem !important;
            font-weight: 800 !important;
            cursor: pointer !important;
            text-transform: uppercase !important;
            letter-spacing: 1.5px !important;
            box-shadow: 0 18px 45px rgba(40,167,69,0.5) !important;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94) !important;
            position: relative !important;
            overflow: hidden !important;
            font-family: 'Poppins', sans-serif !important;
            margin-top: 15px !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            gap: 12px !important;
            text-shadow: 0 2px 10px rgba(0,0,0,0.3) !important;
        }

        button:hover {
            transform: translateY(-10px) scale(1.03) !important;
            box-shadow: 0 30px 65px rgba(40,167,69,0.7) !important;
            background: linear-gradient(135deg, #20c997 0%, #28a745 50%, #20c997 100%) !important;
        }

        button:active {
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

        .login-link {
            text-align: center;
            margin-top: 30px;
            padding-top: 25px;
            border-top: 1px solid rgba(255,255,255,0.2);
        }

        .login-link a {
            color: #28a745;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }

        .login-link a:hover {
            text-shadow: 0 0 15px rgba(40,167,69,0.8);
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
        <h2><i class="fas fa-user-plus"></i> User Registration</h2>
        
        <% 
        String error = request.getParameter("error");
        if(error != null) {
        %>
            <div class="error">
                <i class="fas fa-exclamation-triangle"></i>
                <%= error %>
            </div>
        <% } %>
        
        <form action="UserRegister" method="post">
            <div class="form-group">
                <label><i class="fas fa-user"></i> Full Name</label>
                <input type="text" name="name" placeholder="Enter your full name" required>
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-envelope"></i> Email</label>
                <input type="email" name="email" placeholder="Enter email address" required>
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-phone"></i> Mobile</label>
                <input type="text" name="mobile" placeholder="Enter 10-digit mobile number" maxlength="10" required>
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-lock"></i> Password</label>
                <input type="password" name="password" placeholder="Create password (min 6 chars)" minlength="6" required>
            </div>

            <button type="submit">
                <i class="fas fa-user-plus"></i>
                Register as Donor
            </button>
        </form>

        <div class="login-link">
            Already registered? <a href="userlogin.jsp">Login here</a>
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
