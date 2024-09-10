<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery List</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Gallery List</h1>

        <!-- Gallery Table -->
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="gallery" items="${galleries}">
                        <tr>
                            <td>${gallery.galleryId}</td>
                            <td><img src="${gallery.image}" alt="Gallery Image" class="img-thumbnail" style="width: 100px; height: auto;"></td>
                            <td class="actions">
                                <a href="gallery?action=edit&id=${gallery.galleryId}" class="btn btn-sm btn-primary">Edit</a>
                                <a href="gallery?action=delete&id=${gallery.galleryId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this image?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Add New Image Button -->
        <div class="text-center">
            <a href="gallery?action=add" class="btn btn-success">Add New Image</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
