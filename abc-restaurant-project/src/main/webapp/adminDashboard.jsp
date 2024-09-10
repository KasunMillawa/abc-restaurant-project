<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="d-flex flex-column min-vh-100 bg-light">

    <!-- Sidebar Navigation -->
    <nav class="bg-dark text-white p-3 position-fixed vh-100" style="width: 250px;">
        <h4 class="text-center">Admin Panel</h4>
        <ul class="nav flex-column">
            <li class="nav-item"><a href="#" class="nav-link text-white">Dashboard</a></li>
            <li class="nav-item"><a href="admin?action=listProducts" class="nav-link text-white">Manage Products</a></li>
            <li class="nav-item"><a href="admin?action=listCustomers" class="nav-link text-white">Manage Customers</a></li>
            <li class="nav-item"><a href="admin?action=listStaff" class="nav-link text-white">Manage Staff</a></li>
            <li class="nav-item"><a href="admin?action=listReservations" class="nav-link text-white">Manage Reservations</a></li>
            <li class="nav-item"><a href="admin?action=listQueries" class="nav-link text-white">Manage Queries</a></li>
            <li class="nav-item"><a href="admin?action=listOrders" class="nav-link text-white">Manage Orders</a></li>
            <li class="nav-item"><a href="admin?action=listServices" class="nav-link text-white">Manage Services</a></li>
            <li class="nav-item"><a href="admin?action=listOffers" class="nav-link text-white">Manage Offers</a></li>
            <li class="nav-item"><a href="admin?action=listGalleries" class="nav-link text-white">Manage Galleries</a></li>
            <li class="nav-item"><a href="admin?action=logout" class="nav-link text-white">Logout</a></li>
        </ul>
    </nav>

    <!-- Main Content Area -->
    <div class="main-content bg-white p-4" style="margin-left: 250px;">
        <header class="mb-4">
            <h1 class="h3">Welcome, Admin!</h1>
        </header>

        <!-- Admin Actions -->
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card text-white bg-danger">
                    <div class="card-body text-center">
                        <a href="admin?action=listProducts" class="text-white text-decoration-none">Manage Products</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card text-white bg-danger">
                    <div class="card-body text-center">
                        <a href="admin?action=listCustomers" class="text-white text-decoration-none">Manage Customers</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card text-white bg-danger">
                    <div class="card-body text-center">
                        <a href="admin?action=listStaff" class="text-white text-decoration-none">Manage Staff</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card text-white bg-danger">
                    <div class="card-body text-center">
                        <a href="admin?action=listReservations" class="text-white text-decoration-none">Manage Reservations</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card text-white bg-danger">
                    <div class="card-body text-center">
                        <a href="admin?action=listQueries" class="text-white text-decoration-none">Manage Queries</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card text-white bg-danger">
                    <div class="card-body text-center">
                        <a href="admin?action=listOrders" class="text-white text-decoration-none">Manage Orders</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card text-white bg-danger">
                    <div class="card-body text-center">
                        <a href="admin?action=listServices" class="text-white text-decoration-none">Manage Services</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card text-white bg-danger">
                    <div class="card-body text-center">
                        <a href="admin?action=listOffers" class="text-white text-decoration-none">Manage Offers</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card text-white bg-danger">
                    <div class="card-body text-center">
                        <a href="admin?action=listGalleries" class="text-white text-decoration-none">Manage Galleries</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card text-white bg-danger">
                    <div class="card-body text-center">
                        <a href="admin?action=logout" class="text-white text-decoration-none">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="bg-dark text-white text-center p-3 mt-auto">
        <p>&copy; 2024 ABC Restaurant. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
