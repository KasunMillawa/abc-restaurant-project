<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles/admin.css">
</head>
<body>
<%@ include file="WEB-INF/includes/header.jsp" %>
<div class="dashboard-container">
    <h1>Welcome, Admin!</h1>
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
<%@ include file="WEB-INF/includes/footer.jsp" %>
</body>
</html>
