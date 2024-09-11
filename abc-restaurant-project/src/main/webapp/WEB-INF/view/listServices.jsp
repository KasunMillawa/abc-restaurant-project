<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Service List</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Service List</h1>
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="service" items="${services}">
                    <tr>
                        <td>${service.serviceId}</td>
                        <td>${service.serviceName}</td>
                        <td>
                            <img src="${service.image}" alt="Service Image" class="img-thumbnail" style="width: 150px; height: 150px;"> <!-- Fixed size -->
                        </td>
                        <td>${service.description}</td>
                        <td>
                            <a href="service?action=edit&id=${service.serviceId}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="service?action=delete&id=${service.serviceId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this service?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="text-center mt-4">
            <a href="service?action=add" class="btn btn-primary">Add New Service</a>
        </div>
    </div>
</body>
</html>
