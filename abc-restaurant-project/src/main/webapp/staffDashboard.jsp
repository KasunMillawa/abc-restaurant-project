<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (session.getAttribute("staff") == null) {
        response.sendRedirect("staff?action=login"); // Redirect to login if the staff object is not found
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Staff Dashboard - ABC Restaurant</title>
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <div>
            <a href="#">Staff Dashboard</a>
            <div>
                <ul>
                    <li><a href="staff?action=list">Manage Staff</a></li>
                    <li><a href="customer?action=list">Manage Customers</a></li>
                    <li><a href="orders.jsp">View Orders</a></li>
                    <li><a href="staff?action=logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Dashboard Content -->
    <div>
        <h1>Welcome, <c:out value="${staff.name}"/>!</h1>
        <p>Use the options above to manage staff, customers, and orders.</p>

        <!-- Example Sections -->
        <div>
            <div>
                <h5>Manage Staff</h5>
                <p>Add, edit, or remove staff members.</p>
                <a href="staff?action=list">Go to Staff Management</a>
            </div>
            <div>
                <h5>Manage Customers</h5>
                <p>View and manage customer profiles and orders.</p>
                <a href="customer?action=list">Go to Customer Management</a>
            </div>
            <div>
                <h5>View Orders</h5>
                <p>Track and manage customer orders.</p>
                <a href="orders.jsp">View Orders</a>
            </div>
        </div>
    </div>
</body>
</html>
