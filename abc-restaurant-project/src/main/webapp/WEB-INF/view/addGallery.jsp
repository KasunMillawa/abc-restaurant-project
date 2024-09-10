<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Gallery Image</title>
    <style>
        .container { width: 50%; margin: 0 auto; padding: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input[type="file"] { width: 100%; padding: 8px; }
        button { padding: 10px 15px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="container">
        <h1 style="text-align:center;">Add Gallery Image</h1>
        <form action="gallery?action=add" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" id="image" name="image" required>
            </div>
            <div style="text-align:center;">
                <button type="submit">Add Image</button>
            </div>
        </form>
    </div>
</body>
</html>
