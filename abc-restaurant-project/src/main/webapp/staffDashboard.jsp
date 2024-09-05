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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Dashboard - ABC Restaurant</title>
    <style>
        /* General Body Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Navigation Bar Styling */
        nav {
            background-color: #333; /* Updated color */
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            margin-right: 15px;
        }

        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        nav ul li {
            margin-left: 15px;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: #ff6b6b; /* Updated color */
        }

        /* Dashboard Content Styling */
        .dashboard-content {
            padding: 20px;
            margin: auto;
            max-width: 1200px;
            width: 100%;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .dashboard-content h1 {
            color: #333; /* Updated color */
            margin-bottom: 20px;
        }

        .dashboard-content p {
            color: #555;
            margin-bottom: 20px;
        }

        .dashboard-content .section {
            margin-bottom: 20px;
        }

        .dashboard-content .section h5 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #ff6b6b; /* Updated color */
        }

        .dashboard-content .section a {
            color: #3498db; /* Updated color */
            text-decoration: none;
            font-weight: bold;
        }

        .dashboard-content .section a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <a href="#">Staff Dashboard</a>
        <div>
            <ul>
                <li><a href="staff?action=list">Manage Staff</a></li>
                <li><a href="customer?action=list">Manage Customers</a></li>
                <li><a href="orders.jsp">View Orders</a></li>
                <li><a href="staff?action=logout">Logout</a></li>
            </ul>
        </div>
    </nav>

    <!-- Dashboard Content -->
    <div class="dashboard-content">
        <h1>Welcome, <c:out value="${staff.name}"/>!</h1>
        <p>Use the options above to manage staff, customers, and orders.</p>

        <!-- Example Sections -->
        <div class="section">
            <h5>Manage Staff</h5>
            <p>Add, edit, or remove staff members.</p>
            <a href="staff?action=list">Go to Staff Management</a>
        </div>
        <div class="section">
            <h5>Manage Customers</h5>
            <p>View and manage customer profiles and orders.</p>
            <a href="customer?action=list">Go to Customer Management</a>
        </div>
        <div class="section">
            <h5>View Orders</h5>
            <p>Track and manage customer orders.</p>
            <a href="orders.jsp">View Orders</a>
        </div>
    </div>
</body>
</html>
