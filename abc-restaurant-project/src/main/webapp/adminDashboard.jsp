<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles/admin.css">
    <style>
        /* General Page Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f4f4f4;
        }

        /* Header Styling */
        .header {
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

        .header a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

        /* Sidebar Styling */
        .sidebar {
            background-color: #333; /* Updated color */
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar a {
            padding: 15px 20px;
            text-decoration: none;
            color: white;
            font-size: 18px;
            display: block;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #ff4949; /* Updated color */
        }

        /* Main Content Styling */
        .main-content {
            margin-left: 250px; /* Space for the sidebar */
            padding: 20px;
            flex: 1;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .main-content h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333; /* Updated color */
        }

        .admin-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .admin-actions a {
            display: block;
            width: calc(33.333% - 20px);
            padding: 15px;
            background-color: #ff6b6b; /* Updated color */
            color: white;
            text-decoration: none;
            text-align: center;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .admin-actions a:hover {
            background-color: #ff4949; /* Updated color */
        }

        /* Footer Styling */
        .footer {
            background-color: #333; /* Updated color */
            color: white;
            text-align: center;
            padding: 15px;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        /* Media Queries for Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                box-shadow: none;
            }

            .main-content {
                margin-left: 0;
            }

            .admin-actions a {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <a href="#">Dashboard</a>
        <a href="admin?action=listProducts">Manage Products</a>
        <a href="admin?action=listCustomers">Manage Customers</a>
        <a href="admin?action=listStaff">Manage Staff</a>
        <a href="admin?action=listReservations">Manage Reservations</a>
        <a href="admin?action=listQueries">Manage Queries</a>
        <a href="admin?action=listOrders">Manage Orders</a>
        <a href="admin?action=listServices">Manage Services</a>
        <a href="admin?action=listOffers">Manage Offers</a>
        <a href="admin?action=listGalleries">Manage Galleries</a>
        <a href="admin?action=logout">Logout</a>
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <div class="header">
            <a href="index.html">Home</a>
            <h1>Welcome, Admin!</h1>
        </div>

        <!-- Admin Actions -->
        <div class="admin-actions">
            <a href="admin?action=listProducts">Manage Products</a>
            <a href="admin?action=listCustomers">Manage Customers</a>
            <a href="admin?action=listStaff">Manage Staff</a>
            <a href="admin?action=listReservations">Manage Reservations</a>
            <a href="admin?action=listQueries">Manage Queries</a>
            <a href="admin?action=listOrders">Manage Orders</a>
            <a href="admin?action=listServices">Manage Services</a>
            <a href="admin?action=listOffers">Manage Offers</a>
            <a href="admin?action=listGalleries">Manage Galleries</a>
            <a href="admin?action=logout">Logout</a>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        <p>&copy; 2024 ABC Restaurant. All rights reserved.</p>
    </div>

</body>
</html>
