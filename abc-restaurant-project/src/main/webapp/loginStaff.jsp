<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Login | ABC Restaurant</title>
</head>
<body>
    <!-- Header -->
    <div>ABC RESTAURANT - STAFF</div>

    <!-- Login Form Container -->
    <div>
        <h1>STAFF LOGIN</h1>
        <form action="staff?action=login" method="post">
            <div>
                <label for="email">Email</label>
                <input type="email" name="email" id="email" required>
            </div>
            <div>
                <label for="password">Password</label>
                <input type="password" name="password" id="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
        <c:if test="${not empty error}">
            <div>${error}</div>
        </c:if>
        <div>
            <p>Not registered? <a href="staff?action=register">Sign Up</a></p>
        </div>
    </div>
</body>
</html>
