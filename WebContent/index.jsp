<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NGO Donation Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
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

        /* Compact Navbar */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: transparent;
            backdrop-filter: blur(10px);
            z-index: 1000;
            padding: 15px 0;
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: center;
        }

        .logo {
            font-size: clamp(1.6rem, 4vw, 2rem);
            font-weight: 600;
            color: #ffd700;
            text-shadow: 0 2px 10px rgba(255,215,0,0.6);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo i {
            font-size: 2rem;
            color: #28a745;
        }

       
        .hero {
            min-height: 70vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 100px 20px 40px;
            max-width: 800px;
            margin: 0 auto;
        }

        .hero h1 {
            font-size: clamp(2.2rem, 6vw, 3rem);
            font-weight: 700;
            margin-bottom: 15px;
            color: #fff;
            text-shadow: 0 2px 15px rgba(0,0,0,0.8);
            line-height: 1.2;
        }

        .hero .subtitle {
            font-size: clamp(1rem, 2.5vw, 1.2rem);
            color: rgba(255,255,255,0.9);
            margin-bottom: 35px;
            font-weight: 400;
            max-width: 600px;
        }

        
        .quote {
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(15px);
            padding: 25px 35px;
            border-radius: 15px;
            margin-bottom: 40px;
            max-width: 650px;
            width: 90%;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            border-left: 4px solid #ffd700;
        }

        .quote-text {
            font-size: clamp(1.1rem, 2.5vw, 1.3rem);
            font-style: italic;
            color: rgba(255,255,255,0.95);
            line-height: 1.4;
            margin-bottom: 12px;
        }

        .quote-author {
            font-size: 1rem;
            color: #ffd700;
            font-weight: 500;
            text-align: right;
        }

       
        .stats {
            display: flex;
            justify-content: center;
            gap: 40px;
            margin: 40px auto 35px;
            flex-wrap: wrap;
        }

        .stat {
            text-align: center;
            min-width: 100px;
        }

        .stat-number {
            font-size: clamp(1.6rem, 4vw, 2.2rem);
            font-weight: 700;
            color: #ffd700;
            display: block;
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 0.85rem;
            color: rgba(255,255,255,0.8);
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 500;
        }

        
        .main-cta {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: linear-gradient(135deg, #28a745, #20c997);
            color: white;
            padding: 16px 40px;
            font-size: clamp(1rem, 2vw, 1.2rem);
            font-weight: 600;
            text-decoration: none;
            border-radius: 40px;
            margin-bottom: 50px;
            box-shadow: 0 10px 30px rgba(40,167,69,0.3);
            border: 2px solid rgba(255,255,255,0.2);
            transition: all 0.3s ease;
        }

        .main-cta:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(40,167,69,0.5);
        }

       
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            max-width: 800px;
            width: 100%;
            margin: 0 auto 30px;
        }

        .feature-card {
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(12px);
            padding: 35px 25px;
            border-radius: 18px;
            text-align: center;
            border: 1px solid rgba(255,255,255,0.15);
            transition: all 0.3s ease;
            text-decoration: none;
            color: #fff;
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }

        .feature-card:hover {
            transform: translateY(-8px);
            background: rgba(255,255,255,0.18);
            border-color: rgba(255,215,0,0.4);
            box-shadow: 0 20px 50px rgba(0,0,0,0.4);
        }

        .feature-icon {
            font-size: 3rem;
            color: #ffd700;
            margin-bottom: 15px;
            display: block;
        }

        .feature-card h3 {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 12px;
            color: #fff;
        }

        .feature-card p {
            color: rgba(255,255,255,0.85);
            font-size: 0.95rem;
            line-height: 1.5;
        }

        
        @media (max-width: 768px) {
            .hero {
                min-height: 85vh;
                padding: 90px 15px 30px;
            }
            
            .hero h1 {
                margin-bottom: 12px;
            }
            
            .quote {
                width: 95%;
                padding: 20px 25px;
                margin-bottom: 30px;
            }
            
            .stats {
                gap: 25px;
                margin: 30px auto 25px;
            }
            
            .main-cta {
                padding: 14px 35px;
                margin-bottom: 40px;
            }
            
            .features {
                grid-template-columns: 1fr;
                gap: 25px;
                margin: 0 auto 20px;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <a href="#" class="logo">
                <i class="fas fa-hand-holding-heart"></i>
                NGO Portal
            </a>
        </div>
    </nav>

    <section class="hero">
        <h1>Make a Difference</h1>
        <p class="subtitle">Join thousands supporting verified NGOs across India</p>

        <div class="quote">
            <div class="quote-text">"No act of kindness, no matter how small, is ever wasted."</div>
            <div class="quote-author">- Your generosity creates hope</div>
        </div>

        <div class="stats">
            <div class="stat">
                <span class="stat-number">500+</span>
                <span class="stat-label">Verified NGOs</span>
            </div>
            <div class="stat">
                <span class="stat-number">₹50Cr+</span>
                <span class="stat-label">Total Donated</span>
            </div>
            <div class="stat">
                <span class="stat-number">100K+</span>
                <span class="stat-label">Happy Donors</span>
            </div>
        </div>

        <a href="user_register.jsp" class="main-cta">
            <i class="fas fa-heart"></i> Start Donating
        </a>

        <div class="features">
            <a href="adminlogin.jsp" class="feature-card">
                <i class="fas fa-user-shield feature-icon"></i>
                <h3>Admin Panel</h3>
                <p>Manage NGOs & monitor donations</p>
            </a>

            <a href="ngoregister.jsp" class="feature-card">
                <i class="fas fa-building-columns feature-icon"></i>
                <h3>NGO Register</h3>
                <p>Register to receive donations</p>
            </a>
        </div>
    </section>
</body>
</html>
