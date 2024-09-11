<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Reservation</title>
    <style>
        /* General Body and Form Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        form {
            max-width: 600px;
            width: 100%;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        div {
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="time"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: #f9f9f9;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="date"]:focus,
        input[type="time"]:focus,
        input[type="number"]:focus,
        textarea:focus {
            border-color: #ff6b6b;
            background-color: #fff;
            box-shadow: 0 0 8px rgba(255, 107, 107, 0.5);
        }

        textarea {
            resize: none;
            height: 150px;
        }

        button[type="submit"] {
            background-color: #ff6b6b;
            border: none;
            color: white;
            padding: 10px 25px;
            text-transform: uppercase;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        button[type="submit"]:hover {
            background-color: #ff4949;
        }

        /* Add spacing between form elements */
        div {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form action="reservation?action=add" method="post">
        <h1>Add Reservation</h1>
        <div>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        <div>
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required>
        </div>
        <div>
            <label for="time">Time:</label>
            <input type="time" id="time" name="time" required>
        </div>
        <div>
            <label for="people">Number of People:</label>
            <input type="number" id="people" name="people" required>
        </div>
        <div>
            <label for="message">Message:</label>
            <textarea id="message" name="message" required></textarea>
        </div>
        <div>
            <button type="submit">Add Reservation</button>
        </div>
    </form>
</body>
</html>
