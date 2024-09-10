<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Offer List</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h1 class="mb-4">Offer List</h1>
    <table class="table table-bordered table-striped">
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
            <c:forEach var="offer" items="${offers}">
                <tr>
                    <td>${offer.offerId}</td>
                    <td>${offer.name}</td>
                    <td><img src="${offer.image}" alt="Offer Image" width="80" class="img-thumbnail"></td>
                    <td>${offer.description}</td>
                    <td>
                        <a href="offer?action=edit&id=${offer.offerId}" class="btn btn-info btn-sm">Edit</a>
                        <a href="offer?action=delete&id=${offer.offerId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this offer?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <a href="offer?action=add" class="btn btn-success">Add New Offer</a>
</body>
</html>
