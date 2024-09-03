<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Staff | ABC Restaurant</title>
</head>
<body>
    <!-- Header -->
    <div>ABC RESTAURANT - STAFF REGISTRATION</div>

    <!-- Registration Form Container -->
    <div>
        <h1>Register Staff</h1>
        <form action="staff?action=register" method="post">
            <div>
                <label for="name">Name</label>
                <input type="text" name="name" id="name" required>
            </div>
            <div>
                <label for="email">Email</label>
                <input type="email" name="email" id="email" required>
            </div>
            <div>
                <label for="password">Password</label>
                <input type="password" name="password" id="password" required>
            </div>
            <div>
                <label for="phoneNumber">Phone Number</label>
                <input type="text" name="phoneNumber" id="phoneNumber" required>
            </div>
            <!-- Removed Role Input Field -->
            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
