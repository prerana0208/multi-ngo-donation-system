<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login - Multi-NGO System</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        
        .login-container {
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(20px);
            padding: 60px 45px;
            border-radius: 25px;
            width: 100%;
            max-width: 450px;
            border: 1px solid rgba(255,255,255,0.2);
            box-shadow: 0 25px 60px rgba(0,0,0,0.4);
            text-align: center;
        }
        
        .login-container h2 {
            font-size: 2.4rem;
            font-weight: 700;
            color: #007bff;
            margin-bottom: 35px;
            text-shadow: 0 3px 15px rgba(0,123,255,0.5);
        }

        .form-group {
            margin-bottom: 30px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            color: #fff;
            font-weight: 500;
            font-size: 1.05rem;
        }
        
        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 20px 25px;
            border: 2px solid rgba(255,255,255,0.3);
            border-radius: 18px;
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(12px);
            color: #fff;
            font-size: 1.1rem;
            font-family: 'Poppins', sans-serif;
            transition: all 0.4s;
        }
        
        input[type="email"]::placeholder, input[type="password"]::placeholder {
            color: rgba(255,255,255,0.7);
        }
        
        input[type="email"]:focus, input[type="password"]:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 25px rgba(0,123,255,0.4);
            background: rgba(255,255,255,0.18);
            transform: translateY(-2px);
        }

        /* PERFECT BLUE LOGIN BUTTON */
        button {
            width: 100%;
            padding: 22px 35px;
            background: linear-gradient(135deg, #007bff 0%, #0056b3 50%, #007bff 100%);
            color: #fff !important;
            border: 3px solid rgba(255,255,255,0.4) !important;
            border-radius: 25px !important;
            font-size: 1.4rem !important;
            font-weight: 800 !important;
            cursor: pointer !important;
            text-transform: uppercase !important;
            letter-spacing: 1.5px !important;
            box-shadow: 0 18px 45px rgba(0,123,255,0.5) !important;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94) !important;
            position: relative !important;
            overflow: hidden !important;
            font-family: 'Poppins', sans-serif !important;
            margin-top: 10px !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            gap: 12px !important;
            text-shadow: 0 2px 10px rgba(0,0,0,0.3) !important;
        }
        
        button:hover {
            transform: translateY(-10px) scale(1.03) !important;
            box-shadow: 0 30px 65px rgba(0,123,255,0.7) !important;
            background: linear-gradient(135deg, #0056b3 0%, #007bff 50%, #0056b3 100%) !important;
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
        
        .register-link {
            text-align: center;
            margin-top: 30px;
            padding-top: 25px;
            border-top: 1px solid rgba(255,255,255,0.2);
        }
        
        .register-link a {
            color: #007bff;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .register-link a:hover {
            text-shadow: 0 0 15px rgba(0,123,255,0.8);
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
            .login-container {
                margin: 20px;
                padding: 45px 35px;
            }
            
            .login-container h2 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2><i class="fas fa-user"></i> User Login</h2>
        
        <% 
        String error = request.getParameter("error");
        if(error != null) {
        %>
            <div class="error">
                <i class="fas fa-exclamation-triangle"></i>
                <%= error %>
            </div>
        <% } %>
        
        <form action="UserLogin" method="post">
            <div class="form-group">
                <label><i class="fas fa-envelope"></i> Email</label>
                <input type="email" name="email" placeholder="Enter your email" required>
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-lock"></i> Password</label>
                <input type="password" name="password" placeholder="Enter your password" required>
            </div>
            
            <button type="submit">
                <i class="fas fa-sign-in-alt"></i>
                Login Securely
            </button>
        </form>

        <div class="register-link">
            New user? <a href="user_register.jsp">Register here</a>
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
