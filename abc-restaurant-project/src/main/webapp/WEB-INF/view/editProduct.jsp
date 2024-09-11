<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h1 class="mb-4">Edit Product</h1>
    <form action="product?action=edit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${product.productId}">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" class="form-control" name="description" rows="4" required>${product.description}</textarea>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" step="0.01" class="form-control" id="price" name="price" value="${product.price}" required>
        </div>
        <div class="form-group">
            <label for="category">Category:</label>
            <select id="category" class="form-control" name="category" required>
                <option value="Breakfast" ${product.category == 'Breakfast' ? 'selected' : ''}>Breakfast</option>
                <option value="Lunch" ${product.category == 'Lunch' ? 'selected' : ''}>Lunch</option>
                <option value="Dinner" ${product.category == 'Dinner' ? 'selected' : ''}>Dinner</option>
                <option value="Dessert" ${product.category == 'Dessert' ? 'selected' : ''}>Dessert</option>
                <option value="Beverages" ${product.category == 'Beverages' ? 'selected' : ''}>Beverages</option>
            </select>
        </div>
        <div class="form-group">
            <label for="image">Image:</label>
            <input type="file" class="form-control-file" id="image" name="image">
            <img src="${product.imagePath}" alt="Current Product Image" class="img-thumbnail mt-2" width="100">
        </div>
        <button type="submit" class="btn btn-primary">Update Product</button>
    </form>
</body>
</html>
