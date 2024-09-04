<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="styles/admin.css">
</head>
<body>
<%@ include file="WEB-INF/includes/header.jsp" %>
<div class="login-container">
    <h1>Admin Login</h1>
    <form action="admin?action=login" method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>
        </div>
        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>
        <button type="submit">Login</button>
    </form>
</div>
<%@ include file="WEB-INF/includes/footer.jsp" %>
</body>
</html>
