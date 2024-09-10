<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Offer</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h1 class="mb-4">Edit Offer</h1>
    <form action="offer?action=edit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${offer.offerId}">
        <div class="form-group">
            <label for="name">Offer Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="${offer.name}" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" class="form-control" name="description" rows="4" required>${offer.description}</textarea>
        </div>
        <div class="form-group">
            <label for="image">Image:</label>
            <input type="file" class="form-control-file" id="image" name="image">
            <br>
            <img src="${offer.image}" alt="Current Offer Image" class="img-thumbnail" width="100">
        </div>
        <button type="submit" class="btn btn-primary">Update Offer</button>
    </form>
</body>
</html>
