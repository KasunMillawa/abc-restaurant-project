<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Gallery Image</title>
    <style>
        .container { width: 50%; margin: 0 auto; padding: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input[type="file"] { width: 100%; padding: 8px; }
        img { margin-top: 10px; width: 150px; }
        button { padding: 10px 15px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="container">
        <h1 style="text-align:center;">Edit Gallery Image</h1>
        <form action="gallery?action=edit" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${gallery.galleryId}">
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" id="image" name="image" required>
                <img src="${gallery.image}" alt="Current Gallery Image">
            </div>
            <div style="text-align:center;">
                <button type="submit">Update Image</button>
            </div>
        </form>
    </div>
</body>
</html>
