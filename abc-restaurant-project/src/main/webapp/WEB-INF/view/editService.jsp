<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Service</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Edit Service</h1>
        <form action="service?action=edit" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${service.serviceId}">
            
            <div class="form-group">
                <label for="serviceName">Service Name:</label>
                <input type="text" id="serviceName" name="serviceName" class="form-control" value="${service.serviceName}" required>
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" class="form-control" rows="4" required>${service.description}</textarea>
            </div>
            
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" id="image" name="image" class="form-control-file">
                <img src="${service.image}" alt="Current Service Image" class="img-thumbnail mt-2" width="150">
            </div>
            
            <button type="submit" class="btn btn-primary">Update Service</button>
        </form>
    </div>
</body>
</html>
