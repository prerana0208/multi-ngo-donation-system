<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Login - Multi-NGO System</title>
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
            min-height: 100vh;
            padding: 20px;
        }

        /* NO NAVBAR - Clean look */

        /* Login Container */
        .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            padding: 50px 40px;
            width: 100%;
            max-width: 420px;
            border: 1px solid rgba(255,255,255,0.2);
            box-shadow: 0 15px 40px rgba(0,0,0,0.3);
        }

        .login-card h2 {
            text-align: center;
            font-size: 2rem;
            font-weight: 700;
            color: #ffd700;
            margin-bottom: 30px;
            text-shadow: 0 2px 10px rgba(0,0,0,0.5);
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #fff;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid rgba(255,255,255,0.3);
            border-radius: 10px;
            background: rgba(255,255,255,0.1);
            color: #fff;
            font-size: 1rem;
            transition: all 0.3s;
        }

        .form-group input::placeholder {
            color: rgba(255,255,255,0.7);
        }

        .form-group input:focus {
            outline: none;
            border-color: #ffd700;
            box-shadow: 0 0 15px rgba(255,215,0,0.3);
            background: rgba(255,255,255,0.15);
        }

        .login-btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(45deg, #ffd700, #ffed4a);
            color: #1a1a2e;
            border: none;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(255,215,0,0.4);
        }

        .error {
            background: rgba(255,100,100,0.2);
            border: 1px solid rgba(255,100,100,0.4);
            color: #fff;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 500;
        }

        .back-link {
            text-align: center;
            margin-top: 25px;
        }

        .back-link a {
            color: #ffd700;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        .back-link a:hover {
            text-shadow: 0 0 10px rgba(255,215,0,0.8);
        }

        @media (max-width: 768px) {
            .login-card {
                margin: 20px;
                padding: 40px 30px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <h2><i class="fas fa-user-shield"></i> Admin Login</h2>
            
            <% 
            String error = request.getParameter("error");
            if(error != null) {
            %>
                <div class="error"><%= error %></div>
            <% } %>
            
            <form action="AdminLogin" method="post">
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" placeholder="Enter your email" required>
                </div>
                
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Enter your password" required>
                </div>
                
                <button type="submit" class="login-btn">Login</button>
            </form>
            
            <div class="back-link">
                <a href="index.jsp">← Back to Home</a>
            </div>
        </div>
    </div>
</body>
</html>
