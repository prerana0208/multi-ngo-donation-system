<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reject NGO - Multi-NGO System</title>
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

        .reject-container {
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

        .reject-container h3 {
            font-size: 2.4rem;
            font-weight: 700;
            color: #ff6b6b;
            margin-bottom: 20px;
            text-shadow: 0 3px 15px rgba(255,107,107,0.5);
        }

        .reject-container p {
            font-size: 1.15rem;
            color: rgba(255,255,255,0.9);
            margin-bottom: 40px;
            line-height: 1.6;
        }

        input[type="submit"] {
            width: 100%;
            padding: 22px 35px;
            background: linear-gradient(135deg, #ff6b6b 0%, #ff8e8e 50%, #ff5252 100%);
            color: #fff !important;
            border: 3px solid rgba(255,255,255,0.4) !important;
            border-radius: 25px !important;
            font-size: 1.4rem !important;
            font-weight: 800 !important;
            cursor: pointer !important;
            text-transform: uppercase !important;
            letter-spacing: 1.5px !important;
            box-shadow: 0 18px 45px rgba(255,107,107,0.5) !important;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94) !important;
            position: relative !important;
            overflow: hidden !important;
            font-family: 'Poppins', sans-serif !important;
            margin-top: 10px !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            gap: 12px !important;
            text-shadow: none !important;
            border: none !important;
        }

        input[type="submit"]:hover {
            transform: translateY(-10px) scale(1.03) !important;
            box-shadow: 0 30px 65px rgba(255,107,107,0.7) !important;
            background: linear-gradient(135deg, #ff8e8e 0%, #ff6b6b 50%, #ff5252 100%) !important;
        }

        a[href="pendingngo.jsp"] {
            display: inline-block;
            margin-top: 25px;
            color: #ffd700;
            text-decoration: none;
            font-weight: 600;
            padding: 15px 35px;
            border: 2px solid rgba(255,215,0,0.4);
            border-radius: 25px;
            background: rgba(255,215,0,0.1);
            backdrop-filter: blur(10px);
            transition: all 0.4s ease;
            font-size: 1.1rem;
        }

        a[href="pendingngo.jsp"]:hover {
            background: #ffd700;
            color: #1a1a2e;
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(255,215,0,0.5);
        }

        @media (max-width: 768px) {
            .reject-container {
                margin: 20px;
                padding: 45px 35px;
            }
            
            .reject-container h3 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="reject-container">
        <% int ngo_id = Integer.parseInt(request.getParameter("id")); %>
        
        <h3>Reject NGO</h3>
        <p>Are you sure?</p>
        
        <form action="Reject" method="post">
            <input type="hidden" name="ngo_id" value="<%=ngo_id%>">
            <input type="submit" value="Reject">
        </form>
        
        <a href="pendingngo.jsp">Cancel</a>
    </div>
</body>
</html>
