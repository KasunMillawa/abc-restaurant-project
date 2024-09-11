<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        /* General Body and Form Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            width: 100%;
            max-width: 400px;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        div {
            width: 100%;
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #ff6b6b;
            background-color: #fff;
            box-shadow: 0 0 8px rgba(255, 107, 107, 0.5);
        }

        input[type="submit"] {
            background-color: #ff6b6b;
            border: none;
            color: white;
            padding: 10px 25px;
            text-transform: uppercase;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #ff4949;
        }

        /* Link styling */
        .register-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #ff6b6b;
            text-decoration: none;
        }

        .register-link:hover {
            text-decoration: underline;
        }

        /* Error Message Styling */
        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form action="customer" method="post">
        <h1>Customer Login</h1>
        <input type="hidden" name="action" value="login"/>
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required/>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required/>
        </div>
        <div>
            <input type="submit" value="Login"/>
        </div>
        <!-- Moved the link inside the form for proper alignment -->
        <a href="customer?action=register" class="register-link">Don't have an account? Register here.</a>
    </form>
    <c:if test="${not empty error}">
        <p class="error-message">${error}</p>
    </c:if>
</body>
</html>
