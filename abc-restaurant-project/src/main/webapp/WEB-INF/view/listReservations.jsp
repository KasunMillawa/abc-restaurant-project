<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Reservations</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="mb-4 text-center">Reservation List</h1>
        
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>No. of People</th>
                        <th>Message</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="reservation" items="${reservations}">
                        <tr>
                            <td>${reservation.reservationId}</td>
                            <td>${reservation.name}</td>
                            <td>${reservation.email}</td>
                            <td>${reservation.phone}</td>
                            <td>${reservation.date}</td>
                            <td>${reservation.time}</td>
                            <td>${reservation.people}</td>
                            <td>${reservation.message}</td>
                            <td>
                                <span class="badge badge-pill 
                                    <c:choose>
                                        <c:when test="${reservation.status == 'Accepted'}">badge-success</c:when>
                                        <c:when test="${reservation.status == 'Rejected'}">badge-danger</c:when>
                                        <c:otherwise>badge-warning</c:otherwise>
                                    </c:choose>">
                                    ${reservation.status}
                                </span>
                            </td>
                            <td>
                                <a href="reservation?action=accept&id=${reservation.reservationId}" class="btn btn-sm btn-success">Accept</a>
                                <a href="reservation?action=reject&id=${reservation.reservationId}" class="btn btn-sm btn-danger">Reject</a>
                                <a href="reservation?action=delete&id=${reservation.reservationId}" class="btn btn-sm btn-warning">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
